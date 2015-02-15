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

  describe 'merge_time_ranges' do
    context 'disjointed durations' do
      let(:ranges) {[
        (16.hours.ago .. 15.hours.ago),
        (12.hours.ago ..11.hours.ago),
        (8.hours.ago .. 7.hours.ago)
      ]}

      it 'assigns all entries as @entries' do
        merged = merge_time_ranges(ranges)
        expect(merged.count).to eq(3)
        expect(merged.first.begin).to eq(16.hours.ago)
        expect(merged.last.end).to eq(7.hours.ago)
      end
    end
    context 'overlapping durations' do
      let(:ranges) {[
        (16.hours.ago .. 8.hours.ago),
        (12.hours.ago .. 4.hours.ago),
        (8.hours.ago .. 0.hours.ago)
      ]}

      it 'assigns all entries as @entries' do
        merged = merge_time_ranges(ranges)
        expect(merged.count).to eq(1)
        expect(merged.first.begin).to eq(16.hours.ago)
        expect(merged.first.end).to eq(0.hours.ago)
      end
    end
    context 'out of order durations' do
      let(:ranges) {[
        (8.hours.ago .. 0.hours.ago),
        (12.hours.ago .. 4.hours.ago),
        (16.hours.ago .. 8.hours.ago)
      ]}

      it 'assigns all entries as @entries' do
        merged = merge_time_ranges(ranges)
        expect(merged.count).to eq(1)
        expect(merged.first.begin).to eq(16.hours.ago)
        expect(merged.first.end).to eq(0.hours.ago)
      end
    end
  end

  describe 'time_worked' do
    let(:entries) { [
      FactoryGirl.create(:entry, { start_at: 16.hours.ago, end_at: 8.hours.ago }),
      FactoryGirl.create(:entry, { start_at: 12.hours.ago, end_at: 4.hours.ago }),
      FactoryGirl.create(:entry, { start_at: 8.hours.ago, end_at: 0.hours.ago })
    ]}

    it 'totals the time spent working' do
      expect(time_worked(entries)).to eq(16.hours.to_i)
    end
  end
end
