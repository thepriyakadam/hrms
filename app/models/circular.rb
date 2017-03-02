class Circular < ActiveRecord::Base
  

  has_attached_file :document, :path => "attachments/attach_resume/:basename.:extension"

  validates_attachment_presence :document
  validates_attachment_size :document, less_than: 15.megabytes
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'

  # has_attached_file :avatar,
  # :path => "attachments/attach_circulars/:basename.:extension"

  # validates_attachment_presence :avatar
  # validates_attachment_size :avatar, less_than: 9.megabytes
  # validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates :date,presence:true
  validates :subject,presence:true
end