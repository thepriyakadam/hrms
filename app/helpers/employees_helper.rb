module EmployeesHelper
	def all_employee_type
		EmployeeType.all.collect {|x| [x.name,x.id]}
	end

	def all_blood_group
		BloodGroup.all.collect {|x| [x.name,x.id]}
	end

	def all_nationality
		Nationality.all.collect {|x| [x.name,x.id]}
	end

	def all_employee_grade
		EmployeeGrade.all.collect {|x| [x.name,x.id]}
	end

	def all_role_list
		Role.all.collect {|r| [r.name,r.id]}
	end

	def all_employee_list
		Employee.all.collect {|e| [e.first_name,e.id]}
	end
	def check_if_true(item)
      if(item == 'true' or item == true or item == 1 or item == '1')
        return true
    	else
      		return false
   	 	end
   	 end
end
