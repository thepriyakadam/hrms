json.array!(@training_requests) do |training_request|
  json.extract! training_request, :id, :employee_id, :training_topic, :training_period, :training_date, :reporting_master_id, :description
  json.url training_request_url(training_request, format: :json)
end
