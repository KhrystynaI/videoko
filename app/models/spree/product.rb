module Spree
  class Product < Spree::Base
    extend FriendlyId
    include Spree::ProductScopes

    searchkick callbacks: :async, index_name: "#{Rails.application.class.parent_name.parameterize.underscore}_spree_products",
     word_middle: [:name], merge_mappings: true,

    mappings: {
      properties:{
        name:{
          type: "keyword",
          fields:{
            analyzed:{
              type: "text",
              analyzer:"custom_analyzer"
            }
          }
        }
                        }

      },
    settings: {
      analysis:{
        analyzer:{
          custom_analyzer:{
            filter:[
              "lowercase",
              "asciifolding"
            ],
          tokenizer: "custom_tokenizer",
          type: "custom"
        }
      },
      tokenizer:{
        custom_tokenizer:{
          type: "ngram",
          min_gram: 2,
          max_gram: 50,
          token_chars:[
            "letter",
            "digit"
          ]
        }
      }

    }
    }

    def search_data
      if self.deleted_at.blank?
    json = {
      name: name.gsub('’', '').gsub("'", '').downcase.gsub(/\s+/, "").gsub('-', ''),
      active: available?,
      show: show,
      existence: existence,
      created_at: created_at,
      updated_at: updated_at,
      taxon_ids: taxon_and_ancestors.map(&:id),
      taxon_count: taxon_count,
      taxonomy_ids: taxonomy_ids,
      price_variant: self.variants.map{|v|v.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id).amount if v.prices.count >0}
    }
  else
    json={
     deleted_at: deleted_at,
     show: false
    }
  end
  if self.deleted_at.blank?
    if self.variants.count > 0 && self.option_types.count > 0
      array =  self.variants.map do |variant|

    keys = variant.option_values.map{|c|c.option_type.presentation.downcase.gsub(/\s+/, "").gsub('-', '').gsub('’', '').gsub("'", '')}
    values = variant.option_values.map{|c|c.id}
    hash = Hash[keys.zip values]
  end
    a = array.reduce({}) {|h,pairs| pairs.each {|k,v| (h[k] ||= []) << v}; h}
    json.merge!(a)

    end
    if  self.prices.count > 0
    if self.default_variant.prices.blank?
    price_hash = Hash[price: self.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id).amount]
  else
      price_hash = Hash[price: self.default_variant.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id).amount]
    end
    json.merge!(price_hash)
  end
end
    json
  end

  def taxon_and_ancestors
    taxons.map(&:self_and_ancestors).flatten.uniq
  end

  def taxonomy_ids
    taxons.map{|tax|tax.taxonomy_id}.flatten.uniq
  end

  def taxon_count
    self.taxons.count
  end

    friendly_id :slug_candidates, use: :history

    acts_as_paranoid
    default_scope {includes(:translations)}

    # we need to have this callback before any dependent: :destroy associations
    # https://github.com/rails/rails/issues/3458
    before_destroy :ensure_no_line_items

    has_many :product_option_types, dependent: :destroy, inverse_of: :product
    has_many :option_types, through: :product_option_types
    has_many :product_properties, dependent: :destroy, inverse_of: :product
    has_many :properties, through: :product_properties

    has_many :classifications, dependent: :delete_all, inverse_of: :product
    has_many :taxons, through: :classifications, before_remove: :remove_taxon

    has_many :product_promotion_rules, class_name: 'Spree::ProductPromotionRule'
    has_many :promotion_rules, through: :product_promotion_rules, class_name: 'Spree::PromotionRule'

    has_many :promotions, through: :promotion_rules, class_name: 'Spree::Promotion'

    has_many :possible_promotions, -> { advertised.active }, through: :promotion_rules,
                                                             class_name: 'Spree::Promotion',
                                                             source: :promotion

    belongs_to :tax_category, class_name: 'Spree::TaxCategory'
    belongs_to :shipping_category, class_name: 'Spree::ShippingCategory', inverse_of: :products

    has_one :master,
            -> { where is_master: true },
            inverse_of: :product,
            class_name: 'Spree::Variant'

    has_many :variants,
             -> { where(is_master: false).order(:position) },
             inverse_of: :product,
             class_name: 'Spree::Variant'

    has_many :variants_including_master,
             -> { order(:position) },
             inverse_of: :product,
             class_name: 'Spree::Variant',
             dependent: :destroy

    has_many :prices, dependent: :destroy#, -> { order('spree_variants.position, spree_variants.id, currency') }, through: :variants

    accepts_nested_attributes_for :prices

    has_many :stock_items, through: :variants_including_master

    has_many :line_items, through: :variants_including_master
    has_many :offer_items, through: :variants_including_master
    has_many :orders, through: :line_items

    has_one_attached :video, dependent: :destroy

    has_many :variant_images, -> { order(:position) }, source: :images, through: :variants_including_master
    has_many :variant_images_without_master, -> { order(:position) }, source: :images, through: :variants
    has_one :volume, dependent: :destroy

    after_create :add_associations_from_prototype
    after_create :build_variants_from_option_values_hash, if: :option_values_hash

    after_destroy :punch_slug
    after_restore :update_slug_history

    after_initialize :ensure_master
    after_save :check_count_translate
    after_save :save_master
    after_save :check_default_variant_sku
    after_save :run_touch_callbacks, if: :anything_changed?
    after_save :reset_nested_changes
    after_touch :touch_taxons
    before_validation :normalize_slug, on: :update
    before_validation :validate_master
    before_save :update_empty_price
    before_save :update_existence_present

    with_options length: { maximum: 255 }, allow_blank: true do
      validates :meta_keywords
      validates :meta_title
    end
    with_options presence: true do
      validates :name
      validates :price, if: proc { Spree::Config[:require_master_price] }
    end

    validates :slug, presence: true, uniqueness: { allow_blank: true, case_sensitive: false }
    #validate :discontinue_on_must_be_later_than_available_on, if: -> { available_on && discontinue_on }

    attr_accessor :option_values_hash

    accepts_nested_attributes_for :product_properties, allow_destroy: true, reject_if: ->(pp) { pp[:property_name].blank? }

    alias options product_option_types

    self.whitelisted_ransackable_associations = %w[stores variants_including_master master variants]
    self.whitelisted_ransackable_attributes = %w[description name slug ] #discontinue_on]
    self.whitelisted_ransackable_scopes = %w[not_discontinued]

    [
      :sku, :currency, :weight, :height, :width, :depth, :is_master,
      :cost_currency, :amount_in, :cost_price, :price_in
    ].each do |method_name|
      delegate method_name, :"#{method_name}=", to: :find_or_build_master
    end

    delegate :display_amount, :display_price, :has_default_price?,
             :images, to: :find_or_build_master

    alias master_images images
    # Cant use short form block syntax due to https://github.com/Netflix/fast_jsonapi/issues/259
    def purchasable?
      variants_including_master.any?(&:purchasable?)
    end

    # Cant use short form block syntax due to https://github.com/Netflix/fast_jsonapi/issues/259
    def in_stock?
      variants_including_master.any?(&:in_stock?)
    end

    # Cant use short form block syntax due to https://github.com/Netflix/fast_jsonapi/issues/259
    def backorderable?
      variants_including_master.any?(&:backorderable?)
    end

    def find_or_build_master
      master || build_master
    end

    def update_existence_present
     if will_save_change_to_count_size? && changes_to_save[:count_size].last >=3
       self.existence = true
     elsif will_save_change_to_count_size? && changes_to_save[:count_size].last < 3
       self.existence = false
     end
    end

    def update_empty_price
      if will_save_change_to_empty_price? && changes_to_save[:empty_price] == [false, true]
        UpdateEmptyPriceJob.perform_later(self.id)
      end
    end

    # the master variant is not a member of the variants array
    def has_variants?
      variants.any?
    end

    def price_for_index(role_id: )

      if self.prices.count > 0

      if self.default_variant.prices.blank?
        self.prices.find_by(role_id: role_id).amount
      else
        if self.variants.count > 0
        self.variants.map{|c|c.prices.find_by(role_id: role_id).amount}
      else
        self.default_variant.prices.where(role_id: role_id).map{|c|c.amount}
      end
      end
     end
    end
    # Returns default Variant for Product
    # If `track_inventory_levels` is enabled it will try to find the first Variant
    # in stock or backorderable, if there's none it will return first Variant sorted
    # by `position` attribute
    # If `track_inventory_levels` is disabled it will return first Variant sorted
    # by `position` attribute
    #
    # @return [Spree::Variant]
    def default_variant
      #track_inventory = Spree::Config[:track_inventory_levels]

      #Rails.cache.fetch("spree/default-variant/#{cache_key_with_version}/#{track_inventory}") do
        #if track_inventory #&& variants.in_stock_or_backorderable.any?
          #variants.in_stock_or_backorderable.first
        #else
          has_variants? ? variants.first : master
        #end
      #end
    end

    # Returns default Variant ID for Product
    # @return [Integer]
    def default_variant_id
      default_variant.id
    end

    def tax_category
      super || TaxCategory.find_by(is_default: true)
    end

    def check_default_variant_sku
      if self.has_variants? && !self.sku.blank?
          self.variants.first.update(sku: self.sku)
      end
    end

    def check_count_translate
      if self.translations.where(locale: :ru).count > 1
        last = self.translations.where(locale: :ru).sort_by { |m| [m.created_at, m.updated_at].max }.reverse!.first
        self.translations.where(locale: :ru).map do |n|
           if n != last
             n.delete
            Spree::Product::Translation.unscoped do
               Spree::Product::Translation.where(id: n.id).delete_all
             end
           end
         end
      end
      if self.translations.where(locale: :uk).count > 1
        last = self.translations.where(locale: :uk).sort_by { |m| [m.created_at, m.updated_at].max }.reverse!.first
        self.translations.where(locale: :uk).each do |n|
          if n != last
            n.delete
           Spree::Product::Translation.unscoped do
              Spree::Product::Translation.where(id: n.id).delete_all
            end
          end
        end
      end
    end

    # Adding properties and option types on creation based on a chosen prototype
    attr_reader :prototype_id
    def prototype_id=(value)
      @prototype_id = value.to_i
    end

    # Ensures option_types and product_option_types exist for keys in option_values_hash
    def ensure_option_types_exist_for_values_hash
      return if option_values_hash.nil?

      required_option_type_ids = option_values_hash.keys.map(&:to_i)
      missing_option_type_ids = required_option_type_ids - option_type_ids
      missing_option_type_ids.each do |id|
        product_option_types.create(option_type_id: id)
      end
    end

    # for adding products which are closely related to existing ones
    # define "duplicate_extra" for site-specific actions, eg for additional fields
    def duplicate
      duplicator = ProductDuplicator.new(self)
      duplicator.duplicate
    end

    # use deleted? rather than checking the attribute directly. this
    # allows extensions to override deleted? if they want to provide
    # their own definition.
    def deleted?
      !!deleted_at
    end

    # determine if product is available.
    # deleted products and products with nil or future available_on date
    # are not available
    def available?
      !(available_on.nil? || available_on.future?)
    end


    def discontinue!
      update_attribute(:discontinue_on, Time.current)
    end

    def discontinued?
      !!discontinue_on && discontinue_on <= Time.current
    end

    # determine if any variant (including master) can be supplied
    def can_supply?
      variants_including_master.any?(&:can_supply?)
    end

    # determine if any variant (including master) is out of stock and backorderable
    def backordered?
      variants_including_master.any?(&:backordered?)
    end

    # split variants list into hash which shows mapping of opt value onto matching variants
    # eg categorise_variants_from_option(color) => {"red" -> [...], "blue" -> [...]}
    def categorise_variants_from_option(opt_type)
      return {} unless option_types.include?(opt_type)

      variants.active.group_by { |v| v.option_values.detect { |o| o.option_type == opt_type } }
    end

    def self.like_any(fields, values)
      conditions = fields.product(values).map do |(field, value)|
        arel_table[field].matches("%#{value}%")
      end
      where conditions.inject(:or)
    end

    # Suitable for displaying only variants that has at least one option value.
    # There may be scenarios where an option type is removed and along with it
    # all option values. At that point all variants associated with only those
    # values should not be displayed to frontend users. Otherwise it breaks the
    # idea of having variants
    def variants_and_option_values(current_currency = nil)
      variants.active(current_currency).joins(:option_value_variants)
    end

    def empty_option_values?
      options.empty? || options.any? do |opt|
        opt.option_type.option_values.empty?
      end
    end

    def property(property_name)
      product_properties.joins(:property).find_by(spree_properties: { name: property_name }).try(:value)
    end

    def set_property(property_name, property_value, property_presentation = property_name)
      ApplicationRecord.transaction do
        # Works around spree_i18n #301
        property = Property.create_with(presentation: property_presentation).find_or_create_by(name: property_name)
        product_property = ProductProperty.where(product: self, property: property).first_or_initialize
        product_property.value = property_value
        product_property.save!
      end
    end

    def total_on_hand
      if any_variants_not_track_inventory?
        Float::INFINITY
      else
        stock_items.sum(:count_on_hand)
      end
    end

    def self.collection
      #Spree::Taxonomy.all.map{|t|t.taxons.map{|c|c.products.reject{|s|s.taxons.count > 1}}.reject{|b|b.blank?}.flatten}
      Spree::Taxonomy.pluck(:id).map do |tax|
        Spree::Product.search("*",where:{taxonomy_ids: tax, taxon_count: 1})
      end
    end

    def to_csv
      attributes = %w{name short_description sku description available_on meta_description meta_keywords taxon_names options}
      CSV.generate(headers:true) do |csv|
        csv << attributes
        csv << [
          self.name,
          self.short_description,
          self.variants&.map{|v|v.sku}&.join(" "),
          self.description,
          self.available_on,
          self.meta_description,
          self.meta_keywords,
          self.taxons&.map{|t|t.name}&.join(" "),
          self.variants.map do |variant|
          keys = variant.option_values.map{|c|c.option_type.presentation}
          values = variant.option_values.map{|c|c.presentation}
          Hash[keys.zip values]
        end
        ]
      end
    end

    def taxon_name
      self.taxons.map{|t| t.name}
    end

    def option_type_name
      self.option_types.map{|op|op.name}
    end

    def price_master
      self.price.to_f
    end

    def variant_name
      self.variants.map{|c|c.option_values.map{|v|[v.option_type.name, v.name]}}
    end

    def find_id_taxonomy
      self.taxons.map{|t|t.taxonomy_id}.uniq.first
    end

    # Master variant may be deleted (i.e. when the product is deleted)
    # which would make AR's default finder return nil.
    # This is a stopgap for that little problem.
    def master
      super || variants_including_master.with_deleted.find_by(is_master: true)
    end

    def brand
      taxons.joins(:taxonomy).find_by(spree_taxonomies: { name: Spree.t(:taxonomy_brands_name) })
    end

    def category
      taxons.joins(:taxonomy).
        where(spree_taxonomies: { name: Spree.t(:taxonomy_categories_name) }).
        order(depth: :desc).
        first
    end


    private

    def add_associations_from_prototype
      if prototype_id && prototype = Spree::Prototype.find_by(id: prototype_id)
        prototype.properties.each do |property|
          product_properties.create(property: property)
        end
        self.option_types = prototype.option_types
        self.taxons = prototype.taxons
      end
    end

    def any_variants_not_track_inventory?
      return true unless Spree::Config.track_inventory_levels

      if variants_including_master.loaded?
        variants_including_master.any? { |v| !v.track_inventory? }
      else
        variants_including_master.where(track_inventory: false).exists?
      end
    end

    # Builds variants from a hash of option types & values
    def build_variants_from_option_values_hash
      ensure_option_types_exist_for_values_hash
      values = option_values_hash.values
      values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }

      values.each do |ids|
        variants.create(
          option_value_ids: ids,
          prices: master.prices.map{|price| price.amount}
        )
      end
      throw(:abort) unless save
    end

    def ensure_master
      return unless new_record?

      self.master ||= build_master
    end

    def normalize_slug
      self.slug = normalize_friendly_id(slug)
    end

    def punch_slug
      # punch slug with date prefix to allow reuse of original
      update_column :slug, "#{Time.current.to_i}_#{slug}"[0..254] unless frozen?
    end

    def update_slug_history
      save!
    end

    def anything_changed?
      saved_changes? || @nested_changes
    end

    def reset_nested_changes
      @nested_changes = false
    end

    def master_updated?
      master && (
        master.new_record? ||
        master.changed? ||
        (
          master.default_price &&
          (
            master.default_price.new_record? ||
            master.default_price.changed?
          )
        )
      )
    end

    # there's a weird quirk with the delegate stuff that does not automatically save the delegate object
    # when saving so we force a save using a hook
    # Fix for issue #5306
    def save_master
      if master_updated?
        master.save!
        @nested_changes = true
      end
    end

    # If the master cannot be saved, the Product object will get its errors
    # and will be destroyed
    def validate_master
      # We call master.default_price here to ensure price is initialized.
      # Required to avoid Variant#check_price validation failing on create.
      unless master.default_price && master.valid?
        master.errors.each do |att, error|
          errors.add(att, error)
        end
      end
    end

    # Try building a slug based on the following fields in increasing order of specificity.
    def slug_candidates
      [
        :name,
        [:name, :sku]
      ]
    end

    def run_touch_callbacks
      run_callbacks(:touch)
    end

    def taxon_and_ancestors
      taxons.map(&:self_and_ancestors).flatten.uniq
    end

    # Get the taxonomy ids of all taxons assigned to this product and their ancestors.
    def taxonomy_ids
      taxon_and_ancestors.map(&:taxonomy_id).flatten.uniq
    end

    # Iterate through this products taxons and taxonomies and touch their timestamps in a batch
    def touch_taxons
      Spree::Taxon.where(id: taxon_and_ancestors.map(&:id)).update_all(updated_at: Time.current)
      Spree::Taxonomy.where(id: taxonomy_ids).update_all(updated_at: Time.current)
    end

    def ensure_no_line_items
      if line_items.any?
        errors.add(:base, :cannot_destroy_if_attached_to_line_items)
        throw(:abort)
      end
    end

    def remove_taxon(taxon)
      removed_classifications = classifications.where(taxon: taxon)
      removed_classifications.each &:remove_from_list
    end

    def discontinue_on_must_be_later_than_available_on
      if discontinue_on < available_on
        errors.add(:discontinue_on, :invalid_date_range)
      end
    end
  end
end
