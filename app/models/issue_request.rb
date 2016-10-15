class IssueRequest < ActiveRecord::Base
  belongs_to :issue_master
  belongs_to :issue_tracker_member
  belongs_to :issue_tracker_group
  belongs_to :employee
  has_many :issue_lockers
  belongs_to :issue_root_cause

  validates :issue_tracker_group_id, presence: true
  validates :issue_master_id, presence: true
  validates :issue_priority, presence: true

  has_attached_file :document1, :path => "attachments/attach_resume/:basename.:extension"

  has_attached_file :document2, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :document2, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
end
