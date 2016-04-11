json.array!(@week_offs) do |week_off|
  json.extract! week_off, :id, :weekoff_date_range, :employee_id
  json.url week_off_url(week_off, format: :json)
end
