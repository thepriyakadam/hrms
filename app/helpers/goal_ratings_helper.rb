module GoalRatingsHelper
	def all_goal_perspective
		GoalPerspective.all.collect{|g| [g.name,g.id]}
	end
	def all_attribute_type
		AttributeMaster.all.collect{|a| [a.name,a.id]}
	end
	def all_company
    Company.all.collect { |x| [x.name, x.id] }
  end
  def all_company_location
    CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
  end
  def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
end
