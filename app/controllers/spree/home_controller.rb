module Spree
  class HomeController < Spree::StoreController
    respond_to :html

    def index
      fresh_when etag: home_etag, public: true
    end

    private

    def home_etag
      [
        I18n.locale,
        Spree::ImageSlider.all&.map{|c|c&.picture&.blob&.key},
        spree_current_user,
      ].compact
    end

  end
end
