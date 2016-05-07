module EmployeeCategoriesHelper
	def all_employee_category
		EmployeeCategory.all.collect {|ec| [ec.name, ec,id]}
	end
end
