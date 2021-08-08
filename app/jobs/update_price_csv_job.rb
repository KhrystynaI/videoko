require 'csv'

class UpdatePriceCsvJob < ApplicationJob
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

  def perform(csv_path)
    prices = {"6"=> "rozdrib", "5"=> "opt", "4"=> "gold", "3"=> "vip", "2"=> "vip2", "1"=> "vip1"}
    csv_file = Rails.root.join("upload",csv_path)

    CSV.foreach(csv_file, headers: true, skip_blanks: true)do |t|


    if !Spree::Variant.find_by(sku: t['id']).nil?

      Spree::Variant.where(sku: t['id']).each do |variant|
        prices.each do |key, value|
        variant.prices.where(role_id: Spree::Role.find_by(name: value)).each do |price|
          price.update!(amount_usd: t[key])
        end
      end
    end
  end
end
    File.delete(csv_file)
     end

end
