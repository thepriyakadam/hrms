class EmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  has_many :employee_salary_templates
end
