require 'rails_helper'

describe 'admin changes contacts', type: :system do

it 'admin changes contact first_mob and new first mobile nomber changes on page' do
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
visit "/admin/settings/index"
first(:css, "input[id$='name_new']").set("10$%^&")
click_on('Змінити', match: :first)
sleep 25
visit "/contact-us"
expect(page).to have_content '10$%^&'
end
end
