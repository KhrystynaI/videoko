class ProductsMailer < ApplicationMailer
  def all_products(csv)
    attachments['products.csv'] = File.read(Rails.root.join('upload', 'file.csv'))
    mail(to: "kinzhuvatova@gmail.com", from: "kinzhuvatova@gmail.com", subject: "products")
  end
end
