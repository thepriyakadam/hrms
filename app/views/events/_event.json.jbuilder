# json.extract! event, :id, :title, :description, :start_time, :end_time, :created_at, :updated_at
# json.url event_url(event, format: :json)

json.array!(@events) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event, format: :html)
end
