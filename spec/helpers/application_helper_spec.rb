require 'rails_helper'
require 'capybara/rspec'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  context 'Testing title' do
    it 'returns the default title' do
      expect(helper.full_title).to eq('Masterchess')
    end
    it 'returns the correct title' do
      expect(helper.full_title('Home')).to eq('Home | Masterchess')
    end
  end
end
