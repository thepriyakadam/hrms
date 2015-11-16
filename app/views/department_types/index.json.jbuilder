json.array!(@department_types) do |department_type|
  json.extract! department_type, :id, :name
  json.url department_type_url(department_type, format: :json)
end
