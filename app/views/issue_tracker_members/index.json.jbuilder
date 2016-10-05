json.array!(@issue_tracker_members) do |issue_tracker_member|
  json.extract! issue_tracker_member, :id, :issue_tracker_group_id, :employee_id, :status, :is_confirm
  json.url issue_tracker_member_url(issue_tracker_member, format: :json)
end
