require 'rails_helper'

RSpec.describe Entry, :type => :model do
  describe 'entry' do
    let!(:entry) { FactoryGirl.create(:entry) }

    it 'must have a description' do
      entry.description = nil
      entry.save
      expect(entry).to_not be_valid
    end

    it 'must have a start time' do
      entry.start_at = nil
      entry.save
      expect(entry).to_not be_valid
    end

    it 'must have a end time' do
      entry.end_at = nil
      entry.save
      expect(entry).to_not be_valid
    end

    it 'must have a purchase order' do
      entry.purchase_order = nil
      entry.save
      expect(entry).to_not be_valid
    end

    it 'must start before ending' do
      entry.end_at = entry.start_at.advance(hours: -1)
      expect(entry).to_not be_valid
    end

    describe 'duration' do
      it 'is a range' do
        expect(entry.duration.class).to be(Range)
      end

      it 'stretches from start_a to end_at' do
        expect(entry.duration.begin).to be(entry.start_at)
        expect(entry.duration.end).to be(entry.end_at)
      end
    end
  end
end
