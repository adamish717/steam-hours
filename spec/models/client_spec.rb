require 'rails_helper'

RSpec.describe Client, :type => :model do
  describe 'name' do
    it 'is required' do
      c = Client.new(description: 'No name.')
      c.save
      expect(c).to_not be_valid
    end

    it 'must be unique' do
      c = Client.new(name: 'Best Client')
      c.save
      expect(c).to be_valid

      c2 = Client.new(name: 'Best Client')
      c2.save
      expect(c2).to_not be_valid
    end
  end
end
