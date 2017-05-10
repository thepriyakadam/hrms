class VisitorDetail < ActiveRecord::Base
  belongs_to :meet_to, class_name: 'Employee'
  belongs_to :authorized_by, class_name: 'Employee'
  belongs_to :employee
  validates :name, presence: true
  validates :age, presence: true
  validates :contact_no, presence: true
  validates :id_proof, presence: true
  validates :employee_id, presence: true
 

  
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
end
