json.array!(@access_issue_requests) do |access_issue_request|
  json.extract! access_issue_request, :id, :issue_tracker_access_id, :issue_request_id, :status, :current_status
  json.url access_issue_request_url(access_issue_request, format: :json)
end
