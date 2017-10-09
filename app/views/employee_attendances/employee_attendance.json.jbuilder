json.array!(@employee_attendances) do |employee_attendance|
 json.extract! employee_attendance, :id, :present, :day
 json.start employee_attendance.day
 json.end employee_attendance.day
 json.url employee_attendance_url(employee_attendance, format: :html)
end