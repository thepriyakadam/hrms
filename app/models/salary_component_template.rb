class SalaryComponentTemplate < ActiveRecord::Base
  belongs_to :salary_component
  belongs_to :salary_template
  belongs_to :parent_salary_component, class_name: 'SalaryComponent'

  has_many :children, class_name: 'SalaryComponentTemplate',
                      foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'SalaryComponentTemplate'

  validates :salary_component_id, uniqueness: { scope: [:salary_template_id] }
end
