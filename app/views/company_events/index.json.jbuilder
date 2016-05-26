json.array!(@company_events) do |company_event|
  json.extract! company_event, :id, :event_name, :event_date, :location, :status, :time
  json.url company_event_url(company_event, format: :json)
end
