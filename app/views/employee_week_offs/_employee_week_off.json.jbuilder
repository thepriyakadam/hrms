json.extract! employee_week_off, :id, :week_off_master_id, :employee_id, :day, :date, :status, :is_confirm, :created_at, :updated_at
json.url employee_week_off_url(employee_week_off, format: :json)