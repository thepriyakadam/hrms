class IssueTrackerGroup < ActiveRecord::Base
 has_many :issue_tracker_members
 validates :name, presence: true
 validates :email, presence: true
end
