require 'pg'

feature 'A user can add a new bookmark', type: :feature do
  scenario 'A user adds a bookmark' do
    add_bookmarks
    visit '/'
    click_button 'New'
    fill_in 'url', with: 'http://delfi.lv'
    fill_in 'title', with: 'Delfi'
    click_button 'Submit'
    expect(page).to have_content 'Delfi'
  end
end
