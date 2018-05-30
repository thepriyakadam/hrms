json.extract! meeting_minute, :id, :employee_plan_id, :minutes, :created_at, :updated_at
json.url meeting_minute_url(meeting_minute, format: :json)
