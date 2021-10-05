feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    fill_in :player, with: 'Charlotte'
    fill_in :player2, with: 'Mittens'
    click_button 'Submit'
    expect(page).to have_content 'Charlotte vs. Mittens'
  end
  
end