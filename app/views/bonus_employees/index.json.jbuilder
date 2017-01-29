json.array!(@bonus_employees) do |bonus_employee|
  json.extract! bonus_employee, :id, :employee_id, :bonus_date, :amount
  json.url bonus_employee_url(bonus_employee, format: :json)
end
