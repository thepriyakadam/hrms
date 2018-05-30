class IssueHistory < ActiveRecord::Base
  belongs_to :issue_request
  belongs_to :issue_master
  belongs_to :employee
  belongs_to :issue_tracker_member
  belongs_to :issue_tracker_group
end
