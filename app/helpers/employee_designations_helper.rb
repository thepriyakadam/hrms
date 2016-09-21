module EmployeeDesignationsHelper
	def all_employee_designation
    EmployeeDesignation.all.collect { |x| [x.name, x.id] }
  end
  def all_employee_designation
    EmployeeDesignation.all.collect { |x| [x.name, x.id] }
  end
end
