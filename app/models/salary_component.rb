class SalaryComponent < ActiveRecord::Base
	scope :deducted, -> { where(is_deducted: true) }
	scope :addected, -> { where(is_deducted: false) }
	validates :name, :code, presence: true, uniqueness: { case_sensitive: false }
	has_many :employee_annual_salaries

	has_many :salary_component_templates
	has_many :parent_salary_component_templates, class_name: "SalaryComponentTemplate",
                          foreign_key: "parent_salary_component_id"
    has_many :employee_salary_templates
     
	has_many :children, class_name: "SalaryComponent",
                          foreign_key: "parent_id"
    belongs_to :parent, class_name: "SalaryComponent"
end

