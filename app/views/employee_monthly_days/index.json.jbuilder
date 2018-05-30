json.array!(@employee_monthly_days) do |employee_monthly_day|
  json.extract! employee_monthly_day, :id, :employee_id, :month, :year_id, :overtime
  json.url employee_monthly_day_url(employee_monthly_day, format: :json)
end
