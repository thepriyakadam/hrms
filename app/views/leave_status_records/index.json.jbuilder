json.array!(@leave_status_records) do |leave_status_record|
  json.extract! leave_status_record, :id, :employee_leav_request_id, :change_status_employee_id, :status, :change_date
  json.url leave_status_record_url(leave_status_record, format: :json)
end
