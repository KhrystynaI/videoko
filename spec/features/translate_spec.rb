require 'rails_helper'

describe 'First look', type: :system do
  
  it 'Displays translations uk' do
    visit "/"
    expect(page).to have_content 'ЗНАК ЯКОСТІ'
  end

  it 'Displays translations ru' do
    visit "/"
    click_on(class: 'btn_lang')
    find('.dropdown-menu', :text => 'RU').click
    expect(page).to have_content 'ЗНАК КАЧЕСТВА'
  end
end
