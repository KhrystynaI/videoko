class ExportProductsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    attributes = %w{name short_description sku description available_on meta_description meta_keywords taxon_names options}

   file = CSV.open(File.join(Rails.root, 'tmp', 'csv', 'file.csv'), "wb") do |csv|
      csv << attributes
    Spree::Product.find_each(batch_size: 100) do |product|
      csv << [
        product.name,
        product.short_description,
        product.variants&.map{|v|v.sku}&.join(" "),
        product.description,
        product.available_on,
        product.meta_description,
        product.meta_keywords&.split(" "),
        product.taxons&.map{|t|t.name}&.join(" "),
        product.variants.map do |variant|
        keys = variant.option_values.map{|c|c.option_type.presentation}
        values = variant.option_values.map{|c|c.presentation}
        Hash[keys.zip values]
      end
      ]
    end
   end
   ProductsMailer.all_products(csv: file).deliver_now
  end

  after_perform do |job|
    File.delete(Rails.root.join('tmp', 'csv', 'file.csv')) if File.exist?(Rails.root.join('tmp', 'csv', 'file.csv'))
  end
end
