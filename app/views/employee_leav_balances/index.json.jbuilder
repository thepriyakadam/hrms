json.array!(@employee_leav_balances) do |employee_leav_balance|
  json.extract! employee_leav_balance, :id, :employee_id, :leav_category_id, :no_of_leave
  json.url employee_leav_balance_url(employee_leav_balance, format: :json)
end
