class DueTemplate < ActiveRecord::Base
   has_many :due_details
   has_many :due_employee_details
   has_attached_file :document,
  :path => "attachments/attach_due_templates/:basename.:extension"

  # validates_attachment_presence :avatar
  validates_attachment_size :document, less_than: 2.megabytes
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
