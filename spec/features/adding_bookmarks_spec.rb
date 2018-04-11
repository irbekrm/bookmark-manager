require 'pg'

feature 'A user can add a new bookmark', type: :feature do
  scenario 'A user adds a valid bookmark' do
    add_bookmarks
    visit '/'
    click_button 'New'
    fill_in 'url', with: 'http://delfi.lv'
    fill_in 'title', with: 'Delfi'
    click_button 'Submit'
    expect(page).to have_content 'Delfi'
  end

  scenario 'A user adds an invalid bookmark' do
    add_bookmarks
    visit '/'
    click_button 'New'
    fill_in 'url', with: 'jerewroiewio'
    fill_in 'title', with: 'random'
    click_button 'Submit'
    expect(page).to have_content 'ERROR: Invalid URL'
  end
end
