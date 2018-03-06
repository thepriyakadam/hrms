class DailyAttendance < ActiveRecord::Base

  # validates :employee_code, uniqueness: { scope: [:date, :time, :controller] }

  #validates_uniqueness_of :employee_code, {scope: [:time]}
  #validates_uniqueness_of :employee_code, :scope => :time
  #validates_uniqueness_of :employee_code, scope: [:date, :time]

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
   (2..spreadsheet.last_row).each do |i|

        sr_no = spreadsheet.cell(i,'A')
        date = spreadsheet.cell(i,'B')
        time = spreadsheet.cell(i,'C')
        #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'D').to_i)
        employee_code = spreadsheet.cell(i,'D') #@employee.id
        card_no = spreadsheet.cell(i,'E') 
        employee_name = spreadsheet.cell(i,'F')
        controller = spreadsheet.cell(i,'G')
        reader_name = spreadsheet.cell(i,'H')
        access_status = spreadsheet.cell(i,'I')
        @daily_attendace = DailyAttendance.create(sr_no: sr_no,date: date,time: time,employee_code: employee_code,card_no: card_no,employee_name: employee_name,controller: controller,reader_name: reader_name,access_status: access_status) 
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.fetch_data
    punch = CheckInOut.where("CHECKTIME > ? ", Time.now - 3.days)
    punch.each do |mat|
      punch_date_time = mat.CHECKTIME
      punch_date = punch_date_time.to_date
      punch_time = punch_date_time.to_time
      punch_month = punch_date.strftime("%B")
      user_id = mat.USERID
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
            emp_att_out_time = employee_att_present.update_all(out_time: punch_time)
            puts "-----------EmployeeAttendance Out Time updated #{Time.now}-----------"
            emp_att_in_time = employee_att_present.update_all(in_time: @employee_in_time )
            puts "-----------EmployeeAttendance IN Time updated #{Time.now}-----------"
          end
        else
          emmployee_att_first = EmployeeAttendance.create(employee_id: employee_id, day: punch_date, present: "P", in_time: punch_time, month_name: punch_month, employee_code: user_id, employee_name: employee_name)
          puts "-------EmployeeAttendance created 1 In Time created #{Time.now}---------"
        end
      end
    end
  end

  # def self.calculate_attendance
  #   fullday_working_hrs = LatemarkMaster.last.fullday_working_hrs.to_i
  #   @company_fullday_working_hrs = Time.at(fullday_working_hrs).utc.strftime("%H:%M")
  #   halfday_working_hrs = LatemarkMaster.last.halfday_working_hrs.to_i
  #   @company_halfday_working_hrs = Time.at(halfday_working_hrs).utc.strftime("%H:%M")
  #   @late_limit = LatemarkMaster.last.late_limit.utc.strftime("%H:%M")
  #   @halfday_allow = LatemarkMaster.last.halfday_allow
  #   @on_duty_request_id = EmployeeAttendance.last.on_duty_request_id
  #   @employee_leav_request_id = EmployeeAttendance.last.employee_leav_request_id
  #   @holiday_id = EmployeeAttendance.last.holiday_id
  #   @employee_week_off_id = EmployeeAttendance.last.employee_week_off_id
  #   calculate_att = EmployeeAttendance.where("in_time > ? ", Time.now - 4.days)
  #   calculate_att.each do |cal_att|
  #     @employee_id = cal_att.employee_id
  #     @employee_in_time = cal_att.in_time
  #     @employee_out_time = cal_att.out_time
  #     @att_day = cal_att.day
  #     employee_in_time_att = EmployeeAttendance.where(employee_id: @employee_id, in_time: @employee_in_time)
  #     if employee_in_time_att.last.working_hrs.present?
  #       emp_in_time = @employee_in_time.to_time
  #       emp_out_time = @employee_out_time.to_time
  #       total_hrs = emp_out_time - emp_in_time
  #       working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
  #       if working_hrs > @company_fullday_working_hrs
  #         if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present?
  #           employee_in_time_att.update_all(working_hrs: working_hrs)
  #           puts "---------attendace calculate 1 #{Time.now}---------"
  #         else
  #           employee_in_time_att.update_all(working_hrs: working_hrs, present: "P")
  #           puts "---------attendace calculate 1 #{Time.now}---------"
  #         end
  #       else
  #         if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present?
  #           employee_in_time_att.update_all(working_hrs: working_hrs)
  #           puts "---------attendace calculate 1 #{Time.now}---------"
  #         else
  #           employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD")
  #           puts "---------attendace calculate 5 #{Time.now}---------"
  #         end
  #       end
  #     else
  #       if employee_in_time_att.last.out_time.present?
  #         emp_in_time = @employee_in_time.to_time
  #         emp_out_time = @employee_out_time.to_time
  #         total_hrs = emp_out_time - emp_in_time
  #         working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
  #         if working_hrs > @company_fullday_working_hrs
  #           if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present? 
  #             employee_in_time_att.update_all(working_hrs: working_hrs)
  #             puts "---------attendace calculate 11 #{Time.now}---------"
  #           else
  #             employee_in_time_att.update_all(working_hrs: working_hrs, present: "P")
  #             puts "---------attendace calculate 1 #{Time.now}---------"
  #           end
  #         else
  #           if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present?
  #             employee_in_time_att.update_all(working_hrs: working_hrs)
  #             puts "---------attendace calculate 12 #{Time.now}---------"
  #           else
  #             employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD")
  #             puts "---------attendace calculate 5 #{Time.now}---------"
  #           end
  #         end
  #       else
  #         if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present?
  #           employee_in_time_att.update_all(working_hrs: working_hrs)
  #           puts "---------attendace calculate 13 #{Time.now}---------"
  #         else
  #           employee_in_time_att.update_all(present: "HD")
  #           puts "---------attendace calculate updated 3 #{Time.now}---------"
  #         end
  #       end
  #     end
  #     if @halfday_allow == true
  #       emp_in_time = Time.at(@employee_in_time).utc.strftime("%H:%M")
  #       if emp_in_time > @late_limit
  #         if @on_duty_request_id.present? || @employee_leav_request_id.present? || @holiday_id.present? || @employee_week_off_id.present?
  #           employee_in_time_att.update_all(working_hrs: working_hrs, comment: "Late-Coming")
  #           puts "---------attendace calculate 14 #{Time.now}---------"
  #         else
  #           employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD", comment: "Late-Coming")
  #           puts "---------Late-Coming updated  #{Time.now}---------"
  #         end
  #       end
  #     end
  #     @employees = Employee.where(status: "Active")
  #     @employees.each do |e|
  #     employee_atten = EmployeeAttendance.where(employee_id: e.id, day: @att_day).take
  #       if employee_atten.nil?
  #         EmployeeAttendance.create(employee_id: e.id, day: @att_day, present: "A")
  #       end
  #     end

  #   end
  # end

  
  def self.calculate_attendance
    fullday_working_hrs = LatemarkMaster.last.fullday_working_hrs.to_i
    @company_fullday_working_hrs = Time.at(fullday_working_hrs).utc.strftime("%H:%M")
    halfday_working_hrs = LatemarkMaster.last.halfday_working_hrs.to_i
    @company_halfday_working_hrs = Time.at(halfday_working_hrs).utc.strftime("%H:%M")
    company_time_hrs = LatemarkMaster.last.company_time.to_i
    @company_time = Time.at(company_time_hrs).utc.strftime("%H:%M")
    company_late_limit_hrs = LatemarkMaster.last.late_limit.to_i
    @company_late_time= Time.at(company_late_limit_hrs).utc.strftime("%H:%M")

    @late_limit = LatemarkMaster.last.late_limit.utc.strftime("%H:%M")
    @halfday_allow = LatemarkMaster.last.halfday_allow

    calculate_att = EmployeeAttendance.where("day > ? ", Time.now - 6.days)
    calculate_att.each do |cal_att|
      @employee_id = cal_att.employee_id
      @employee_in_time = cal_att.in_time
      @employee_out_time = cal_att.out_time
      @att_day = cal_att.day
      employee_in_time_att = EmployeeAttendance.where(employee_id: @employee_id, in_time: @employee_in_time)
      
      if employee_in_time_att.last.working_hrs.present? # Start Working Hrs Present
        emp_in_time = @employee_in_time.to_time
        emp_out_time = @employee_out_time.to_time
        total_hrs = emp_out_time - emp_in_time
        working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")

        if working_hrs > @company_fullday_working_hrs # Start full Day Attendance
          if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present?  
            employee_in_time_att.update_all(working_hrs: working_hrs)
          elsif cal_att.holiday_id.present?  
             employee_in_time_att.update_all(working_hrs: working_hrs, present: "HP", comment: "Holiday Present")
          elsif cal_att.employee_week_off_id.present?
             employee_in_time_att.update_all(working_hrs: working_hrs, present: "WOP", comment: "Weekoff Present")
          else
            employee_in_time_att.update_all(working_hrs: working_hrs, present: "P", comment: "Full Day Working")
          end

        else # Else Full Day Attendance

          if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present?  
            employee_in_time_att.update_all(working_hrs: working_hrs)
          elsif cal_att.holiday_id.present?  
             employee_in_time_att.update_all(working_hrs: working_hrs, present: "HHDP", comment: "Holiday Half Day Present")
          elsif cal_att.employee_week_off_id.present?
             employee_in_time_att.update_all(working_hrs: working_hrs, present: "WOHDP", comment: "Weekoff Half Day Present")
          else
            employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD", comment: "Half Day Working")
          end
        end # End Full Day Attendance

      else # Else Start Working Hrs Present

        if employee_in_time_att.last.out_time.present? # Satrt Working Hrs First Time Calaculation 
          emp_in_time = @employee_in_time.to_time
          emp_out_time = @employee_out_time.to_time
          total_hrs = emp_out_time - emp_in_time
          working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")

          if working_hrs > @company_fullday_working_hrs
            if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present?  
              employee_in_time_att.update_all(working_hrs: working_hrs)
            elsif cal_att.holiday_id.present?  
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "HP", comment: "Holiday Present")
            elsif cal_att.employee_week_off_id.present?
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "WOP", comment: "Weekoff Present")
            else
              employee_in_time_att.update_all(working_hrs: working_hrs, present: "P", comment: "Full Day Working")
            end
          else
            if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present?  
              employee_in_time_att.update_all(working_hrs: working_hrs)
            elsif cal_att.holiday_id.present?  
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "HHDP", comment: "Holiday Half Day Present")
            elsif cal_att.employee_week_off_id.present?
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "WOHDP", comment: "Weekoff Half Day Present")
            else
              employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD", comment: "Half Day Working")
            end
          end

        else # Else Working Hrs First Time Calaculation 
          if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present?  
              employee_in_time_att.update_all(working_hrs: working_hrs)
            elsif cal_att.holiday_id.present?  
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "HHDP", comment: "Holiday Out Time Not Available")
            elsif cal_att.employee_week_off_id.present?
               employee_in_time_att.update_all(working_hrs: working_hrs, present: "WOHDP", comment: "Weekoff Out Time Not Available")
            else
            employee_in_time_att.update_all(present: "HD", comment: "Out Time Not Available")
          end
        end #Satrt Working Hrs First Time Calaculation 

      end # End Working Hrs Present

      if @halfday_allow == true #
        emp_in_time = Time.at(@employee_in_time).utc.strftime("%H:%M")
        if (@company_time..@company_late_time).include?(@employee_in_time) #Start Within  Time Limit
          if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present? || cal_att.holiday_id.present? || cal_att.employee_week_off_id.present?
            employee_in_time_att.update_all(working_hrs: working_hrs)
           else
            employee_in_time_att.update_all(working_hrs: working_hrs,  comment: "Late-Coming")
          end
        elsif emp_in_time > @late_limit #Else IF  Not in Time Limit
           if cal_att.on_duty_request_id.present? || cal_att.employee_leav_request_id.present? || cal_att.holiday_id.present? || cal_att.employee_week_off_id.present?
            employee_in_time_att.update_all(working_hrs: working_hrs)
           else
            employee_in_time_att.update_all(working_hrs: working_hrs, present: "HD", comment: "Late-Coming Half Day")
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
    end# EmployeeAttendance Do End
  end 

  
end