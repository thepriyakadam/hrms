json.extract! loan_emi, :id, :loan_approval_id, :date, :emi_amount, :status, :created_at, :updated_at
json.url loan_emi_url(loan_emi, format: :json)
