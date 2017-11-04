json.extract! employee_plan, :id, :employee_id, :from_date, :to_date, :from_time, :to_time, :meeting_with, :location, :meeting_agenda, :lat, :lng, :conform, :status, :current_status, :manager_id, :created_at, :updated_at
json.url employee_plan_url(employee_plan, format: :json)
