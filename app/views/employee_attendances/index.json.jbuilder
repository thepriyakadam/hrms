json.array!(@employee_attendances) do |employee_attendance|
  json.extract! employee_attendance, :id, :employee_id, :day, :present, :in, :out
  json.url employee_attendance_url(employee_attendance, format: :json)
end
