module SalaryComponentsHelper
	def all_salary_component
		SalaryComponent.all.collect {|s| [s.name, s.id]}
	end
end
