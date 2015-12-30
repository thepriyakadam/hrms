class EmployeeShift < ActiveRecord::Base
  belongs_to :company_shift
  belongs_to :employee
end
