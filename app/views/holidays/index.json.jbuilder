json.array!(@holidays) do |holiday|
  json.extract! holiday, :id, :code, :name, :description, :holiday_date
  json.url holiday_url(holiday, format: :json)
end
