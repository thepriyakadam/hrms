module JoiningDetailsHelper
	def all_employee_grade
		EmployeeGrade.all.collect {|x| [x.name,x.id]}
	end

	def all_employee_designation
		EmployeeDesignation.all.collect {|x| [x.name,x.id]}
	end

	def all_employee_category
		EmployeeCategory.all.collect {|x| [x.name,x.id]}
	end

	def all_cost_center
		CostCenter.all.collect {|x| [x.name,x.id]}
	end

	def all_payment_mode
		PaymentMode.all.collect {|x| [x.name,x.id]}
	end

	def all_department
		Department.all.collect {|x| [x.name,x.id]}
	end
end
