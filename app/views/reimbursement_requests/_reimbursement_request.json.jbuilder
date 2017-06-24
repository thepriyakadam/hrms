json.extract! reimbursement_request, :id, :employee_id, :reimbursement_head_id, :date, :amount, :status, :approval_id, :created_at, :updated_at
json.url reimbursement_request_url(reimbursement_request, format: :json)
