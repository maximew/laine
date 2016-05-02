json.array!(@stores) do |store|
  json.extract! store, :id, :image, :category_id
  json.url store_url(store, format: :json)
end
