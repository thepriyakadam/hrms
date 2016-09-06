class IssueTrackerAccess < ActiveRecord::Base
  belongs_to :employee
  validates :name, presence: true
  validates :role, presence: true
end
