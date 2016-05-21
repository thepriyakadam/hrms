json.array!(@travel_expence_types) do |travel_expence_type|
  json.extract! travel_expence_type, :id, :code, :name, :description
  json.url travel_expence_type_url(travel_expence_type, format: :json)
end
