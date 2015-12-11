json.array!(@districts) do |district|
  json.extract! district, :id, :state_id, :code, :name
  json.url district_url(district, format: :json)
end
