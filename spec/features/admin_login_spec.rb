require 'rails_helper'

describe 'admin log in', type: :system do
  it 'admin log in' do
    visit "/"
    within('#top-nav-bar') do
    find(class: "login_out").click
  end

  expect(page).to have_content 'УВІЙТИ'
  end

  it 'admin sees admin panel' do
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
  sleep 10
  expect(page).to have_content "Товари"
end
end
