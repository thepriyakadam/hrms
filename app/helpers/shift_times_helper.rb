module ShiftTimesHelper
	def all_shift_time
		joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).collect { |r| [r.shift+' - '+r.name, r.id] }
  end
  
end
