class AccessIssueRequest < ActiveRecord::Base
  belongs_to :issue_tracker_access
  belongs_to :issue_request
end
