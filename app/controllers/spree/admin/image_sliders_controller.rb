module Spree
  module Admin
    class Spree::Admin::ImageSlidersController < Spree::Admin::BaseController

      def index
        @image_sliders = Spree::ImageSlider.all.order("updated_at DESC")
      end

      def show
        @image_slider = Spree::ImageSlider.find(params[:id])
      end

      def new
        @image_slider = Spree::ImageSlider.new
      end

      def edit
        @image_slider = Spree::ImageSlider.find(params[:id])
      end

      def create
        @image_slider = Spree::ImageSlider.new(image_slider_params)

        respond_to do |format|
          if @image_slider.save
            format.html { redirect_to admin_image_slider_path(@image_slider.id) }
          else
            flash[:error] = "Розмір картинки має бути від 100 до 800 кілобайт і тип може бути тільки JPEG, JPG чи PNG. Номер слайду не може бути порожнім"
            format.html { redirect_to new_admin_image_slider_path }
          end
      end
    end

      def update
        @image_slider = Spree::ImageSlider.find(params[:id])
        respond_to do |format|
          if @image_slider.update(image_slider_params)
            format.html { redirect_to admin_image_slider_path(@image_slider.id) }
          else
            flash[:error] = "Розмір картинки має бути від 100 до 800 кілобайт і тип може бути тільки JPEG, JPG чи PNG. Номер слайду не може бути порожнім"
            format.html { redirect_to admin_image_sliders_path }
          end
       end
      end

      def destroy
        @image_slider = Spree::ImageSlider.find(params[:id])
        @image_slider.destroy

        redirect_to admin_image_sliders_path
      end

      private

      def image_slider_params
        params.require(:image_slider).permit(:id, :number, :picture)
     end
    end
  end
end
