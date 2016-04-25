json.array!(@travel_expences) do |travel_expence|
  json.extract! travel_expence, :id, :travel_request_id, :total_advance_amount, :total_expence_amount, :remaining_amount, :employee_amount, :company_amount
  json.url travel_expence_url(travel_expence, format: :json)
end
