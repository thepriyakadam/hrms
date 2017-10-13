# json.array!(@employee_attendances) do |employee_attendance|
#  json.extract! employee_attendance, :id, :day, :present
#  json.in employee_attendance.in_time
#  json.out employee_attendance.out_time
#  json.url employee_attendance_url(employee_attendance, format: :html)
# end

json.extract! @employee_attendance, :id, :present, :day