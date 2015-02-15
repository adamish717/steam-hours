require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EntriesHelper. For example:
#
# describe EntriesHelper do
#   describe 'string concat' do
#     it 'concats two strings with spaces' do
#       expect(helper.concat_strings('this','that')).to eq('this that')
#     end
#   end
# end
RSpec.describe EntriesHelper, type: :helper do
  before do
    Timecop.freeze
  end

  after do
    Timecop.return
  end

  describe 'time_range_length' do
    let(:range) { (8.hours.ago .. 0.hours.ago) }

    it 'is a number' do
      expect(time_range_length(range).class).to be(Fixnum)
    end

    it 'is the number of seconds in a range of time' do
      expect(time_range_length(range)).to be(8.hours.to_i)
    end
  end

  describe 'time_billed' do
    let(:entries) { FactoryGirl.create_list(:entry, 5) }

    it 'adds up the duation of all entries' do
      expect(time_billed(entries)).to eq(40.hours.to_i)
    end

    it 'survives an empty list' do
      expect(time_billed([])).to eq(0)
    end
  end
end
