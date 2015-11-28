class Department < ActiveRecord::Base
  protokoll :department_code, :pattern => "DEPT###"
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_one :member, as: :account

  validates :name, :presence => true
  validates :department_type_id, :presence => true
end
