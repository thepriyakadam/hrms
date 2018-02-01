 def self.fetch_data
  punch = PunchTimeDetail.where("LogDateTime > ? ", Time.now - 33.days)
  punch.each do |mat|
    punch_date_time = mat.LogDateTime
    punch_date = punch_date_time.to_date
    punch_time = punch_date_time.to_time
    punch_month = punch_date.strftime("%B")
    user_id = mat.EmpCode
    @employee = Employee.find_by_manual_employee_code(user_id)
    if @employee.nil?
      puts "Employee Id Not Found"
    else
      employee_id = @employee.id
      employee_first_name = @employee.first_name
      employee_last_name = @employee.last_name
      space = " "
      if employee_last_name.present?
        employee_name = employee_first_name + space + employee_last_name
      else
        employee_name = employee_first_name
      end
      daily_att_employee_present = DailyAttendance.where(employee_code: user_id, time: punch_time)
      if daily_att_employee_present.empty?
        daily_att_employee_create = DailyAttendance.create(employee_code: user_id, date: punch_date.to_date, time: punch_time)
        puts "-----DailyAttendance Created 0 #{Time.now}---------"
      end
      daily_att_day = DailyAttendance.where(employee_code: user_id, date: punch_date).order("time ASC")
      @employee_in_time = daily_att_day.first.time.to_time

      employee_att_present = EmployeeAttendance.where(employee_id: employee_id, day: punch_date)
      if employee_att_present.present?
        employee_in_time = EmployeeAttendance.where(employee_id: employee_id, in_time: punch_time)
        if employee_in_time.present?
        else
          if employee_in_time.last.out_time.present?
            emp_att_out_time = employee_in_time.update_all(out_time: punch_time)
            puts "-----------EmployeeAttendance Out Time 1 updated #{Time.now}-----------"
          else
            if employee_in_time.first.in_time == punch_time
              puts "-----------EmployeeAttendance All ready updated #{Time.now}-----------"
            else
              emp_att_out_time = employee_in_time.update_all(out_time: punch_time)
              puts "-----------EmployeeAttendance Out Time 2 updated #{Time.now}-----------"
              emp_att_in_time = employee_in_time.update_all(in_time: @employee_in_time)
              puts "-----------EmployeeAttendance IN Time updated #{Time.now}-----------"
            end
          end
        end
      else
        emmployee_att_first = EmployeeAttendance.create(employee_id: employee_id, day: punch_date, present: "P", in_time: punch_time, month_name: punch_month, employee_code: user_id, employee_name: employee_name)
        puts "-------EmployeeAttendance created 1 In Time created #{Time.now}---------"
      end
    end
  end

  def self.calculate_attendance
    calculate_att = EmployeeAttendance.where("in_time > ? ", Time.now - 33.days)
    calculate_att.each do |cal_att|
      @employee_id = cal_att.employee_id
      @employee_in_time = cal_att.in_time
      @employee_out_time = cal_att.out_time
      @att_day = cal_att.day
      employee_in_time_att = EmployeeAttendance.where(employee_id: @employee_id, in_time: @employee_in_time)
      if employee_in_time_att.last.working_hrs.present?
        emp_in_time = @employee_in_time.to_time
        emp_out_time = @employee_out_time.to_time
        total_hrs = employee_out_time - employee_in_time
        working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
        if working_hrs > "07:00"
          employee_in_time_att.update_all(working_hrs: working_hrs, present: "P")
          puts "---------attendace calculate 1 #{Time.now}---------"
        else
          employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD")
          puts "---------attendace calculate 5 #{Time.now}---------"
        end
      else
        if employee_in_time_att.last.out_time.present?
          emp_in_time = @employee_in_time.to_time
          emp_out_time = @employee_out_time.to_time
          total_hrs = employee_out_time - employee_in_time
          working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
          if working_hrs > "07:00"
            employee_in_time_att.update_all(working_hrs: working_hrs, present: "P")
            puts "---------attendace calculate 1 #{Time.now}---------"
          else
            employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD")
            puts "---------attendace calculate 5 #{Time.now}---------"
          end
        else
          employee_in_time_att.update_all(present: "HD")
          puts "---------attendace calculate updated 3 #{Time.now}---------"
        end
      end
    end
    @employees = Employee.where(status: "Active")
    @employees.each do |e|
    employee_atten = EmployeeAttendance.where(employee_id: e.id, day: @att_day).take
      if employee_atten.nil?
        EmployeeAttendance.create(employee_id: e.id, day: @att_day, present: "A")
      end
    end
  end


  def self.calculate_attendance
    emp = EmployeeAttendance.where("in_time > ? ", Time.now - 33.days)
    emp.each do |emp|
      id = emp.employee_id
      in_t = emp.in_time
      out_t = emp.out_time
      day = emp.day
      @days = emp.day
      emp_att = EmployeeAttendance.where(employee_id: id, in_time: in_t)
      if emp_att.last.working_hrs.present?
          in_time = in_t.to_time
          out_time = out_t.to_time
          total_hrms = out_time - in_time 
          working_hrs = Time.at(total_hrms).utc.strftime("%H:%M")
          if working_hrs > "07:00"
            emp_att.update_all(working_hrs: working_hrs,present: "P")
            puts "---------attendace calculate 1 #{Time.now}---------"
          else
            emp_att.update_all(working_hrs: working_hrs,present: "HD")
          end
      else
        if emp_att.last.out_time.present?
          in_time = in_t.to_time
          out_time = out_t.to_time
          total_hrms = out_time - in_time 
          working_hrs = Time.at(total_hrms).utc.strftime("%H:%M")
          if working_hrs > "07:00" 
            emp_att.update_all(working_hrs: working_hrs, present: "P")
            puts "---------attendace calculate updated 1 #{Time.now}---------"
          else
            emp_att.update_all(working_hrs: working_hrs, present: "HD")
            puts "---------attendace calculate updated 2 #{Time.now}---------"
          end
        else
          emp_att.update_all(present: "HD")
          puts "---------attendace calculate updated 3 #{Time.now}---------"
        end
      end
    end
    @employees = Employee.where(status: "Active")
    @employees.each do |e|
    employee_atten = EmployeeAttendance.where(employee_id: e.id, day: @days).take
      if employee_atten.nil?
        EmployeeAttendance.create(employee_id: e.id, day: @days, present: "A")
      end
    end
  end
end