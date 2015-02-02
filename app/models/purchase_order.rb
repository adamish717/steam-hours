class PurchaseOrder < ActiveRecord::Base
  belongs_to :client, inverse_of: :purchase_orders
  validates :title, :client, presence: true
end
