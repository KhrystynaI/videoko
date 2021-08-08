require 'rails_helper'

describe 'admin changes rate', type: :system do

it 'admin changes rate and amount of all products also changes',:perform_enqueued do
  Spree::Config.rate = 1.00
  Spree::Product.last.default_variant.update(sku: 4826019)
  Spree::Product.first.default_variant.update(sku: 123)
  visit "/"
  within('#top-nav-bar') do
  find(class: "login_out").click
end
sleep 10
  within('#password-credentials') do
  fill_in 'spree_user_email', with: "spree@example.com"
  fill_in "spree_user_password", with: "spree123"
end
click_button("Увійти")
visit "/admin/products"
within('.page-actions') do
find('form input[type="file"]').set(Rails.root + 'spec/support/test_csv.csv')
click_button("Завантажити CSV")
sleep 25
end
expect(Spree::Variant.find_by(sku: 4826019).prices.find_by(role_id: Spree::Role.find_by(name: "vip1").id).amount).to eql 20.00
end

end
