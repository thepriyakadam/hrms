module DepartmentsHelper
	def all_department_type
		DepartmentType.all.collect {|d| [d.name,d.id]}
	end
end
