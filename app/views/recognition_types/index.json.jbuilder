json.array!(@recognition_types) do |recognition_type|
  json.extract! recognition_type, :id, :code, :name, :description, :status
  json.url recognition_type_url(recognition_type, format: :json)
end
