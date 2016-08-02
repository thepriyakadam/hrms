class CaptureResume < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :degree
  belongs_to :vacancy_master
  belongs_to :employee_designation

  validates :name_of_candidate, presence: true
  validates :post_applied, presence: true
  validates :mode_of_application, presence: true
  validates :date_of_application, presence: true
  has_attached_file :avatar, path: ':rails_root/attachments/:id/:style/:basename.:extension'
  
  has_attached_file :passport_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :passport_photo, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  # validates_attachment_presence :avatar
  validates_attachment_size :avatar, less_than: 2.megabytes
  validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
