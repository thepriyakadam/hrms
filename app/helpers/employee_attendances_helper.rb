module EmployeeAttendancesHelper
	def calculate_attendance(date, exist, e)
		start_date = date.beginning_of_month 
    end_date = date.end_of_month 

    start_date.step(end_date).each do |d| 
      flag = 0 

      attendance_records = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and employee_id = ?", date.strftime('%m/%Y'), e.employee_id) 
      attendance_records.each do |a| 
        if d == a.day 
          flag = 1 
          exist[a.day] = a.present 
        end 
      end

      leave_records = ParticularLeaveRecord.where("strftime('%m/%Y', leave_date) = ? and employee_id = ?", date.strftime('%m/%Y'), e.id) 
      leave_records.each do |l| 
        if d == l.leave_date and flag == 0 
          flag = 1 
          exist[l.leave_date] = "L" 
        end 
      end 

      holidays = Holiday.where("strftime('%m/%Y', holiday_date) = ?", date.strftime('%m/%Y')) 
      holidays.each do |h| 
        if d == h.holiday_date and flag == 0 
          flag = 1 
          exist[h.holiday_date] = "H" 
        end 
      end 

      if flag == 0 
        exist[d] = "" 
      end 
    end
    Hash[exist.sort]
	end
end
