class Client < ActiveRecord::Base
  has_many :purchase_orders, inverse_of: :client, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
