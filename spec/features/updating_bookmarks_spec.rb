require_relative '../../lib/bookmark.rb'

feature 'A user can update a bookmark', type: :feature do
  scenario 'User updates a bookmark' do
    visit '/'
    click_button 'New'
    fill_in 'url', with: 'http://latvijasradio.lv'
    fill_in 'title', with: 'Latvijas Radio'
    click_button 'Submit'
    click_button 'Update'
    fill_in 'url', with: 'http://latvijasradio.lv'
    fill_in 'title', with: 'LATVIJAS RADIO'
    click_button 'Apply changes'
    expect(page).to have_content 'LATVIJAS RADIO'
  end
end
