json.array!(@overtime_daily_records) do |overtime_daily_record|
  json.extract! overtime_daily_record, :id, :employee_id, :ot_daily_date, :ot_daily_hrs, :ot_rate, :ot_daily_amount
  json.url overtime_daily_record_url(overtime_daily_record, format: :json)
end
