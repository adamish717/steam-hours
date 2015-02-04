json.array!(@entries) do |entry|
  json.extract! entry, :id, :start_at, :end_at, :description, :parts_used, :purchase_order_id
  json.url entry_url(entry, format: :json)
end
