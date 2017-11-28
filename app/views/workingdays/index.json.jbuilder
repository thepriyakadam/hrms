json.array!(@workingdays) do |workingday|
  json.extract! workingday, :id, :employee_id, :month_name, :year, :day_in_month, :present_day, :total_leave, :holiday_in_month, :week_off_day, :absent_day, :payable_day
  json.url workingday_url(workingday, format: :json)
end
