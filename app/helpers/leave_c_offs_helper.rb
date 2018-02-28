module LeaveCOffsHelper
	def all_leav_c_off
    LeaveCOff.where(taken_date: nil,current_status: "FinalApproved",employee_id: current_user.employee_id).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end

  def leav_c_off_half
    LeaveCOff.where(c_off_type: "Half Day",taken_date: nil,current_status: "FinalApproved",employee_id: current_user.employee_id).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end

  def leav_c_off_full
    LeaveCOff.where(c_off_type: "Full Day",taken_date: nil,current_status: "FinalApproved",employee_id: current_user.employee_id).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end

  def admin_all_leav_c_off
    LeaveCOff.where(taken_date: nil,current_status: "FinalApproved",employee_id: @employee.id).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end

  def leav_c_off_half_admin(emp)
    LeaveCOff.where(c_off_type: "Half Day",taken_date: nil,current_status: "FinalApproved",employee_id: params[:employee_id]).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end

  def leav_c_off_full_admin(emp)
    LeaveCOff.where(c_off_type: "Full Day",taken_date: nil,current_status: "FinalApproved",employee_id: params[:employee_id]).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end
end
