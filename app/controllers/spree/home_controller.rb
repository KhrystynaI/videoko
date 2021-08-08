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
        spree_current_user,
      ].compact
    end

  end
end
