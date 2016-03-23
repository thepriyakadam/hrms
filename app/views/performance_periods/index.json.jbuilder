json.array!(@performance_periods) do |performance_period|
  json.extract! performance_period, :id, :title, :start_date, :end_date, :description, :is_open
  json.url performance_period_url(performance_period, format: :json)
end
