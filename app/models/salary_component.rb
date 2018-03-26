class SalaryComponent < ActiveRecord::Base
  scope :deducted, -> { where(is_deducted: true) }
  scope :addected, -> { where(is_deducted: false) }
  validates :name, :code, presence: true, uniqueness: { case_sensitive: false }
  #validates :is_deducted, presence: true
  has_many :employee_salary_templates
  has_many :salaryslip_components
  has_many :salary_component_templates
  has_many :employee_arrear_items
  has_many :salary_comp_mappings
  has_many :parent_salary_component_templates, class_name: 'SalaryComponentTemplate',
                                               foreign_key: 'parent_salary_component_id'
  has_many :children, class_name: 'SalaryComponent',
                      foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'SalaryComponent'
end
