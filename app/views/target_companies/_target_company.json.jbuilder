json.extract! target_company, :id, :code, :name, :description, :status, :created_at, :updated_at
json.url target_company_url(target_company, format: :json)
