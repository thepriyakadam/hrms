json.array!(@employee_shifts) do |employee_shift|
  json.extract! employee_shift, :id, :company_shift_id, :employee_id
  json.url employee_shift_url(employee_shift, format: :json)
end
