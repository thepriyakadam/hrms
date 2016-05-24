class EmployeePromotion < ActiveRecord::Base
  belongs_to :employee
  belongs_to :department
  belongs_to :employee_designation
  belongs_to :employee_grade
  belongs_to :employee_category
end
