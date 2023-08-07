module Spree
  class HomeController < Spree::StoreController
    respond_to :html

    def index
      @products = Spree::Product.search("*",where:{show: true, active: true, new_item: true}, order: {updated_at: :desc})
      #fresh_when etag: home_etag, public: true
    end

    private

    def home_etag
      [
        I18n.locale,
        Spree::ImageSlider.all&.map{|c|c&.picture&.blob&.key},
        spree_current_user
      ].compact
    end

  end
end
