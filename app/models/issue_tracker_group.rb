class IssueTrackerGroup < ActiveRecord::Base
 has_many :issue_tracker_members
 has_many :issue_masters
 validates :name, presence: true
 validates :email, presence: true
end
