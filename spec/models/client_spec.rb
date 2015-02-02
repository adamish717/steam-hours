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

  describe 'purchase orders' do
    let!(:client) { Client.create(name: 'temp_client') }
    let!(:purchase_order) { client.purchase_orders.create(title: 'temp_client_po') }

    it 'associates POs with a client' do
      expect(client.purchase_orders).to include(purchase_order)
    end

    it 'cleans up POs' do
      client.destroy
      expect(client.destroyed?).to be true
      expect(purchase_order.destroyed?).to be true
    end
  end
end
