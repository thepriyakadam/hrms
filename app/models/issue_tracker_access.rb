class IssueTrackerAccess < ActiveRecord::Base
  belongs_to :employee
  belongs_to :issue_tracker_member
  belongs_to :issue_tracker_group

 validates_uniqueness_of :issue_tracker_group_id, :scope => :issue_tracker_member_id
  # svalidates :name, presence: true
  # validates :, presence: true
   validates :role, presence: true
   validates :issue_tracker_group_id, presence: true
   validates :issue_tracker_member_id, presence: true
end