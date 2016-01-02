class SalaryTemplate < ActiveRecord::Base
	has_many :salary_component_templates
	has_many :employee_salaty_templates
	validates :code, :presence => true,  uniqueness: { case_sensitive: false }
end
