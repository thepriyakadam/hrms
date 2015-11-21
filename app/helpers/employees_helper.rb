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
end
