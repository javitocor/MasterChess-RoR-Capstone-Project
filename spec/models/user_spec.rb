require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe User, type: :model do
  context 'User associations tests' do
    it { should have_many(:gambits) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friends).class_name('Following').with_foreign_key('follower_id') }
    it { should have_many(:followers).class_name('Following').with_foreign_key('followed_id') }
  end
  context 'Validations for users' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:username).is_at_most(20) }
    it { should validate_length_of(:fullname).is_at_most(20) }
  end
  context 'Testing attachments for users' do
    user = User.create!(username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password', password_confirmation: 'password')
    it { expect(user.avatar).to be_attached }
    it { expect(user.cover_photo).to be_attached }
  end
end
# rubocop:enable  Layout/LineLength
