class AccidentRecord < ActiveRecord::Base
  belongs_to :employee
  belongs_to :root_cause_master
  belongs_to :department

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
