module Spree
  class OfferItem < Spree::Base
    belongs_to :offer
    belongs_to :variant
  end
end
