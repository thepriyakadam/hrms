json.array!(@advance_salaries) do |advance_salary|
  json.extract! advance_salary, :id, :employee_id, :advance_amount, :no_of_instalment, :instalment_amount, :advance_date
  json.url advance_salary_url(advance_salary, format: :json)
end
