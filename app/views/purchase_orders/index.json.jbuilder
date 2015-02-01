json.array!(@purchase_orders) do |purchase_order|
  json.extract! purchase_order, :id, :title, :description, :active
end
