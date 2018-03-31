json.extract! service_master, :id, :code, :name, :description, :status, :created_at, :updated_at
json.url service_master_url(service_master, format: :json)