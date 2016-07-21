class EmployeeDocument < ActiveRecord::Base
  belongs_to :employee
  validates :name,presence:true
  validates :document,presence:true

  has_attached_file :document,
  :path => "attachments/attach_employee_document/:basename.:extension"

 
  validates_attachment_size :document, less_than: 2.megabytes
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/txt application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
