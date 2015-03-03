json.array!(@clients) do |client|
  json.extract! client, :id, :name, :description
  json.url admin_client_url(client, format: :json)
end
