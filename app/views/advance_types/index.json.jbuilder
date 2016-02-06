json.array!(@advance_types) do |advance_type|
  json.extract! advance_type, :id, :code, :name, :description
  json.url advance_type_url(advance_type, format: :json)
end
