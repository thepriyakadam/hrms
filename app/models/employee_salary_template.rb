class EmployeeSalaryTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  belongs_to :salary_component
  belongs_to :parent_salary_component, class_name: "SalaryComponent"
end
