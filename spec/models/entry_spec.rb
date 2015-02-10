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
  end
end
