module Spree
  class TechnicalSupportsController < Spree::StoreController
    respond_to :html

    def technical_support
      @technical_support = Spree::TechnicalSupport.last
      render template: "spree/technical_supports/technical_support"
    end

  end
end
