module Spree
  class OffersController < Spree::StoreController
    before_action :check_user, only: [:show, :new]
    include Spree::Admin::BaseHelper

    def new
      @option_for_price = option_for_price(spree_current_user)
      @order = Spree::Order.find_by(number: params[:order])
      @offer = Spree::Offer.new(order: @order, user: spree_current_user)
    end

    def create
      @offer = Spree::Offer.new(
        name: params[:offer][:number] + rand(1..100).to_s,
        order_id: params[:offer][:order_id],
        user_id: params[:offer][:user_id],
        comment: params[:offer][:comment],
        price_role: params[:offer][:price_role],
        currency: params[:offer][:currency]
      )
     @offer.save

      order = Spree::Order.find(@offer.order_id)

       order.line_items.map do |item|

        price_order_item = item.variant.prices.find_by(role_id: Spree::Role.find_by(name: @offer.price_role).id)

        if @offer.currency == "UAH"
          price = price_order_item.amount
        else
          price = price_order_item.amount_usd
        end

        Spree::OfferItem.create(offer_id: @offer.id, price: price, quantity: item.quantity, variant_id: item.variant_id )
      end
      prices = @offer.offer_items.map do |item|
        item.price * item.quantity
      end
      total_price = prices.inject(0){|sum,x| sum + x }
      @offer.update(total_price: total_price)
      redirect_to show_offer_path(@offer.id)

    end

    def show
      @offer = Spree::Offer.find(params[:id])
      respond_to do |format|
      format.html
      format.pdf do
        pdf = OfferPdf.new(@offer)
        send_data pdf.render, filename: 'пропозиція.pdf', type: 'application/pdf'
      end
    end
    end

    def delete
      offer = Spree::Offer.find(params[:id])
      offer.offer_items.each{|item|item.delete}
      offer.delete
      redirect_to spree.account_path
    end

    def create_order
      @offer = Spree::Offer.find(params[:id])
      @address = Spree::Address.new()
    end

    def offer_address
      params.permit!
      @offer = Spree::Offer.find(params[:id])
      @address = Spree::Address.new(
        firstname: params[:address][:firstname],
        lastname: params[:address][:lastname],
        address1: params[:address][:address1],
        phone: params[:address][:phone],
        state_id: params[:address][:state_id],
        user_id: params[:address][:user_id],
        country_id: params[:address][:country_id],
        city: params[:address][:city],
        nova_poshta_address: params[:address][:nova_poshta_address],
        nova_poshta_number: params[:address][:nova_poshta_number]
       )
       if @address.save
       @offer.update(address_id: @address.id, status: :complete)
       OrderMailer.confirm_email_offer(@offer.id).deliver_later
       OrderMailer.inform_admin_offer(@offer.id).deliver_later
       redirect_to offer_show_path(id: @offer.id)
     else
       flash[:error]= Spree.t("feel_all_fields")
       redirect_back(fallback_location: offer_address_path)
     end
    end

    def offer_show
      @offer = Spree::Offer.find(params[:id])
    end

    private

    def check_user
      if spree_current_user.has_spree_role?("rozdrib")
        redirect_to root_path
      end
    end

    def price_for_item(item, offer)
      price = item.variant.prices.find_by(role_id: Spree::Role.find_by(name: offer.price_role).id).amount
      result = price * item.quantity
    end

    def option_for_price(user)
      role = user.spree_roles.map{|c|c[:name]}[0]
      case role
      when "opt"
        Spree::Offer::PRICES_FOR_OPT
      when "gold"
        Spree::Offer::PRICES_FOR_GOLD
      when "vip"
        Spree::Offer::PRICES_FOR_VIP
      when "vip2"
        Spree::Offer::PRICES_FOR_VIP2
      when "vip1"
        Spree::Offer::PRICES_FOR_VIP1
      else
        Spree::Offer::PRICES_FOR_VIP1
      end
    end

  end
end
