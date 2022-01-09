class ProductsMailer < ApplicationMailer
  def all_products(csv)
    attachments['products.zip'] = ActiveSupport::Gzip.compress(File.read(Rails.root.join('upload', 'file.csv')))
    mail(to: "kinzhuvatova@gmail.com", from: "kinzhuvatova@gmail.com", subject: "products")
  end
end
