json.array!(@overtime_month_records) do |overtime_month_record|
  json.extract! overtime_month_record, :id, :employee_id, :overtime_data, :attendance_bonus_amount, :paid_holiday_amount
  json.url overtime_month_record_url(overtime_month_record, format: :json)
end
