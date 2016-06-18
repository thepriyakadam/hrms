json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :code, :name, :definition, :status
  json.url attribute_url(attribute, format: :json)
end
