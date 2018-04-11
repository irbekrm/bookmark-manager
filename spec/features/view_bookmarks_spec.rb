require 'pg'
require_relative './web_helpers.rb'

feature 'A user can view bookmarks', type: :feature do
  scenario 'A user visits "/"' do
    add_bookmarks
    visit '/'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Destroy All Software'
  end
end
    
