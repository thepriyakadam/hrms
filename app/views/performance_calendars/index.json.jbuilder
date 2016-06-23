json.array!(@performance_calendars) do |performance_calendar|
  json.extract! performance_calendar, :id, :period_id, :performance_activity_id, :start_date, :end_date
  json.url performance_calendar_url(performance_calendar, format: :json)
end
