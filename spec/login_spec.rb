require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength, Metrics/BlockLength
RSpec.describe 'Login and signup features', type: :feature do
  context 'login and logout' do
    let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
    scenario 'login' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'logout after login' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      click_link 'Resign'
      expect(page).to have_content('Sign In')
    end
    scenario 'validating email' do
      visit new_user_session_path
      fill_in 'user_email', with: 'thing@.com'
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
    scenario 'validating password' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '56454'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
  context 'signup' do
    scenario 'signup' do
      visit new_user_registration_path
      fill_in 'user_username', with: 'Peter'
      fill_in 'user_fullname', with: 'Peter Grif'
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content('Welcome!')
    end
    scenario 'fail signup' do
      visit new_user_registration_path
      click_button 'Sign Up'
      expect(page).to have_content('Please review the problems below:')
    end
    scenario 'username validation' do
      visit new_user_registration_path
      fill_in 'user_fullname', with: 'Peter Grif'
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content("Username can't be blank")
    end
    scenario 'fullname validation' do
      visit new_user_registration_path
      fill_in 'user_username', with: 'Peter'
      fill_in 'user_email', with: 'peter@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content("Fullname can't be blank")
    end
    scenario 'email validation' do
      visit new_user_registration_path
      fill_in 'user_username', with: 'Peter'
      fill_in 'user_fullname', with: 'Peter Grif'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content("Email can't be blank")
    end
    scenario 'password validation' do
      visit new_user_registration_path
      fill_in 'user_username', with: 'Peter'
      fill_in 'user_fullname', with: 'Peter Grif'
      fill_in 'user_email', with: 'peter@example.com'
      click_button 'Sign Up'
      expect(page).to have_content("Password can't be blank")
    end
    scenario 'Valid email' do
      visit new_user_registration_path
      fill_in 'user_username', with: 'Peter'
      fill_in 'user_fullname', with: 'Peter Grif'
      fill_in 'user_email', with: 'peterexample.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content('Email is invalid')
    end
  end
  describe 'fields in access pages' do
    it 'email field in login page' do
      visit new_user_session_path
      expect(page).to have_content 'Email'
    end
    it 'password field in login page' do
      visit new_user_session_path
      expect(page).to have_content 'Password'
    end
    it 'username field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Username'
    end
    it 'fullname field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Fullname'
    end
    it 'email field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Email'
    end
    it 'password field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'Password'
    end
    it 'password confirmation field in signup page' do
      visit new_user_registration_path
      expect(page).to have_content 'confirmation'
    end
  end
end
# rubocop:enable  Layout/LineLength, Metrics/BlockLength
