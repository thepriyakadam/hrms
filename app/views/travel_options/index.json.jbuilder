json.array!(@travel_options) do |travel_option|
  json.extract! travel_option, :id, :code, :name, :discription
  json.url travel_option_url(travel_option, format: :json)
end
