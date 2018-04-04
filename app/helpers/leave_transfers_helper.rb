module LeaveTransfersHelper
	def all_active_employee_with_code1
  		Employee.where(status: "Active").where.not(id: current_user.employee_id).collect {|e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  	end
end
