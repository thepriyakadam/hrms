class Department < ActiveRecord::Base
  protokoll :department_code, pattern: 'DEPT###'
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_many :member
  has_many :joining_details
  has_many :vacancy_masters
  has_many :shift_rotations
  has_many :vacancy_request_histories
  has_many :employee_promotions
  has_many :accident_records
  
  validates :manual_department_code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :department_type_id, presence: true
end
