json.array!(@instalments) do |instalment|
  json.extract! instalment, :id, :advance_salary_id, :instalment_date, :instalment_amount
  json.url instalment_url(instalment, format: :json)
end
