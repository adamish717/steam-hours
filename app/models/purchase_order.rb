class PurchaseOrder < ActiveRecord::Base
  validates :title, presence: true
end
