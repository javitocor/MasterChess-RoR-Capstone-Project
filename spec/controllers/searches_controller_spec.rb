require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe SearchesController, type: :feature do
  context 'Testing search bar' do
    let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }

    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit root_path
      fill_in 'gambit_text', with: 'Gambit testing'
      click_button 'Gambit'
      sleep(2)
      fill_in 'gambit_text', with: 'I am a human'
      click_button 'Gambit'
    end
    scenario 'Testing search bar' do
      visit root_path
      fill_in 'search', with: 'Gambit'
      click_button 'Search'
      sleep(2)
      expect(page).to have_content('Gambit')
    end
    scenario 'testing search bar 2' do
      visit root_path
      fill_in 'search', with: 'human'
      click_button 'Search'
      sleep(2)
      expect(page).not_to have_content('Gambit')
    end
  end
end
# rubocop:enable Layout/LineLength
