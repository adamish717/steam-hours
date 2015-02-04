class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.text :parts_used
      t.belongs_to :purchase_order, index: true

      t.timestamps null: false
    end
    add_foreign_key :entries, :purchase_orders
  end
end
