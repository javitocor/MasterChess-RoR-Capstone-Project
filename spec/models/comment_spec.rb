require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Comment, type: :model do
  context 'Comments associations tests' do
    it { should belong_to(:user) }
    it { should belong_to(:gambit) }
  end
  context 'Validations for comments' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(200).with_long_message('200 characters in comment is the maximum allowed.') }
  end
end
