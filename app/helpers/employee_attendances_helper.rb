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
        exist[d] = ""
      end
    end
    Hash[exist.sort]
	end

  # def total_attendance(date, exist, e)
  #   start_date = date.beginning_of_month
  #   end_date = date.end_of_month
  #   start_date.step(end_date).each do |d|
  #     attendance_record = EmployeeAttendance.where(day: d, employee_id: e.employee_id,present: "P").take
  #     unless attendance_record.nil?
  #       exist[d] = attendance_record.count
  #     end
  #   end
  #   Hash[exist.sort]
  # end


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
    exist.select {|k,v| v == "P" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f + (exist.select {|k,v| v == "PG" }.count).to_f
  end

  def holiday_in_month_count(exist)
    exist.select {|k,v| v == "H" }.count
  end

  def week_off_day_count(exist)
    exist.select {|k,v| v == "W" }.count
  end

  def absent_day_count(exist)
    exist.select {|k,v| v == "A" || v == "" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f
  end

  # def payable_day_count(exist)
  #   exist.select {|k,v| v == "P" }.count
  # end

  def total_leave_count(exist)
    leave = LeavCategory.all.collect {|c| c.code }
    exist.select {|k,v| leave.member?(v)}.count
  end

  # def pay_leave_count(exist)
  #   leave = LeavCategory.where(is_payble: true).collect {|c| c.code }
  #   exist.select {|k,v| leave.member?(v)}.count
  # end

  # def non_pay_leave_count(exist)
  #   leave = LeavCategory.where(is_payble: false).collect {|c| c.code }
  #   exist.select {|k,v| leave.member?(v)}.count
  # end

  # def pay_leave_count(date, employee)
  #   leave = LeavCategory.where(is_payble: true).collect {|c| c.code }
  #   EmployeeAttendance.where("strftime('%m/%Y',day) = ?", date.strftime('%m/%Y')).where(employee_id: employee.employee_id,present:leave).sum(:count).to_f
  # end

  # def non_pay_leave_count(date, employee)
  #   leave = LeavCategory.where(is_payble: false).collect {|c| c.code }
  #   EmployeeAttendance.where("strftime('%m/%Y',day) = ?", date.strftime('%m/%Y')).where(employee_id: employee.employee_id,present:leave).sum(:count).to_f
  # end

  def create_leave(date,employee)
    arr = []
    attendances = EmployeeAttendance.where("strftime('%m/%Y',day) = ?", date.strftime('%m/%Y')).where(employee_id: employee.employee_id).where.not(employee_leav_request_id: nil)
    half_leave = 0
    full_leave = 0
    pay_leave = 0
    non_pay_leave = 0
    attendances.each do |a|
      if a.employee_leav_request.leave_type == "Full Day"
        full_leave = full_leave + 1
        if a.employee_leav_request.leav_category.is_payble
          pay_leave = pay_leave + 1
        else
          non_pay_leave = non_pay_leave + 1
        end
      else
        half_leave = half_leave + 0.5
        if a.employee_leav_request.leav_category.is_payble
          pay_leave = pay_leave + 0.5
        else
          non_pay_leave = non_pay_leave + 0.5
        end
      end
      
    end
    arr << half_leave
    arr << full_leave
    arr << pay_leave
    arr << non_pay_leave
    arr
  end

  # def half_pay_leave_count(exist)
  #   exist.select {|k,v| v == "P/2" }.count/2
  # end

  # def full_pay_leave_count(exist)
  #   exist.select {|k,v| v == "L" }.count
  # end

  # def half_lwp_leave_count(exist)
  #   exist.select {|k,v| v == "LWP/2" }.count/2
  # end

  # def full_lwp_leave_count(exist)
  #   exist.select {|k,v| v == "LWP" }.count
  # end

  # def half_leave_date_count(exist)
  #   exist.select {|k,v| v == "1/2" }.keys
  # end

  # def half_leave_date_cross_check_count(employee_id, date)
  #   ParticularLeaveRecord.where("strftime('%m/%Y', leave_date) = ? and employee_id = ? and is_full = ?", date.strftime('%m/%Y'), employee_id, false).pluck(:leave_date)
  # end

  # def employee_existence(date, e)
  #   flag = false
  #   @requests = EmployeeLeavRequest.where("strftime('%m/%Y', start_date) = ? and strftime('%m/%Y', end_date) = ? and employee_id = ?", date.strftime('%m/%Y'), date.strftime('%m/%Y'), e.id)
  #   @requests.each do |r|
  #     if ((r.start_date.to_date..r.end_date.to_date) === date.to_date)
  #       flag = true
  #     end
  #   end
  #   flag
  # end
end