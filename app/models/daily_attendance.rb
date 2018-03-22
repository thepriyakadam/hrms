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

  # def self.fetch_data
  #   matrix = MxAtdeventTrn.all
  #   matrix_data = matrix.where("Edatetime > ? ", Time.now - 2.days)
  #   matrix_data.each do |mat|
  #     edate_time = mat.Edatetime
  #     edate = edate_time.to_date
  #     etime = mat.Edatetime
  #     user_id = mat.UserID
  #     month_nm = etime.strftime("%B")
  #     emp =  Employee.find_by_manual_employee_code(user_id)
  #     empa =  Employee.find_by_manual_employee_code(user_id)
  #     if empa.nil?
  #       puts "Employee Id not found"
  #     else
  #       emp_id = empa.id
  #       emp_first = emp.first_name
  #       emp_last = emp.last_name
  #       space = " "
  #       emp_name = emp_first + space + emp_last
  #       daily_att = DailyAttendance.where(employee_code: user_id, time: etime)
  #       if daily_att.empty?
  #         daily_att_updated = DailyAttendance.create(employee_code: user_id, date: edate_time.to_date, time: etime)
  #       else 
  #       end
  #       emp_att = EmployeeAttendance.where(employee_id: emp_id, day: edate)
  #       if emp_att.present?
  #         time = EmployeeAttendance.where(employee_id: emp_id, in_time: etime)
  #         if time.present?
  #         else
  #           emp_att_time = emp_att.update_all(out_time: etime)
  #         end
  #       else
  #         emp_att_time = EmployeeAttendance.create(employee_id: emp_id, employee_code: user_id, day: edate, present: "P", in_time: etime, month_name: month_nm, employee_code: user_id, employee_name: emp_name)
  #       end
  #     end
  #   end
  # end

  def self.calculate_attendance
    emp = EmployeeAttendance.where("in_time > ? ", Time.now - 7.days)
    emp.each do |emp|
      id = emp.employee_id
      in_t = emp.in_time
      out_t = emp.out_time
      emp_att = EmployeeAttendance.where(employee_id: id, in_time: in_t)
      if emp_att.last.working_hrs.present?
        in_time = in_t.to_time
        out_time = out_t.to_time
        total_hrms = out_time - in_time 
        working_hrs = Time.at(total_hrms).utc.strftime("%H:%M")
        if working_hrs > "07:00" 
          emp_att.update_all(working_hrs: working_hrs,present: "P")
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
            emp_att.update_all(working_hrs: working_hrs,present: "P")
          else
            emp_att.update_all(working_hrs: working_hrs,present: "HD")
          end
        else
          emp_att.update_all(present: "HD")
        end
      end
    end
  end

  def self.fetch_data
    punch = MxAtdeventTrn.where("Edatetime > ? ", Time.now - 7.days)
    punch.each do |mat|
      punch_date_time = mat.Edatetime
      punch_date = punch_date_time.to_date
      punch_time = punch_date_time.to_time
      punch_month = punch_date.strftime("%B")
      user_id = mat.UserID
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
        @employee_out_time = daily_att_day.last.time.to_time

        @employee_att_present = EmployeeAttendance.where(employee_id: employee_id, day: punch_date)
        if @employee_att_present.present?
          if @employee_att_present.first.in_time.present?
            emp_att_out_time = @employee_att_present.update_all(in_time: @employee_in_time, out_time: @employee_out_time)
            puts "-----------EmployeeAttendance Out Time 1 updated #{Time.now}-----------"
          else
            emp_att_out_time = @employee_att_present.update_all(in_time: @employee_in_time, out_time: @employee_out_time)
            puts "-----------EmployeeAttendance Out Time 1 updated #{Time.now}-----------"
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
  #   calculate_att = EmployeeAttendance.where("in_time > ? ", Time.now - 21.days)
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
end