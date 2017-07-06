class SelfService < ActiveRecord::Base

	
 has_attached_file :document,:path => "attachments/attach_investment_declarations/:basename.:extension"

  
 validates_attachment_size :document, less_than: 2.megabytes
 validates_attachment :document, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
