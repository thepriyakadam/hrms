json.array!(@employee_transfers) do |employee_transfer|
  json.extract! employee_transfer, :id, :employee_id, :reporting_master_id, :employee_designation_id, :employee_category_id, :company_id, :company_location_id, :department_id, :justification
  json.url employee_transfer_url(employee_transfer, format: :json)
end
