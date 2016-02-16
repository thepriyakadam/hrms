class EmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  has_many :employee_salary_templates
  validates :employee_id, uniqueness: { scope: [:is_active] }
  validates :employee_id, uniqueness: { scope: [:salary_template_id] }
end
