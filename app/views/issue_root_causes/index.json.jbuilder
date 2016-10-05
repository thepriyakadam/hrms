json.array!(@issue_root_causes) do |issue_root_cause|
  json.extract! issue_root_cause, :id, :issue_tracker_group_id, :name, :is_active, :is_confirm
  json.url issue_root_cause_url(issue_root_cause, format: :json)
end
