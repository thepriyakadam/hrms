class SelectedResume < ActiveRecord::Base
  belongs_to :degree
  belongs_to :vacancy_master
  has_many :particular_vacancy_requests

  validates :name, presence: true
  validates :degree_id, presence: true
  

  has_attached_file :avatar,
  :path => "attachments/attach_resume/:basename.:extension"

  has_attached_file :passport_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :passport_photo, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  # validates_attachment_presence :avatar
  validates_attachment_size :avatar, less_than: 2.megabytes
  validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
