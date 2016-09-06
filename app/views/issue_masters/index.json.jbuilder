json.array!(@issue_masters) do |issue_master|
  json.extract! issue_master, :id, :issue_tracker_group_id, :issue_type_id, :name, :description, :status, :is_confirm
  json.url issue_master_url(issue_master, format: :json)
end
