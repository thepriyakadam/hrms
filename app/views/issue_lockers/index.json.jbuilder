json.array!(@issue_lockers) do |issue_locker|
  json.extract! issue_locker, :id, :issue_request_id, :employee_id, :status
  json.url issue_locker_url(issue_locker, format: :json)
end
