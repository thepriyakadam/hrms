json.extract! loan_type, :id, :code, :name, :description, :from, :to, :interest_rate, :status, :created_at, :updated_at
json.url loan_type_url(loan_type, format: :json)
