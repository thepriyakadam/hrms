json.array!(@employee_daily_activities) do |employee_daily_activity|
  json.extract! employee_daily_activity, :id, :employee_id, :project_master_id, :today_activity, :tomorrow_plan
  json.url employee_daily_activity_url(employee_daily_activity, format: :json)
end
