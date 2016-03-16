json.array!(@leave_c_offs) do |leave_c_off|
  json.extract! leave_c_off, :id, :employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status
  json.url leave_c_off_url(leave_c_off, format: :json)
end
