class SalaryTemplate < ActiveRecord::Base
	has_many :salary_component_templates
	validates :code, :presence => true,  uniqueness: { case_sensitive: false }
end
