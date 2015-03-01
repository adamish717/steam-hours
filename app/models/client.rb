class Client < ActiveRecord::Base
  has_many :purchase_orders, -> { order 'title ASC' }, inverse_of: :client, dependent: :destroy
  has_many :entries, through: :purchase_orders
  validates :name, presence: true, uniqueness: true
end
