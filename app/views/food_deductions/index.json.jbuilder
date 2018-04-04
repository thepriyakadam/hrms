json.array!(@food_deductions) do |food_deduction|
  json.extract! food_deduction, :id, :food_date, :no_of_coupan, :rate, :amount, :employee_id
  json.url food_deduction_url(food_deduction, format: :json)
end
