module LeaveCOffsHelper
	def all_leav_c_off
    LeaveCOff.where(taken_date: nil,current_status: "FinalApproved").collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
  end
end
