require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength
RSpec.describe Gambit, type: :model do
  context 'Gambit associations tests' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  context 'Validations for gambits' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(1000).with_long_message('1000 characters in gambit is the maximum allowed.') }
  end
  context 'Testing scopes for gambit' do
    it 'applies a default scope to gambits by most recent' do
      expect(Gambit.all.ordered_by_most_recent.to_sql).to eq Gambit.all.order(created_at: :desc).to_sql
    end
  end
end
# rubocop:enable  Layout/LineLength
