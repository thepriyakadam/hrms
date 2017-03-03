class InductionActivity < ActiveRecord::Base
  belongs_to :employee
  belongs_to :induction_master
  has_many :induction_details

  validates :activity_date, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true

  has_attached_file :avatar, path: ':rails_root/attachments_induction_activity/induction_activity/:style/:basename.:extension' 
  # validates_attachment_presence :avatar
  validates_attachment_size :avatar, less_than: 2.megabytes
  validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
