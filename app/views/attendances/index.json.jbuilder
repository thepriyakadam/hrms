json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :employee_shift_id, :employee_id, :attendance_date, :check_in, :check_out, :company_hrs, :over_time_hrs, :total_hrs
  json.url attendance_url(attendance, format: :json)
end
