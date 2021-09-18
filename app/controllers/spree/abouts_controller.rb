module Spree
  class AboutsController < Spree::StoreController
    respond_to :html

    def about_us
      @about = Spree::About.last
      render template: "spree/about/about_us"
    end

  end
end
