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
    punch = PunchTimeDetail.where("LogDateTime > ? ", Time.now - 5.days)
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

  def self.calculate_attendance
    @halfday_allow = LatemarkMaster.last.halfday_allow
    emp = EmployeeAttendance.where("in_time > ? ", Time.now - 5.days)
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
      if @halfday_allow == true
        emp_in_time = Time.at(in_t).utc.strftime("%H:%M")
        if emp_in_time > "09:30"
          emp_att.update_all(working_hrs: working_hrs, present: "HD", comment: "Late-Coming")
          puts "---------Late-Coming updated  #{Time.now}---------"
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

