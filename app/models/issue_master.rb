class IssueMaster < ActiveRecord::Base
  belongs_to :issue_tracker_group
  belongs_to :issue_type
  has_many :issue_requests

  validates :name, presence: true
end
