require_relative '../../lib/bookmark.rb'

feature 'A user can select and delete a bookmark', type: :feature do
  scenario 'A user deletes a bookmark' do
    add_bookmarks
    visit '/'
    allow(Kernel).to receive(:rand).with(0..9).and_return(9)
    allow(Kernel).to receive(:rand).with(97..122).and_return(97)
    click_button 'New'
    fill_in 'url', with: 'http://latvijasradio.lv'
    fill_in 'title', with: 'Latvijas Radio'
    click_button 'Submit'
    find_by_id('aa9999').click
    expect(page).not_to have_content 'Latvijas Radio' 
  end
end
        
