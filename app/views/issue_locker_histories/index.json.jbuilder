json.array!(@issue_locker_histories) do |issue_locker_history|
  json.extract! issue_locker_history, :id, :issue_locker_id, :issue_request_id, :employee_id, :status
  json.url issue_locker_history_url(issue_locker_history, format: :json)
end
