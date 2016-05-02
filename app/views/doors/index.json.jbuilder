json.array!(@doors) do |door|
  json.extract! door, :id, :image, :category_id
  json.url door_url(door, format: :json)
end
