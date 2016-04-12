class SalaryTemplate < ActiveRecord::Base
  has_many :salary_component_templates
  has_many :employee_salary_templates
  has_many :salaryslips
  has_many :employee_templates
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
