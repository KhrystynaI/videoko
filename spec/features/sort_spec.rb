require 'rails_helper'

describe 'sort products', type: :system do
  before do
    Spree::Product.last.update!(name: "test")
  end

  it 'Displays unsorted products' do
    visit "/"
    click_on(class: 'btn_catalog')
    sleep 10
    first(".product_card").click
    sleep 10
  expect(page).to have_content 'назва'
  end

  it 'Displays sort by date' do
    visit "/"
    click_on(class: 'btn_catalog')
    sleep 10
    within('.plp-sort') do
    find(class: "spree-icon-arrow").click
  end

    first('.plp-sort-dropdown-ul-li').click
    sleep 10
    first(".product_card").click
    sleep 10
  expect(page).to have_content 'test'
end

end
