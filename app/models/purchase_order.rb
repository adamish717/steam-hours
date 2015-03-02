class PurchaseOrder < ActiveRecord::Base
  belongs_to :client, inverse_of: :purchase_orders
  has_many :entries, inverse_of: :purchase_order, dependent: :restrict_with_error
  validates :title, :client, presence: true
end
