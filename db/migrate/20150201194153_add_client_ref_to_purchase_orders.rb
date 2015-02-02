class AddClientRefToPurchaseOrders < ActiveRecord::Migration
  def change
    add_reference :purchase_orders, :client, index: true
    add_foreign_key :purchase_orders, :clients
  end
end
