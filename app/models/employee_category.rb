class EmployeeCategory < ActiveRecord::Base
  has_many :joining_details
  has_many :employee_promotions
  validates :name, presence: true
  validates :code, presence: true
end
