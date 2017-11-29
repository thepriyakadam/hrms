class InductionMaster < ActiveRecord::Base
	has_many :induction_activities
	has_many :induction_details
	validates :code, presence: true, uniqueness: { case_sensitive: false }
	validates :description, presence: true 
	has_attached_file :avatar,
   :path => "attachments/attach_induction/:basename.:extension"
	
    validates_attachment_size :avatar, less_than: 2.megabytes
	validates_attachment :avatar, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end