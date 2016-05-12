json.array!(@training_plans) do |training_plan|
  json.extract! training_plan, :id, :training_date, :topic, :no_of_employee, :trainer_name, :no_of_days, :no_of_hrs, :place
  json.url training_plan_url(training_plan, format: :json)
end
