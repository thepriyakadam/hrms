json.array!(@religions) do |religion|
  json.extract! religion, :id, :name, :code, :description
  json.url religion_url(religion, format: :json)
end
