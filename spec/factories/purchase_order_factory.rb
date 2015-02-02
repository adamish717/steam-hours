FactoryGirl.define do
  factory :purchase_order do
    title 'Example PO'
    description 'Example PO description.'
    active true
    client
  end
end
