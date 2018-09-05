module ExpenceOpestionsHelper
	def all_expence_opestion
		ExpenceOpestion.all.collect { |x| [x.employee_grade.try(:name).to_s+' - '+x.try(:name).to_s, x.id] }
	end

	def grade_wise_expence_opestions
		emp = Employee.find(current_user.employee.id)
		employee_grade = emp.try(:joining_detail).try(:employee_grade).try(:id)
		ExpenceOpestion.where(employee_grade_id: employee_grade).collect { |x| [x.employee_grade.try(:name).to_s+'-'+x.try(:name).to_s, x.id] }
	end
end
