class EmployeeResignation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leaving_reason
end
