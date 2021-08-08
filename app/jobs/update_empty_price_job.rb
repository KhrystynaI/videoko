class UpdateEmptyPriceJob < ApplicationJob
  queue_as :default


  def perform(product_id)
    product = Spree::Product.find(product_id)
        product.variants.each do |variant|
      variant.prices.each do |price|
      price.update!(amount_usd: 0.00)
    end
  end
end
end
