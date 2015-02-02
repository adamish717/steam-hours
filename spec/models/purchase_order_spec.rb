require 'rails_helper'

RSpec.describe PurchaseOrder, :type => :model do
  describe 'client' do
    let!(:client) { Client.create(name: 'temp_client') }
    let!(:purchase_order) { client.purchase_orders.create(title: 'temp_client_po') }

    it 'must have a client' do
      p = PurchaseOrder.new(title: 'Orphan purchase order')
      p.save
      expect(p).to_not be_valid
    end

    it 'remains in sync' do
      client.name = 'New name'
      expect(purchase_order.client.name).to be(client.name)
    end
  end
end
