module ShiftSchedulesHelper
	def all_shift_schedule
		joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
		shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).pluck(:id)
    ShiftSchedule.where(shift_time_id: shift_time).collect { |r| [r.shift_time.shift+' - '+r.shift_time.name, r.id] }
  end
end
