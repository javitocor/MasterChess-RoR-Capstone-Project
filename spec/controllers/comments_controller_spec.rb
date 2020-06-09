require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe CommentsController, type: :feature do
  context 'Comments management' do
    let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit root_path
      fill_in 'gambit_text', with: 'Gambit testing'
      click_button 'Gambit'
    end
    it 'creates a comment in a gambit' do
      gambit = Gambit.create!(text: 'I am Peter!', user_id: user.id)
      Comment.create!(content: 'This is my first comment', user_id: user.id, gambit_id: gambit.id)
      expect(user.comments.size).to eq(1)
    end
  end
end
# rubocop:enable  Layout/LineLength
