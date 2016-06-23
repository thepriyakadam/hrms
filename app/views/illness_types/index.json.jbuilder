json.array!(@illness_types) do |illness_type|
  json.extract! illness_type, :id, :code, :name, :description
  json.url illness_type_url(illness_type, format: :json)
end
