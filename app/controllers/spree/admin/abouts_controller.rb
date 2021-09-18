module Spree
  module Admin
    class Spree::Admin::AboutsController < Spree::Admin::BaseController

      def show
        @about = Spree::About.last
      end

      def edit
        @about = Spree::About.last
      end

      def update
        @about = Spree::About.last

        respond_to do |format|
          if @about.update(about_params)
            format.html { redirect_to spree.admin_about_path(@about.id) }
          else
            format.html { render template: "edit"}
          end
      end
      end

      private
      def about_params
       params.require(:about).permit(:id, :body)
    end
  end
 end
end
