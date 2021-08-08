module Spree
  class HomeController < Spree::StoreController
    respond_to :html

    def contact
      @tel = "(032)295-1-295"
      @email = "videoko@ukr.net"
    end

    def index
      fresh_when etag: store_etag, last_modified: store_last_modified, public: true
    end
  end
end
