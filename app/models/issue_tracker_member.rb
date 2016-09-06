class IssueTrackerMember < ActiveRecord::Base
  belongs_to :issue_tracker_group
  belongs_to :employee
end
