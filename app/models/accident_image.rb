class AccidentImage < ActiveRecord::Base
  belongs_to :accident_record

  
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png',
  :path => "attachments/attach_accident_record/:basename.:extension"
  validates_attachment_content_type :avatar,  :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
end
