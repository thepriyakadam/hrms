json.array!(@cars) do |car|
  json.extract! car, :id, :name, :age
  json.url car_url(car, format: :json)
end
