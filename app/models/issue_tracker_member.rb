class IssueTrackerMember < ActiveRecord::Base
  belongs_to :issue_tracker_group
  belongs_to :employee
  has_many :issue_requests
  has_many :issue_tracker_accesses


  validates :issue_tracker_group_id, presence: true
  validates :employee_id, presence: true
  validates :role, presence: true
  
  validates_uniqueness_of :issue_tracker_group_id, :scope => :employee_id
end
