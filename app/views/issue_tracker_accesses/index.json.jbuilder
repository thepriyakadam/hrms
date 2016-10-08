json.array!(@issue_tracker_accesses) do |issue_tracker_access|
  json.extract! issue_tracker_access, :id, :name, :role, :employee_id, :status, :is_confirm
  json.url issue_tracker_access_url(issue_tracker_access, format: :json)
end
