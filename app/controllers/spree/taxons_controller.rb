module Spree
  class TaxonsController < Spree::StoreController
    include Spree::FrontendHelper
    helper 'spree/products'

    before_action :load_taxon

    respond_to :html

    def show
      if stale?(etag: etag, last_modified: last_modified, public: true)
        load_products
      end
    end

    def product_carousel
      if stale?(etag: carousel_etag, last_modified: last_modified, public: true)
        load_products
        if @products.any?
          render template: 'spree/taxons/product_carousel', layout: false
        else
          head :no_content
        end
      end
    end

    private

    def accurate_title
      @taxon.try(:seo_title) || super
    end

    def load_taxon
      @taxon = Spree::Taxon.includes(:translations).friendly.find(params[:id])
    end

    def load_products
      query = params.permit!.to_h

      if query.any?{|key,value| key == "price"}
        query_params = query.reject{|key,value| key < "price"}
        first_query = query_params.reject{|key,value| value.blank?}.transform_values{|value| value.split(",")}
        if first_query.any?{|key,value| key == "price"}
          price_query = first_query.reject{|key,value| key > "price"}.values.flatten!.pop
          price = get_price_range(price_query)
          clean_query = first_query.select{|key,value| key > "price"}.to_h
          clean_query.merge!(price)
        else
          clean_query = first_query
        end
      else
        query_params = query.select{|key,value| key > "menu_open"}
        clean_query = query_params.reject{|key,value| value.blank?}.transform_values{|value| value.split(",")}
    end
      price = clean_query[:price]
      variant_price ={price_variant: price}
      variant_price.merge!(clean_query)
      variant_price.merge!(show: true, active: true, taxon_ids: @taxon.id).delete_if {|key, value| key == "sort_by" }.delete("page")
      curr_page = params[:page] || 1
      clean_query.merge!(show: true, active: true, taxon_ids: @taxon.id).delete_if {|key, value| key == "sort_by" }.delete("page")
      if params[:sort_by].present?
        params[:sort_by] == "price"? sort = :asc : sort = :desc
        @products = Spree::Product.search("*",where:{or:[ [ clean_query, variant_price]]},order:{params[:sort_by]=> sort}, page: curr_page, per_page: 9)

      else
      @products = Spree::Product.search("*",where:{or:[ [ clean_query, variant_price]]},page: curr_page, per_page: 9)
    end
    end



    def etag
      @taxon_id = @taxon.id
      [
        store_etag,
        @taxon,
        available_option_types_cache_key(@taxon_id),
        filtering_params_cache_key(@taxon_id)
      ]
    end

    def carousel_etag
      [
        store_etag,
        @taxon
      ]
    end

    def last_modified
      @taxon.updated_at&.utc
    end
  end
end
