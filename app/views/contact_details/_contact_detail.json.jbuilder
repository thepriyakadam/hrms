json.extract! contact_detail, :id, :employee_id, :name, :description, :status, :created_at, :updated_at
json.url contact_detail_url(contact_detail, format: :json)
