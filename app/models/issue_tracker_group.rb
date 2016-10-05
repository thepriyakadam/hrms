class IssueTrackerGroup < ActiveRecord::Base
 has_many :issue_tracker_members
 has_many :issue_tracker_accesses
 has_many :issue_masters
 has_many :issue_tracker_groups
 has_many :issue_root_causes
 validates :name, presence: true
 validates :email, presence: true
end
