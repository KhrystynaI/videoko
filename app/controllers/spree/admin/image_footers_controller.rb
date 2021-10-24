module Spree
  module Admin
    class Spree::Admin::ImageFootersController < Spree::Admin::BaseController

      def index
        curr_page = params[:page] || 1
        @image_footers = Spree::ImageFooter.all.order("updated_at DESC").page(curr_page).per(15)
      end

      def show
        @image_footer = Spree::ImageFooter.find(params[:id])
      end

      def new
        @image_footer = Spree::ImageFooter.new
      end

      def edit
        @image_footer = Spree::ImageFooter.find(params[:id])
      end

      def create
        @image_footer = Spree::ImageFooter.new(image_footer_params)

        respond_to do |format|
          if @image_footer.save
            format.html { redirect_to admin_image_footer_path(@image_footer.id) }
          else
            flash[:error] = "Розмір картинки має бути від 100 до 800 кілобайт і тип може бути тільки JPEG, JPG чи PNG"
            format.html { redirect_to new_admin_image_footer_path }
          end
      end
    end

      def update
        @image_footer = Spree::ImageFooter.find(params[:id])
        respond_to do |format|
          if @image_footer.update(image_footer_params)
            format.html { redirect_to admin_image_footer_path(@image_footer.id) }
          else
            flash[:error] = "Розмір картинки має бути від 100 до 800 кілобайт і тип може бути тільки JPEG, JPG чи PNG"
            format.html { redirect_to admin_image_footers_path }
          end
       end
      end

      def destroy
        @image_footer = Spree::ImageFooter.find(params[:id])
        @image_footer.destroy

        redirect_to admin_image_footers_path
      end

      private

      def image_footer_params
        params.require(:image_footer).permit(:id, :number, :picture)
     end
    end
  end
end
