module EmployeeCodeMastersHelper
	def all_employee_code_master
      EmployeeCodeMaster.where(is_active: true).collect { |x| [x.name, x.id] }
    end
end
