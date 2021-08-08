module Spree
  module Admin
    class Spree::Admin::VolumesController < Spree::Admin::BaseController

      def index
        @product = Product.friendly.find(params[:id])
        @product_id = @product.id
      end

      def create
        @product = Product.friendly.find(params[:id])

        params[:images].each do |im|
        ImageOptimizer.new(im.tempfile.path).optimize
        MiniMagick::Image.new(im.tempfile.path).resize "900x700"
      end
      @volume = Spree::Volume.create(product_id: params[:product_id],  name: params[:name], images: params[:images])
      render "index"
      end


      def destroy
        @volume = Spree::Volume.find(params[:volume])
        @volume.images.each do |im|
          im.purge
        end
        @product = @volume.product
        @volume.delete
        redirect_to spree.edit_admin_product_url(@product)
      end

  end
 end
end
