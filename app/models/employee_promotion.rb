class EmployeePromotion < ActiveRecord::Base
  belongs_to :employee
  belongs_to :department
  belongs_to :employee_designation
  belongs_to :employee_grade
  belongs_to :employee_category
  # validates :employee_id, presence:true
  # validates :department_id,presence:true
  # validates :employee_designation_id,presence:true
  # validates :employee_grade_id,presence:true
  # validates :employee_category_id,presence:true

end
