json.extract! loan_request, :id, :membership_id, :date, :loan_type_id, :emi, :created_at, :updated_at
json.url loan_request_url(loan_request, format: :json)
