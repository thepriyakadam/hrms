class CandidateForm < ActiveRecord::Base
  belongs_to :vacancy_request
  belongs_to :qualification
  belongs_to :selected_by

  has_attached_file :document1, :path => "attachments/attach_resume/:basename.:extension"

  has_attached_file :document2, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :document2, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
end
