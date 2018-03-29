json.array!(@training_approvals) do |training_approval|
  json.extract! training_approval, :id, :training_request_id, :employee_id, :training_topic_master_id, :reporting_master_id, :traininig_period, :training_date, :place, :no_of_employee, :description, :justification
  json.url training_approval_url(training_approval, format: :json)
end
