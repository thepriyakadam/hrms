module ShiftTimesHelper
	def all_shift_time
	    #joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
	    #ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
	    if current_user.role.name == 'GroupAdmin'
	       ShiftTime.where(status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
	    elsif current_user.role.name == 'Admin'
	       ShiftTime.where(status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
	    elsif current_user.role.name == 'HOD'
	       #employees = Employee.where(manager_id: current_user.employee_id).pluck("id")
	       current_login = Employee.find(current_user.employee_id)
	       emps_sub = current_login.subordinates
	       emps_ind = current_login.indirect_subordinates
	       @emp_sub = emps_sub.where(status: "Active")
	       @emp_ind = emps_ind.where(status: "Active")
	       @employee = @emp_sub + @emp_ind
	       joining_detail = JoiningDetail.where(employee_id: @employee).pluck("cost_center_id")
	       ShiftTime.where(cost_center_id: joining_detail,status: true).collect { |r| [r.shift+' -- '+r.name, r.id] }
	    elsif current_user.role.name == 'Supervisor'
	       joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
	       ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
	    else current_user.role.name == 'Employee'
	        ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
	    end
	end
end
