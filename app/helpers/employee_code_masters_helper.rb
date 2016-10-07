module EmployeeCodeMastersHelper
	def all_employee_code_master
      EmployeeCodeMaster.all.collect { |x| [x.name, x.id] }
    end
end
