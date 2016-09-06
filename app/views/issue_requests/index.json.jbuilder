json.array!(@issue_requests) do |issue_request|
  json.extract! issue_request, :id, :issue_master_id, :issue_tracker_member_id, :issue_tracker_group_id, :description, :date, :time, :employee_id, :issue_priority, :status_id, :is_confirm_id
  json.url issue_request_url(issue_request, format: :json)
end
