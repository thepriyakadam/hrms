module EmployeeCategoriesHelper
	def all_employee_category
		EmployeeCategory.all.collect {|ec| [ec.name, ec.id]}
	end
	# def all_employee_category
 #    EmployeeCategory.where(status: "Active").collect { |x| [x.name, x.id] }
 #  end
end
