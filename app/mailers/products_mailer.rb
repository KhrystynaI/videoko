class ProductsMailer < ApplicationMailer
  def all_products(csv)
    attachments['products.zip'] = ActiveSupport::Gzip.compress(File.read(Rails.root.join('upload', 'file.csv')))
    mail(to: Spree::Config[:email_admin], from: "videoko2016@gmail.com", subject: "products")
  end
end
