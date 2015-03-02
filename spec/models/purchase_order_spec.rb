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

  context 'with associated entries' do
    let!(:purchase_order) { FactoryGirl.create(:purchase_order) }
    let!(:entry) { FactoryGirl.create(:entry, purchase_order: purchase_order) }

    it 'cannot be deleted' do
      purchase_order.destroy
      expect(purchase_order.destroyed?).to be(false)
      expect(purchase_order.errors.messages[:base]).to include('Cannot delete record because dependent entries exist')
      expect(entry.purchase_order).to be(purchase_order)
    end
  end
end
