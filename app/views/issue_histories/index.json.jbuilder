json.array!(@issue_histories) do |issue_history|
  json.extract! issue_history, :id, :issue_request_id, :issue_master_id, :description, :date, :time, :employee_id, :issue_tracker_member_id, :issue_tracker_group_id, :issue_priority, :status, :is_confirm
  json.url issue_history_url(issue_history, format: :json)
end
