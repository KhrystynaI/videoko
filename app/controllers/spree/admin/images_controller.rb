module Spree
  module Admin
    class ImagesController < ResourceController
      before_action :load_edit_data, except: :index
      before_action :load_index_data, only: :index
      before_action :resize_image, only: [:create, :update]

      create.before :set_viewable
      update.before :set_viewable

      private

      def resize_image
        ImageOptimizer.new(params[:image][:attachment].tempfile.path).optimize
      end

      def location_after_destroy
        admin_product_images_url(@product)
      end

      def location_after_save
        admin_product_images_url(@product)
      end

      def load_index_data
        id = Spree::Product.friendly.find(params[:product_id]).id
        @product = Product.friendly.includes(*variant_index_includes).find(id)
      end

      def load_edit_data
        id = Spree::Product.friendly.find(params[:product_id]).id
        @product = Product.friendly.includes(*variant_edit_includes).find(id)
        @variants = @product.variants.map do |variant|
          [variant.sku_and_options_text, variant.id]
        end
        @variants.insert(0, [Spree.t(:all), @product.master.id])
      end

      def set_viewable
        @image.viewable_type = 'Spree::Variant'
        @image.viewable_id = params[:image][:viewable_id]
      end

      def variant_index_includes
        [
          variant_images: [viewable: { option_values: :option_type }]
        ]
      end

      def variant_edit_includes
        [
          variants_including_master: { option_values: :option_type, images: :viewable }
        ]
      end
    end
  end
end
