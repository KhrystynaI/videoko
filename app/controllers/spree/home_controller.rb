module Spree
  class HomeController < Spree::StoreController
    respond_to :html

    def index
      fresh_when etag: store_etag, last_modified: store_last_modified, public: true
      @tel = "(032)295-1-295"
      @tel_second = "(032)295-2-295"
      @mob_tel = "(097) 295-2-295"
      @viber = "(099) 295-2-295"
      @telegram = "(063) 295-2-295"
      @email = "videoko@ukr.net"
    end
  end
end
