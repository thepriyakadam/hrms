json.array!(@annual_salary_masters) do |annual_salary_master|
  json.extract! annual_salary_master, :id, :employee_id, :name, :code, :description, :amount
  json.url annual_salary_master_url(annual_salary_master, format: :json)
end
