class IssueMaster < ActiveRecord::Base
  belongs_to :issue_tracker_group
  belongs_to :issue_type
  has_many :issue_requests

  validates :name, presence: true
  validates :issue_tracker_group_id, presence: true
  validates :issue_type_id, presence: true
end
