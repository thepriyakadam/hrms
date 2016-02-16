class SalaryComponentTemplate < ActiveRecord::Base
  belongs_to :salary_component
  belongs_to :salary_template
  belongs_to :parent_salary_component, class_name: "SalaryComponent"
  validates :salary_component_id, uniqueness: { scope: [:salary_template_id] }
end
