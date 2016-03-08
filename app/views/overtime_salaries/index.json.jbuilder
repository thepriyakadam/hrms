json.array!(@overtime_salaries) do |overtime_salary|
  json.extract! overtime_salary, :id, :employee_id, :date, :ot_hrs, :ot_esic_amount, :total_amount, :attendence_bouns_amount, :paid_holiday_amount, :net_payble_amount
  json.url overtime_salary_url(overtime_salary, format: :json)
end
