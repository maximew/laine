json.array!(@categories) do |category|
  json.extract! category, :id, :libelle
  json.url category_url(category, format: :json)
end
