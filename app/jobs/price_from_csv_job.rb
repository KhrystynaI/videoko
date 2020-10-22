require 'csv'
require 'open-uri'
class PriceFromCsvJob < ApplicationJob
  queue_as :default

  def perform(csv_path)
    csv_file = Rails.root.join('tmp', 'storage',csv_path)

    CSV.foreach(csv_file, headers: true, skip_blanks: true)do |t|
    if !Spree::Variant.find_by(sku: t['id']).nil?
      if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id).nil?}).select{|c| c == true}.empty?
       price_rozdrib = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id)}
       price_rozdrib.map{|price| price.update!(amount_usd: t["6"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "rozdrib").id, product_id: variant.product.id, amount_usd: t["6"])
     end
   end
   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "opt").id).nil?}).select{|c| c == true}.empty?
       price_opt = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "opt").id)}
       price_opt.map{|price| price.update!(amount_usd: t["5"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "opt").id, product_id: variant.product.id, amount_usd: t["5"])
     end
   end

   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "gold").id).nil?}).select{|c| c == true}.empty?
       price_gold = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "gold").id)}
       price_gold.map{|price| price.update!(amount_usd: t["4"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "gold").id, product_id: variant.product.id, amount_usd: t["4"])
     end
   end

   if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip").id).nil?}).select{|c| c == true}.empty?
       price_vip = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip").id)}
       price_vip.map{|price| price.update!(amount_usd: t["3"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip").id, product_id: variant.product.id, amount_usd: t["3"])
     end
   end

    if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip2").id).nil?}).select{|c| c == true}.empty?
       price_vip2 = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip2").id)}
       price_vip2.map{|price| price.update!(amount_usd: t["2"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip2").id, product_id: variant.product.id, amount_usd: t["2"])
     end
   end

if (Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.nil?} + Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip1").id).nil?}).select{|c| c == true}.empty?
       price_vip1 = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip1").id)}
       price_vip1.map{|price| price.update!(amount_usd: t["1"])}
     else
       Spree::Variant.where(sku: t['id']).map do |variant|
       Spree::Price.create!(variant_id: variant.id, currency: Spree::Config[:currency], role_id: Spree::Role.find_by(name: "vip1").id, product_id: variant.product.id, amount_usd: t["1"])
     end
   end
     end
    end
    File.delete(csv_file)
end

end
