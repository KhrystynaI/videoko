require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'csv'
module Spree
  module Admin
    class ProductsController < ResourceController
      include ActiveStorage::SendZip
      helper 'spree/products'

      before_action :load_data, except: [:index, :rate, :destroy_video, :search_taxonomy]
      create.before :create_before
      update.before :update_before
      helper_method :clone_object_url
      before_action :permit_params, only: [:update]
      before_action :permit_related, only: [:related]
      after_action :update_prices, only: :rate


      def edit
        @product = Product.friendly.find(params[:id])
        @product.prices
      end

      def show
        session[:return_to] ||= request.referer
        redirect_to action: :edit
      end

      def index
        @rate = Spree::Config[:rate]
        session[:return_to] = request.url

        respond_to do |format|
          format.html {respond_with(@collection)}
        end
      end

      def export_products
        ExportProductsJob.perform_later
        head :accepted
      end

      def export_product
        @product = Product.friendly.find(params[:id])
        respond_to do |format|
          format.html {}
          format.csv {
            send_data(@product.to_csv, filename: @product.name + ".csv")
          }
        end
      end

      def export_images
        @product = Product.friendly.find(params[:id])
        respond_to do |format|
          format.html {}
          format.zip {
            send_zip @product.images.map{|c|c.attachment}, filename: "images_" + @product.name + ".zip" if @product.images&.present?
          }
        end
      end

      def export_volume
        @product = Product.friendly.find(params[:id])
        respond_to do |format|
          format.html {}
          format.zip {
            send_zip @product.volume.images.attachments, filename: "3D_" + @product.name + ".zip" if @product.volume&.images&.attachments.present?
          }
        end
      end

      def update
        if params[:product][:taxon_ids].present?
          params[:product][:taxon_ids] = params[:product][:taxon_ids].split(',')
        end
        if params[:product][:option_type_ids].present?
          params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
        end

        invoke_callbacks(:update, :before)
        if @object.update(permitted_resource_params)
          invoke_callbacks(:update, :after)
          flash[:success] = flash_message_for(@object, :successfully_updated)
          respond_with(@object) do |format|
            format.html { redirect_to location_after_save }
            format.js   { render layout: false }
          end
        else
          # Stops people submitting blank slugs, causing errors when they try to
          # update the product again
          @product.slug = @product.slug_was if @product.slug.blank?
          invoke_callbacks(:update, :fails)
          respond_with(@object)
        end
        if !params[:product][:video].nil?
          @product.video.attach(params[:product][:video])
        end
      end

      def destroy_video
        @product = Product.find(params[:id])
        @product.video.purge
        redirect_back(fallback_location: edit_admin_product_url(@product.id), notice: Spree.t(:delete))
      end

      def search_taxonomy
        curr_page = params[:page] || 1
        per_page = params[:per_page] || 25

        @collection_category = Spree::Product.search("*",where:{taxon_ids: params[:id]}, page: curr_page, per_page: per_page )
        respond_to do |format|
          format.html {}
          format.js
        end
      end

      def rate
        last_rate = Spree::Config[:rate]
        Spree::Config[:last_rate] = last_rate
        @rate = Spree::Config[:rate]
        Spree::Config[:rate] = params[:rate]
        @rate = Spree::Config[:rate]
        @message = "Ціни оновлені"
        respond_to do |format|
          format.js
        end
      end

      def reindex_force
        ReindexProductJob.perform_later()
        redirect_to admin_products_url, notice: "Товари оновлюються.Зачекайте"
      end

      def import
        user_file = params[:file]
        if user_file.nil? || user_file.content_type != "text/csv"
          redirect_to admin_products_url, notice: "Завантажте csv файл"
        else
        File.open(Rails.root.join('upload',user_file.original_filename), 'wb') do |file|
          file.write(user_file.read)
        end
        file = user_file.original_filename
        empty_product = []
        CSV.foreach(user_file, headers: true, skip_blanks: true) do |t|

          if Spree::Variant.find_by(sku: t['id']).nil?
            empty_product.push(t['id'])
          end
        end

        UpdatePriceCsvJob.perform_later(file)
        send_data(empty_product.to_csv, filename: "empty_products.csv")
       end
      end

      def related
        if !params[:related].nil? && !params[:related].empty?
          related_product = params[:related].reject { |c| c.empty? }
          @product.update!(related: related_product)
        end
      end

      def related_first
        if !Spree::Product.searchkick_index.exists?
          InformDeveloperMailer.problem_email.deliver_later
          ReindexProductJob.perform_later()
          redirect_to admin_products_url, notice: "Товари оновлюються.Зачекайте"
        end
      end

      def remove_related
        @product = Product.find(params[:id_product].to_i)
        related = @product.related.tr('["\"]','').split(',').reject { |c| c.empty? }.map(&:to_i).reject { |c| c == 0 }.delete_if{|c| c == params[:id_related].to_i}
        @product.update(related: related)
        redirect_back fallback_location: related_admin_product_path(@product)
      end

      def destroy
        @product = Product.friendly.find(params[:id])

        begin
          # TODO: why is @product.destroy raising ActiveRecord::RecordNotDestroyed instead of failing with false result
          if @product.offer_items.blank? && @product.line_items.blank?
            @product.variants.each{|variant| variant.prices.delete_all}
            @product.variants.delete_all

            translated = @product.translations.map{|c|c.id}
            Spree::Product::Translation.unscoped do
              translated.each do |tr|
                Spree::Product::Translation.where(id: tr).delete_all
              end
            end
            @product.video.purge if @product.video
            if !@product.volume.blank?
              @product.volume.images.each{|c|c.purge}
              @product.volume.delete
            end
            if !@product.images.blank?
              @product.images.each{|c|c.attachment.purge}
              @product.images.delete_all
            end
            @product.destroy
          end
          if !@product.deleted_at.blank?
            flash[:success] = Spree.t('notice_messages.product_deleted')
          else
            flash[:error] = Spree.t('notice_messages.product_not_deleted', error: @product.errors.full_messages.to_sentence)
          end
        rescue ActiveRecord::RecordNotDestroyed => e
          flash[:error] = Spree.t('notice_messages.product_not_deleted', error: e.message)
        end

        respond_with(@product) do |format|
          format.html { redirect_to collection_url }
          format.js { render_js_for_destroy }
        end
      end

      def clone
        @new = @product.duplicate

        if @new.persisted?
          flash[:success] = Spree.t('notice_messages.product_cloned')
          redirect_to edit_admin_product_url(@new)
        else
          flash[:error] = Spree.t('notice_messages.product_not_cloned', error: @new.errors.full_messages.to_sentence)
          redirect_to admin_products_url
        end
      rescue ActiveRecord::RecordInvalid => e
        # Handle error on uniqueness validation on product fields
        flash[:error] = Spree.t('notice_messages.product_not_cloned', error: e.message)
        redirect_to admin_products_url
      end

      def stock
        @variants = @product.variants.includes(*variant_stock_includes)
        @variants = [@product.master] if @variants.empty?
        @stock_locations = StockLocation.accessible_by(current_ability)
        if @stock_locations.empty?
          flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
          redirect_to admin_stock_locations_path
        end
      end

      protected

      def find_resource
        Product.with_deleted.friendly.find(params[:id])
      end

      def location_after_save
        spree.edit_admin_product_url(@product)
      end

      def load_data
        @taxons = Taxon.order(:name)
        @option_types = OptionType.order(:name)
        #@tax_categories = TaxCategory.order(:name)
        #@shipping_categories = ShippingCategory.order(:name)
      end

      def collection
        return @collection if @collection.present?

        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= '1'
        params[:q][:not_discontinued] ||= '1'

        params[:q][:s] ||= 'name asc'

        @collection = super
        # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
        # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
        if params[:q][:deleted_at_null] == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
        # This is to include all products and not just deleted products.
        @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
        @collection = @search.result.
        includes(product_includes).
        page(params[:page]).
        per(params[:per_page] || Spree::Config[:admin_products_per_page])
        @collection
      end

      def create_before
        return if params[:product][:prototype_id].blank?

        @prototype = Spree::Prototype.find(params[:product][:prototype_id])
      end

      def update_before
        # note: we only reset the product properties if we're receiving a post
        #       from the form on that tab
        return unless params[:clear_product_properties]

        params[:product] ||= {}
      end

      def product_includes
        [{ variants: [:images], master: [:images] }]
      end

      def clone_object_url(resource)
        clone_admin_product_url resource
      end

      def permit_params
        params.require(:product).permit(:show, :video, :empty_price, :existence, :iframe, :related,prices_attributes:[:id,:role_id, :variant_id, :amount_usd])
      end

      def permit_related
        if params[:related].present?
          params[:related].reject! { |c| c.empty? }
        end
      end


      private

      def update_prices
        PriceUpdateJob.perform_later
      end

      def variant_stock_includes
        [:images, stock_items: :stock_location, option_values: :option_type]
      end
    end
  end
end
