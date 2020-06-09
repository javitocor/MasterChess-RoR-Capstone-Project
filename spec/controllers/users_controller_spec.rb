require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe UsersController, type: :feature do
  context 'GET users controller views' do
    let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }

    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end

    it 'Get #show' do
      visit user_path(user)
      expect(page).to have_content(user.fullname.to_s)
    end
  end
end
# rubocop:enable  Layout/LineLength
