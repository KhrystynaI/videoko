class PriceUpdateJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    Spree::Variant.find_in_batches(batch_size: 100) do |variants|
      double_prices = variants.select{|c| c.prices.count > 6}
    if !double_prices.empty?
    double_prices.each do |variant|
      variant.prices.order("created_at DESC")[6..-1].each{|c|c.delete}
    end
  end
  end
end

  def perform(*args)
    Spree::Product.find_each(batch_size: 100) do |product|
      product.prices.each do |price|
        price.update!(updated_at: Time.now)
      end
  end
 end
end
