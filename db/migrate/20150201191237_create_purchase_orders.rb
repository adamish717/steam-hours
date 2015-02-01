class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :title
      t.text :description
      t.boolean :active

      t.timestamps null: false
    end
  end
end
