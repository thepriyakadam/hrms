module SalaryComponentsHelper
	def all_salary_component
		SalaryComponent.all.collect {|s| [s.name, s.id]}
	end
	
	def parent_salary_component
		SalaryComponent.all.collect {|s| [s.name, s.id]}	
	end

  def parent_salary_component1(template)
    SalaryComponentTemplate.where(salary_template_id: template.id).collect {|s| [s.salary_component.name, s.salary_component_id]}  
  end
end
