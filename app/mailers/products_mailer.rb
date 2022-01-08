class ProductsMailer < ApplicationMailer
  def all_products(csv)
    attachments['products.csv'] = Rails.root.join, 'upload', 'file.csv'
    mail(to: "kinzhuvatova@gmail.com", from: "kinzhuvatova@gmail.com", subject: "products")
  end
end
