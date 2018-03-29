json.array!(@employee_bank_details) do |employee_bank_detail|
  json.extract! employee_bank_detail, :id, :employee_id, :account_no, :bank_name, :branch_name, :address, :contact_no, :micr_code, :branch_code, :ifsc_code
  json.url employee_bank_detail_url(employee_bank_detail, format: :json)
end
