require 'rails_helper'

describe 'vip user sees vip prices', type: :system do
  let(:user_vip) { create(:user) }
  before do
    user_vip.update!(spree_role_ids: Spree::Role.find_by(name: "vip").id)
    Spree::Config.rate = 1.00
    Spree::Product.last.delete
    Spree::Product.last.delete
    Spree::Product.last.update!(name: "test")
    Spree::Product.last.default_variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip")).update!(amount_usd: 2.00)
  end
  it 'Displays products in catalog' do
    visit "/"
    within('#top-nav-bar') do
    find(class: "login_out").click
  end
  sleep 10
    within('#password-credentials') do
    fill_in 'spree_user_email', with: user_vip.email
    fill_in "spree_user_password", with: user_vip.password
  end
  click_button("Увійти")
    visit "/products"
    sleep 10
    within('.plp-sort') do
    find(class: "spree-icon-arrow").click
  end
  first('.plp-sort-dropdown-ul-li').click
  sleep 10
    product = find("#product_#{Spree::Product.last.id}")

   expect(product).to have_content 2.00
  end
end
