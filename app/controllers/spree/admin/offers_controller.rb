module Spree
  module Admin
    class OffersController < Spree::Admin::BaseController

      def index_offer
        curr_page = params[:page] || 1
        @offers = Spree::Offer.all.where(status: "complete").page(curr_page).per(15)
      end

      def show_offer
        @offer = Spree::Offer.find(params[:id])
      end

      def delete_offer
        offer = Spree::Offer.find(params[:id])
        offer.offer_items.each{|item|item.delete}
        offer.address.delete
        offer.delete
        redirect_to admin_index_offer_path
      end

    end
  end
end
