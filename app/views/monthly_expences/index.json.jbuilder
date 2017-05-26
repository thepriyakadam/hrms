json.array!(@monthly_expences) do |monthly_expence|
  json.extract! monthly_expence, :id, :expence_date, :amount, :employee_id
  json.url monthly_expence_url(monthly_expence, format: :json)
end
