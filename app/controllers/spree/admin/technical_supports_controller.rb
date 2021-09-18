module Spree
  module Admin
    class Spree::Admin::TechnicalSupportsController < Spree::Admin::BaseController

      def show
        @technical_support = Spree::TechnicalSupport.last
      end

      def edit
        @technical_support = Spree::TechnicalSupport.last
      end

      def update
        @technical_support = Spree::TechnicalSupport.last

        respond_to do |format|
          if @technical_support.update(technical_support_params)
            format.html { redirect_to spree.admin_technical_support_path(@technical_support.id) }
          else
            format.html { render template: "edit"}
          end
      end
      end

      private
      def technical_support_params
       params.require(:technical_support).permit(:id, :body)
    end
  end
 end
end
