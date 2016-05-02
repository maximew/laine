json.array!(@portals) do |portal|
  json.extract! portal, :id, :image, :category_id
  json.url portal_url(portal, format: :json)
end
