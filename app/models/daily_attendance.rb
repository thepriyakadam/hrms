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
    matrix = CheckInOut.where("CHECKTIME > ? ", Time.now - 3.days)
    matrix.each do |mat|
      edate_time = mat.CHECKTIME
      edate = edate_time.to_date
      etime = mat.CHECKTIME
      user_id = mat.USERID
      month_nm = etime.strftime("%B")
      emp =  Employee.find_by_manual_employee_code(user_id)
      empa =  Employee.find_by_manual_employee_code(user_id)
      if empa.nil?
        puts "Employee Id not found"
      else
        emp_id = empa.id
        emp_first = emp.first_name
        emp_last = emp.last_name
        space = " "
        emp_name = emp_first + space + emp_last
        daily_att = DailyAttendance.where(employee_code: user_id, time: etime)
        if daily_att.empty?
          daily_att_updated = DailyAttendance.create(employee_code: user_id, date: edate_time.to_date, time: etime)
          puts "---------attendace created 0 #{Time.now}---------"
        else 
        end
        emp_att = EmployeeAttendance.where(employee_id: emp_id, day: edate)
        if emp_att.present?
          time = EmployeeAttendance.where(employee_id: emp_id, in_time: etime)
          if time.present?
          else
            emp_att_time = emp_att.update_all(out_time: etime)
            puts "-----------attendance updated #{Time.now}-----------"
          end
        else
          emp_att_time = EmployeeAttendance.create(employee_id: emp_id, employee_code: user_id, day: edate, present: "P", in_time: etime, month_name: month_nm, employee_code: user_id, employee_name: emp_name)
          puts "---------attendace created 1 #{Time.now}---------"
        end
      end
    end
  end

<<<<<<< HEAD

  def self.fetch_data
    matrix = MxAtdeventTrn.all
    matrix_data = matrix.where("Edatetime > ? ", Time.now - 7.days)
    matrix_data.each do |mat|
      edate_time = mat.Edatetime
      edate = edate_time.to_date
      etime = mat.Edatetime
      user_id = mat.UserID
      month_nm = etime.strftime("%B")
      emp =  Employee.find_by_manual_employee_code(user_id)
      empa =  Employee.find_by_manual_employee_code(user_id)
      emp_id = empa.id
      emp_first = emp.first_name
      emp_last = emp.last_name
      space = " "
      emp_name = emp_first + space + emp_last
      daily_att = DailyAttendance.where(employee_code: user_id, time: etime)
      if daily_att.empty?
        daily_att_updated = DailyAttendance.create(employee_code: user_id, date: edate_time.to_date, time: etime)
      else 
      end
      emp_att = EmployeeAttendance.where(employee_id: emp_id, day: edate)
      if emp_att.present?
        time = EmployeeAttendance.where(employee_id: emp_id, in_time: etime)
        if time.present?
        else
          emp_att_time = emp_att.update_all(out_time: etime)
        end
      else
        emp_att_time = EmployeeAttendance.create(employee_id: emp_id, employee_code: user_id, day: edate, present: "P", in_time: etime, month_name: month_nm, employee_code: user_id, employee_name: emp_name)
      end
    end
  end

  def self.calculate_attendance
=======
 def self.calculate_attendance
>>>>>>> 26ec75cc64ebd9a13aa3b956803cc45286b24ab2
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
            emp_att.update_all(working_hrs: working_hrs)
            puts "---------attendace calculate 1 #{Time.now}---------"
          else
            emp_att.update_all(present: "HD")
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
  end
end
