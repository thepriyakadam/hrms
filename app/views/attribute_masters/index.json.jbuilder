json.array!(@attribute_masters) do |attribute_master|
  json.extract! attribute_master, :id, :code, :name, :definition, :status
  json.url attribute_master_url(attribute_master, format: :json)
end
