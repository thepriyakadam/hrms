json.extract! event_detail, :id, :date, :name, :description, :status, :created_at, :updated_at
json.url event_detail_url(event_detail, format: :json)
