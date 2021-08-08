module Spree
  module Admin
    class Spree::Admin::SettingsController < Spree::Admin::BaseController

      def index
      end

      def change
        Spree::Config[params[:name]] = params[:name_new]
      end

end
end
end
