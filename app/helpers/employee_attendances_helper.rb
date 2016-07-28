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

  def count_day(day,employee)
    e = Employee.find(employee)
    if e.joining_detail.nil?
    else
      if e.joining_detail.employee_category.nil?
      else
        if e.joining_detail.employee_category.name == 'Worker'
          day_in_month = 26
        else
          day_in_month = day
        end
      end
    end
    day_in_month
  end

  def present_day_count(exist)
    exist.select {|k,v| v == "P" }.count
  end

  def total_leave_count(exist)
    exist.select {|k,v| v == "L" }.count
  end

  def holiday_in_month_count(exist)
    exist.select {|k,v| v == "H" }.count
  end

  def week_of_day_count(exist)
    exist.select {|k,v| v == "W" }.count
  end

  def absent_day_count(exist)
    exist.select {|k,v| v == "A" }.count
  end

  def payable_day_count(exist)
    exist.select {|k,v| v == "P" }.count
  end
end
