feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    sign_in_and_play
    expect(page).to have_content 'Charlotte vs. Mittens'
  end
  
  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end

  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Charlotte attacked Mittens'
  end
end

feature 'Attacking' do
  # 'attack Player 2' scenario omitted

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end