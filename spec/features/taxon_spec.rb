require 'rails_helper'

describe 'sort products', type: :system do
  before do
  product =  Spree::Product.create!(name: "test", description: "test", short_description: "test", available_on: Time.current)
  product.classifications.create!(taxon_id: Spree::Taxon.last.id, product_id: product.id)
  product.update!(option_types: Spree::Taxon.last.option_types)

    product.variants.first_or_create! do |variant|
        variant.option_values = product.option_types.map{|c|c.option_values.first}
    end

     Spree::Price.create!(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:3)
     Spree::Price.create(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:4)
     Spree::Price.create(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:5)
     Spree::Price.create(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:6)
     Spree::Price.create(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:7)
     Spree::Price.create(product_id: product.id, amount_usd: 1, variant_id: product.variants.first.id, role_id:8)
  end

  it 'Displays unsorted products' do
    visit "/"
    first('a', text: "ДОДАТКОВЕ ОБЛАДНАННЯ").click
    sleep 10
    find('a', text:"ПЕРЕДАЧА, ПЕРЕТВОРЕННЯ, РОЗГАЛУЖЕННЯ СИГНАЛУ").click
    sleep 10
    find("#plp-filters-accordion").click
    sleep 10
    within("#plp-filters-accordion") do
    all(".plp-overlay-card-item").first.click
  end
    sleep 10
    prod =first(".product_card")
  expect(prod).to have_content 'test'
  end
end
