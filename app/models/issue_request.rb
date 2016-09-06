class IssueRequest < ActiveRecord::Base
  belongs_to :issue_master
  belongs_to :issue_tracker_member
  belongs_to :issue_tracker_group
  belongs_to :employee
  belongs_to :status
  belongs_to :is_confirm
end
