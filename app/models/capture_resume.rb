class CaptureResume < ActiveRecord::Base
   
  validates :name_of_candidate, :presence => true
  validates :post_applied, :presence => true
  validates :mode_of_application, :presence => true
  validates :date_of_application, :presence => true
  has_attached_file :avatar,:path => ":rails_root/attachments/:id/:style/:basename.:extension"
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment :avatar, :content_type => { :content_type => %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  # validates :country, :presence => true
  # validates :state, :presence => true
  # validates :district, :presence => true

end
