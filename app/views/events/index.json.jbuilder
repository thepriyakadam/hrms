 # json.array! @events, partial: 'events/event', as: :event
# json.array! @events do |event|
#   date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
#   json.id event.id
#   json.title event.title
#   json.start event.start.strftime(date_format)
#   json.end event.end.strftime(date_format)
#   # json.color event.color unless event.color.blank?
#   json.allDay event.all_day_event? ? true : false
#   json.update_url event_path(event, method: :patch)
#   json.edit_url edit_event_path(event)
# end
# json.array!(@events) do |event|
#   json.extract! event, :id, :title, :description, :start_time, :end_time
#   json.url event_url(event, format: :json)
# end

# json.array!(@events) do |event|
#   json.extract! event, :id, :title, :description, :start_time, :end_time
#   json.start event.start_time
#   json.end event.end_time
#   json.url event_url(event, format: :html)
# end

json.array!(@employee_attendances) do |employee_attendance|
 json.extract! employee_attendance,  :title
 json.start employee_attendance.day
 # json.end employee_attendance.day
 # json.url employee_attendance_url(employee_attendance, format: :html)
end

# json.array!(@events) do |event|
#   json.extract! event, :id, :title, :description
#   json.start event.start_time
#   json.end event.end_time
#   json.url event_url(event, format: :html)
# end