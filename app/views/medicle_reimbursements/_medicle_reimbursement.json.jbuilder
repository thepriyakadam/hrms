json.extract! medicle_reimbursement, :id, :investment_declaration_id, :bill_no, :bill_date, :name_on_invoice, :estimated_amt, :actual_amt, :toatal_amt, :created_at, :updated_at
json.url medicle_reimbursement_url(medicle_reimbursement, format: :json)
