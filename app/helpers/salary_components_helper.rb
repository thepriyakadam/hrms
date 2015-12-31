module SalaryComponentsHelper
	def all_salary_component
		SalaryComponent.all.collect {|s| [s.name, s.id]}
	end
	
	def parent_salary_component
		SalaryComponentTemplate.all.collect {|s| [s.salary_component.try(:name), s.salary_component_id]}	
	end
end
