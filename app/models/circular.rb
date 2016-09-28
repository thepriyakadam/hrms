class Circular < ActiveRecord::Base
   
  has_attached_file :avatar,
  :path => "attachments/attach_circulars/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, less_than: 2.megabytes
  validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates :date,presence:true
  validates :subject,presence:true
end