class EmployeeAnnualSalary < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_component
end
