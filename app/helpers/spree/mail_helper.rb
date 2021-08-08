module Spree
  module MailHelper
    include BaseHelper

    def variant_image_url(variant)
      image = default_image_for_product_or_variant(variant)
      image ? File.read(ActiveStorage::Blob.service.send(:path_for,image.attachment.key)) : File.read("#{Rails.root}/app/assets/images/img_def.png")
    end

    def name_attach(variant)
      image = default_image_for_product_or_variant(variant)
      image ? "#{image.url(:small).key}.png" : "img_def.png"
    end

    def name_for(order)
      order.name || Spree.t('customer')
    end

    def logo_path
      if current_store.present? && current_store.logo.attached? && current_store.logo.variable?
        main_app.url_for(current_store.logo.variant(resize: '244x104>'))
      elsif current_store.present? && current_store.logo.attached? && current_store.logo.image?
        main_app.url_for(current_store.logo)
      else
        Spree::Config.mailer_logo || Spree::Config.logo
      end
    end
  end
end
