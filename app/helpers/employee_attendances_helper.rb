module EmployeeAttendancesHelper
	def calculate_attendance(date, exist, e)
		start_date = date.beginning_of_month
    end_date = date.end_of_month
    start_date.step(end_date).each do |d|
      attendance_record = EmployeeAttendance.where(day: d, employee_id: e.employee_id).take
      unless attendance_record.nil?
        exist[d] = attendance_record.present
      end

      unless exist.key?(d)
        holiday = Holiday.find_by(holiday_date: d)
        unless holiday.nil?
          exist[d] = "H"
        end
      end

      unless exist.key?(d)
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

  def holiday_in_month_count(exist)
    exist.select {|k,v| v == "H" }.count
  end

  def week_off_day_count(exist)
    exist.select {|k,v| v == "W" }.count
  end

  def absent_day_count(exist)
    exist.select {|k,v| v == "A" }.count
  end

  def payable_day_count(exist)
    exist.select {|k,v| v == "P" }.count
  end

  def total_leave_count(exist)
    exist.select {|k,v| v == "L" or v == "LWP" }.count
  end

  def half_pay_leave_count(exist)
    exist.select {|k,v| v == "P/2" }.count/2
  end

  def full_pay_leave_count(exist)
    exist.select {|k,v| v == "L" }.count
  end

  def half_lwp_leave_count(exist)
    exist.select {|k,v| v == "LWP/2" }.count/2
  end

  def full_lwp_leave_count(exist)
    exist.select {|k,v| v == "LWP" }.count
  end

  def half_leave_date_count(exist)
    exist.select {|k,v| v == "1/2" }.keys
  end

  def half_leave_date_cross_check_count(employee_id, date)
    ParticularLeaveRecord.where("strftime('%m/%Y', leave_date) = ? and employee_id = ? and is_full = ?", date.strftime('%m/%Y'), employee_id, false).pluck(:leave_date)
  end

  def employee_existence(date, e)
    flag = false
    @requests = EmployeeLeavRequest.where("strftime('%m/%Y', start_date) = ? and strftime('%m/%Y', end_date) = ? and employee_id = ?", date.strftime('%m/%Y'), date.strftime('%m/%Y'), e.id)
    @requests.each do |r|
      if ((r.start_date.to_date..r.end_date.to_date) === date.to_date)
        flag = true
      end
    end
    flag
  end
end