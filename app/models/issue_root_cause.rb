class IssueRootCause < ActiveRecord::Base
  belongs_to :issue_tracker_group
  validates :name, presence: true
  validates :issue_tracker_group_id, presence: true
end
