json.array!(@shutters) do |shutter|
  json.extract! shutter, :id, :image, :category_id
  json.url shutter_url(shutter, format: :json)
end
