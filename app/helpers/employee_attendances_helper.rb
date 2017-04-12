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
    exist.select {|k,v| v == "P" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f + (exist.select {|k,v| v == "P/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/P" }.count)/2.to_f
  end

  def absent_day_count(exist)
    exist.select {|k,v| v == "A" || v == "" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f + (exist.select {|k,v| v == "A/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/A" }.count)/2.to_f
  end

  def holiday_in_month_count(exist)
    exist.select {|k,v| v == "H" }.count
  end

  def week_off_day_count(exist)
    exist.select {|k,v| v == "W" }.count
  end

  

  def present_count(exist)
    exist.select {|k,v| v == "P" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f + (exist.select {|k,v| v == "P/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/CL" }.count)/2.to_f + (exist.select {|k,v| v == "CL/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/EL" }.count)/2.to_f + (exist.select {|k,v| v == "EL/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/AL" }.count)/2.to_f + (exist.select {|k,v| v == "AL/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/LWP" }.count)/2.to_f + (exist.select {|k,v| v == "LWP/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/ESIC" }.count)/2.to_f + (exist.select {|k,v| v == "ESIC/P" }.count)/2.to_f + (exist.select {|k,v| v == "P/C.Off" }.count)/2.to_f + (exist.select {|k,v| v == "C.Off/P" }.count)/2.to_f
  end

  def absent_count(exist)
    exist.select {|k,v| v == "A" || v == "" }.count + (exist.select {|k,v| v == "P/2" }.count)/2.to_f + (exist.select {|k,v| v == "A/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/CL" }.count)/2.to_f + (exist.select {|k,v| v == "CL/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/EL" }.count)/2.to_f + (exist.select {|k,v| v == "EL/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/AL" }.count)/2.to_f + (exist.select {|k,v| v == "AL/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/LWP" }.count)/2.to_f + (exist.select {|k,v| v == "LWP/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/ESIC" }.count)/2.to_f + (exist.select {|k,v| v == "ESIC/A" }.count)/2.to_f + (exist.select {|k,v| v == "A/C.Off" }.count)/2.to_f + (exist.select {|k,v| v == "C.Off/A" }.count)/2.to_f
  end

  def cl_leave_count(exist)
    exist.select {|k,v| v == "CL" }.count + (exist.select {|k,v| v == "P/CL" }.count)/2.to_f + (exist.select {|k,v| v == "CL/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/CL" }.count)/2.to_f + (exist.select {|k,v| v == "CL/A" }.count)/2.to_f
  end

  def el_leave_count(exist)
    exist.select {|k,v| v == "EL" }.count + (exist.select {|k,v| v == "P/EL" }.count)/2.to_f + (exist.select {|k,v| v == "EL/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/EL" }.count)/2.to_f + (exist.select {|k,v| v == "EL/A" }.count)/2.to_f
  end

  def esic_leave_count(exist)
    exist.select {|k,v| v == "ESIC" }.count + (exist.select {|k,v| v == "P/ESIC" }.count)/2.to_f + (exist.select {|k,v| v == "ESIC/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/ESIC" }.count)/2.to_f + (exist.select {|k,v| v == "ESIC/A" }.count)/2.to_f
  end

  def lwp_leave_count(exist)
    exist.select {|k,v| v == "LWP" }.count + (exist.select {|k,v| v == "P/LWP" }.count)/2.to_f + (exist.select {|k,v| v == "LWP/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/LWP" }.count)/2.to_f + (exist.select {|k,v| v == "LWP/A" }.count)/2.to_f
  end

  def advance_leave_count(exist)
    exist.select {|k,v| v == "AL" }.count + (exist.select {|k,v| v == "P/AL" }.count)/2.to_f + (exist.select {|k,v| v == "AL/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/AL" }.count)/2.to_f + (exist.select {|k,v| v == "AL/A" }.count)/2.to_f
  end

  def coff_leave_count(exist)
    exist.select {|k,v| v == "C.Off" }.count + (exist.select {|k,v| v == "P/C.Off" }.count)/2.to_f + (exist.select {|k,v| v == "C.Off/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/C.Off" }.count)/2.to_f + (exist.select {|k,v| v == "C.Off/A" }.count)/2.to_f
  end

  def od_day_count(exist)
    exist.select {|k,v| v == "OD" }.count + (exist.select {|k,v| v == "P/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/P" }.count)/2.to_f + (exist.select {|k,v| v == "A/OD" }.count)/2.to_f + (exist.select {|k,v| v == "OD/A" }.count)/2.to_f
  end

  def gatepass_count(exist)
    exist.select {|k,v| v == "PG" }.count
  end

  def create_leave(date,employee)
    arr = []
    #attendances = EmployeeAttendance.where("strftime('%m/%Y',day) = ?", date.strftime('%m/%Y')).where(employee_id: employee.employee_id).where.not(employee_leav_request_id: nil) || (EmployeeAttendance.where(present: "PG"))    
      
    attendances = EmployeeAttendance.where("DATE_FORMAT('%m/%Y',day) = ? AND employee_id = ?",date.strftime('%m/%Y'),employee.employee_id)
    pay_leave = 0
    non_pay_leave = 0
    present_day = 0
    gate_pass = 0
    gate_pas = 0
    gatepass = 0
    gatepas = 0
    absent_day = 0
    attendances.each do |a|
      if a.employee_leav_request_id != nil
        if a.count == 1.0
          if a.employee_leav_request.leav_category.is_payble
            pay_leave = pay_leave + 1
          else
            non_pay_leave = non_pay_leave + 1
          end
        else
          if a.employee_leav_request.leav_category.is_payble
            if a.employee_leav_request.present_status == false
              pay_leave = pay_leave + 0.5
              absent_day = absent_day + 0.5
            else
              pay_leave = pay_leave + 0.5
              present_day = present_day + 0.5
            end
          else
            if a.employee_leav_request.present_status == false
              non_pay_leave = non_pay_leave + 0.5
              absent_day = absent_day + 0.5
            else
               non_pay_leave = non_pay_leave + 0.5
              present_day = present_day + 0.5
            end
          end
        end 
      else #nil
      end#
    end#DO
    arr << pay_leave
    arr << non_pay_leave
    arr << present_day
    arr << absent_day
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