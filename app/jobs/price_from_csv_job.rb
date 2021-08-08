require 'csv'
#require 'open-uri'
class PriceFromCsvJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    double_prices = Spree::Variant.all.select{|c| c.prices.count > 6}
    if !double_prices.empty?
    double_prices.each do |variant|
      variant.prices.order("created_at DESC")[6..-1].each{|c|c.delete}
    end
  end
  end

  def perform(csv_path)
    csv_file = Rails.root.join("upload",csv_path)

    CSV.foreach(csv_file, headers: true, skip_blanks: true)do |t|
    begin
      retries ||= 0
    if !Spree::Variant.find_by(sku: t['id']).nil?
      if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id).nil?}).select{|c| c == true}.empty?
       Spree::Variant.where(sku: t['id']).map do |variant|
         variant.prices.where(role_id: Spree::Role.find_by(name: "rozdrib").id).map{|c|c.destroy}
         Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "rozdrib").id, product_id: variant.product.id, amount_usd: t["6"])
       end
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "rozdrib").id, product_id: variant.product.id, amount_usd: t["6"])
     end
   end
   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "opt").id).nil?}).select{|c| c == true}.empty?
     Spree::Variant.where(sku: t['id']).map do |variant|
     variant.prices.where(role_id: Spree::Role.find_by(name: "opt").id).map{|c|c.destroy}
     Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "opt").id, product_id: variant.product.id, amount_usd: t["5"])
   end
    else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "opt").id, product_id: variant.product.id, amount_usd: t["5"])
     end
   end

   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "gold").id).nil?}).select{|c| c == true}.empty?
     Spree::Variant.where(sku: t['id']).map do |variant|
     variant.prices.where(role_id: Spree::Role.find_by(name: "gold").id).map{|c|c.destroy}
     Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "gold").id, product_id: variant.product.id, amount_usd: t["4"])
   end
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "gold").id, product_id: variant.product.id, amount_usd: t["4"])
     end
   end

   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip").id).nil?}).select{|c| c == true}.empty?
     Spree::Variant.where(sku: t['id']).map do |variant|
     variant.prices.where(role_id: Spree::Role.find_by(name: "vip").id).map{|c|c.destroy}
     Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip").id, product_id: variant.product.id, amount_usd: t["3"])
   end
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip").id, product_id: variant.product.id, amount_usd: t["3"])
     end
   end

    if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip2").id).nil?}).select{|c| c == true}.empty?
      Spree::Variant.where(sku: t['id']).map do |variant|
      variant.prices.where(role_id: Spree::Role.find_by(name: "vip2").id).map{|c|c.destroy}
      Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip2").id, product_id: variant.product.id, amount_usd: t["2"])
    end
    else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip2").id, product_id: variant.product.id, amount_usd: t["2"])
     end
   end

if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip1").id).nil?}).select{|c| c == true}.empty?
  Spree::Variant.where(sku: t['id']).map do |variant|
    variant.prices.where(role_id: Spree::Role.find_by(name: "vip1").id).map{|c|c.destroy}
    Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip1").id, product_id: variant.product.id, amount_usd: t["1"])
  end
    else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip1").id, product_id: variant.product.id, amount_usd: t["1"])
     end
   end
     end
   rescue Exception
     if (retries += 1) < 3
         retry
       end
       end
    end
    File.delete(csv_file)
end

end
