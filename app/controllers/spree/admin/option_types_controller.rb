module Spree
  module Admin
    class OptionTypesController < ResourceController
      before_action :setup_new_option_value, only: :edit
      before_action :permit_taxon_id, only:[:create]
      after_action :set_cache, only: :edit

      def update_values_positions
        ApplicationRecord.transaction do
          params[:positions].each do |id, index|
            Spree::OptionValue.where(id: id).update_all(position: index)
          end
        end

        respond_to do |format|
          format.html { redirect_to admin_product_variants_url(params[:product_id]) }
          format.js { render plain: 'Ok' }
        end
      end


      protected

      def location_after_save
        if @option_type.created_at == @option_type.updated_at
          edit_admin_option_type_url(@option_type)
        else
          admin_option_types_url
        end
      end

      private

      def set_cache
        Spree::Config.cache_option_type = rand(1..2000)
      end

      def permit_taxon_id
        params.require(:option_type).permit(:name, :presentation, :taxon_id)
      end

      def setup_new_option_value
        @option_type.option_values.build if @option_type.option_values.empty?
      end
    end
  end
end
