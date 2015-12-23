class EmployeeShift < ActiveRecord::Base
  belongs_to :company_shift
  has_many :employees
end
