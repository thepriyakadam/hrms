json.array!(@expencess_types) do |expencess_type|
  json.extract! expencess_type, :id, :code, :name, :description
  json.url expencess_type_url(expencess_type, format: :json)
end
