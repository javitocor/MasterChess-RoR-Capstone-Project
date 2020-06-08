require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Following, type: :model do
  context 'Following associations tests' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end
end
