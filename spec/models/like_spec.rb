require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe Like, type: :model do
  context 'Like associations tests' do
    it { should belong_to(:user) }
    it { should belong_to(:gambit) }
  end
  context 'Validations for likes' do
    it do
      user = User.create!(username: 'Peter', fullname: 'Peter Grif', email: 'peter@example.com', password: 'password', password_confirmation: 'password')
      gambit = Gambit.create!(text: 'I am Peter!', user_id: user.id)
      Like.create!(user_id: user.id, gambit_id: gambit.id)
      should validate_uniqueness_of(:user_id).scoped_to(:gambit_id)
    end
  end
end
# rubocop:enable  Layout/LineLength
