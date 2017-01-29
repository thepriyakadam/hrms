json.array!(@accident_records) do |accident_record|
  json.extract! accident_record, :id, :code, :employee_id, :accident_date, :esic_no, :case_type, :type_of_injury, :leave_date_range, :no_of_day, :description
  json.url accident_record_url(accident_record, format: :json)
end
