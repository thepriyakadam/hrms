module EmployeeCategoriesHelper
	def all_employee_category
		EmployeeCategory.where(is_active: true).collect {|ec| [ec.name, ec.id]}
	end
	# def all_employee_category
 #    EmployeeCategory.where(is_active: "true").collect { |x| [x.name, x.id] }
 #  end
end
