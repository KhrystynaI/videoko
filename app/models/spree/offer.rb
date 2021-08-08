module Spree
  class Offer < Spree::Base
    belongs_to :user, class_name: 'Spree::User'
    belongs_to :order, class_name: 'Spree::Order'
    has_many :offer_items, class_name: 'Spree::OfferItem', dependent: :destroy
    belongs_to :address, class_name: 'Spree::Address', optional: true
    accepts_nested_attributes_for :address
    
    enum status: [:complete, :uncomplete]

    PRICES_FOR_OPT = [ "opt", "rozdrib" ]
    PRICES_FOR_GOLD = ["gold", "opt", "rozdrib"]
    PRICES_FOR_VIP = ["vip","gold", "opt", "rozdrib"]
    PRICES_FOR_VIP2 = ["vip2","vip","gold", "opt", "rozdrib"]
    PRICES_FOR_VIP1 = ["vip1","vip2","vip","gold", "opt", "rozdrib"]
  end
end
