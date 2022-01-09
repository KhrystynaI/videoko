class ProductsMailer < ApplicationMailer
  def all_products(csv)
    attachments['products.zip'] = ActiveSupport::Gzip.compress(File.read(Rails.root.join('upload', 'file.csv')))
    mail(to: Spree::Config[:email_admin], from: "noreply@videoko.com.ua", subject: "products")
  end
end
