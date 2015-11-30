module DepartmentsHelper
	def all_department_type
		DepartmentType.all.collect {|d| [d.name,d.id]}
	end

	def all_company_location
		CompanyLocation.all.collect {|cl| [cl.company.name+'-'+cl.name,cl.id]}
	end
end
