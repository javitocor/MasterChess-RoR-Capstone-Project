require 'rails_helper'
require 'capybara/rspec'

RSpec.describe FollowingsController, type: :feature do
    context 'Followings management' do
        let(:user) { User.create(id: '1', username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password') }
      before :each do      
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'Log in'
      end
      scenario 'follows a user' do 
        user2 = User.create(id: '2', username: 'Mick', fullname: 'Mick Jag', email: 'mick@example.com', password: 'password')
        visit user_path(user2)
        click_link 'Follow'
        expect(page).to have_content('You follow this user.')
      end
      scenario 'unfollow a user' do 
        user2 = User.create(id: '2', username: 'Mick', fullname: 'Mick Jag', email: 'mick@example.com', password: 'password')
        visit user_path(user2)
        click_link 'Follow'
        sleep(2)
        click_link 'Unfollow'
        expect(page).to have_content('You unfollow this user.')
      end
    end
  end