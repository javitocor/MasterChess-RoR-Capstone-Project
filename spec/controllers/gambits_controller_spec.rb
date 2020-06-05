require 'rails_helper'
require 'capybara/rspec'

RSpec.describe GambitsController, type: :feature do
    context 'GET gambits controller views' do
        let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
    
        before :each do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          click_button 'Log in'
        end
  
        it 'Get #index' do
          visit root_path
          expect(page).to have_content("Who to Follow")
        end
    end
    context 'Display features' do 
        let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
    
        before :each do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          click_button 'Log in'
        end
        scenario 'Display gambits created by user' do
            visit root_path
            fill_in 'gambit_text', with: 'Gambit testing'
            click_button 'Gambit' 
            expect(page).to have_content('Gambit testing')
        end
        scenario 'Display only gambits of following users' do
            user2 = User.create(id: '2', username: 'Mick', fullname: 'Mick Jag', email: 'mick@example.com', password: 'password')
            visit user_path(user2)
            click_link 'Follow'
            click_link 'Resign'
            visit new_user_session_path
            fill_in 'user_email', with: user2.email
            fill_in 'user_password', with: user2.password
            click_button 'Log in'
            fill_in 'gambit_text', with: 'Gambit testing'
            click_button 'Gambit'
            click_link 'Resign'
            visit new_user_session_path
            fill_in 'user_email', with: user.email
            fill_in 'user_password', with: user.password
            click_button 'Log in'
            expect(page).to have_content('Gambit testing')
        end
        scenario 'Do not display gambits of users if are not followings' do 
            user2 = User.create(id: '2', username: 'Mick', fullname: 'Mick Jag', email: 'mick@example.com', password: 'password')
            click_link 'Resign'
            visit new_user_session_path
            fill_in 'user_email', with: user2.email
            fill_in 'user_password', with: user2.password
            click_button 'Log in'
            fill_in 'gambit_text', with: 'Gambit testing'
            click_button 'Gambit'
            click_link 'Resign'
            visit new_user_session_path
            fill_in 'user_email', with: user.email
            fill_in 'user_password', with: user.password
            click_button 'Log in'
            expect(page).not_to have_content('Gambit testing')
        end
    end
    describe 'fields in gambit index' do
        let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
    
        before :each do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          click_button 'Log in'
        end
        it 'gambit field in index page' do
          visit root_path
          expect(page).to have_content 'Add your gambit'
        end
      end
end