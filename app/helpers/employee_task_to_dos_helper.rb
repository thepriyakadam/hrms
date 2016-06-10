module EmployeeTaskToDosHelper
	def all_employee_list
    Employee.all.collect { |e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s + ' ' + e.try(:last_name).to_s, e.id] }
  end
end
