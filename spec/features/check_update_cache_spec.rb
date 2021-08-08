require 'rails_helper'

describe 'cache will be chang if prices of product was changed', type: :system do
  before do
    Spree::Config.rate = 2.00
    Spree::Product.find(1).default_variant.prices.each{|price| price.update!(amount_usd: 5.00)}
  end
  it 'Displays products in catalog' do
    visit "/products"

    product = find("#product_1")
   expect(product).to have_content 10.00
  end
end
