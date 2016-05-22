json.array!(@travel_modes) do |travel_mode|
  json.extract! travel_mode, :id, :code, :name, :description
  json.url travel_mode_url(travel_mode, format: :json)
end
