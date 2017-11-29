class EmployeeAttendance < ActiveRecord::Base
  # has_fullcalendar
  belongs_to :employee
  belongs_to :employee_leav_request
  belongs_to :machine_attendance
  belongs_to :company_time_master
  belongs_to :holiday
  validates :day, uniqueness: { scope: [:employee_id] }
  # validates_format_of :in_time, :with => /(([0][0-9]|[1][0-2])|[0-9]):([0-5][0-9])( *)((AM|PM)|(A|P))/,
  #   :message => "Only Proper HH:MM time allowed"
  #attr_accessible :employee_id, :day, :present, :in_time, :out_time
  # extend ActiveModel::Naming
  # include ActiveModel::Conversion
  # include ActiveModel::Validations
  # attr_accessor :file

  def self.is_present(day,emp)
    flag = 0
      flag = EmployeeAttendance.exists?(day: day,employee_id: emp)
    flag
  end
  

  def self.collect_rolewise(current_user)
    if current_user.class == Group
      Employee.all.pluck(:id)
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all.pluck(:id)
      elsif current_user.role.name == 'Admin'
        Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
      elsif current_user.role.name == 'HOD'
        Employee.where(department_id: current_user.department_id).pluck(:id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id).pluck(:id)
      end
    end
  end
  
  def self.filter_by_date_and_costcenter(date, costcenter, current_user)
    month = date.strftime("%B")
    year = date.strftime("%Y")
    @workingday = Workingday.where(month_name: month,year: year).pluck(:employee_id)
    @attendances = EmployeeAttendance.where(day: date).pluck(:employee_id)
    @joining_details = JoiningDetail.where(cost_center_id: costcenter).pluck(:employee_id)
    @roles = collect_rolewise(current_user)
    finals = (@joining_details - @attendances - @workingday) & @roles
    Employee.where(id: finals)
  end
  
   def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee_attendance|
        csv << employee_attendance.attributes.values_at(*column_names)
      end
    end
  end

  def self.to_txt
    # attributes = %w{employee_id day in out shift_master_id is_proceed present user_id}
    attributes = %w{employee_code employee_name day in_time out_time working_hrs present}

    CSV.generate(:col_sep => "#") do |csv|
      csv << attributes
      all.each do |employee|
        csv << attributes.map{ |attr| employee.send(attr) }
      end
    end
  end

    def self.import(file)
     spreadsheet = open_spreadsheet(file)
      (2..spreadsheet.last_row).each do |i|
        employee_code = spreadsheet.cell(i,'A').to_i
        employee_name = spreadsheet.cell(i,'B')
        day = spreadsheet.cell(i,'C')
        in_time = spreadsheet.cell(i,'D') #@employee.id
        out_time = spreadsheet.cell(i,'E')
        working_hrs = spreadsheet.cell(i,'F')
        present = spreadsheet.cell(i,'G')

        employee = Employee.find_by(manual_employee_code: employee_code)
        if employee.nil?
        else
        employee_atten = EmployeeAttendance.where(employee_id: employee.id,day: day.to_date).take
        if employee_atten.nil?
          employee_attendance = EmployeeAttendance.create(employee_name: employee_name,day: day.to_date,in_time: in_time,out_time: out_time,working_hrs: working_hrs,present: present) 
        else
          if employee_atten.employee_leav_request_id.nil? || employee_atten.on_duty_request_id.nil? 
          employee_atten.update(employee_name: employee_name,day: day.to_date,in_time: in_time,out_time: out_time,working_hrs: working_hrs,present: present)
          else
          end
        end
      end
        @employee_attendance = EmployeeAttendance.last
        employee = Employee.find_by_manual_employee_code(employee_code)
        @employee_attendance.update(employee_id: employee.id)
        EmployeeAttendance.where(employee_id: nil).destroy_all
      end

        # spreadsheet = open_spreadsheet(file)
        # header = spreadsheet.row(1)
        # (2..spreadsheet.last_row).each do |i|
        #   row = Hash[[header, spreadsheet.row(i)].transpose]
        #   employee_attendance = find_by_id(row['id']) || new
        #   employee_attendance.attributes = row.to_hash.slice(*row.to_hash.keys)
        #   employee_attendance.save!

        #   @employee_attendance = EmployeeAttendance.last
        #   employee = Employee.find_by_manual_employee_code(@employee_attendance.employee_code)
        #   @employee_attendance.update(employee_id: employee.id)
        # EmployeeAttendance.where(employee_id: nil).destroy_all
        # end 
      #    @employee_attendance = EmployeeAttendance.last
      # @employees = Employee.where(status: "Active")
      #   @employees.each do |e|
      #     employee_atten = EmployeeAttendance.where(employee_id: e.id,day: @employee_attendance.day.to_date).take
      #     if employee_atten.nil?
      #       EmployeeAttendance.create(employee_id: e.id,day: @employee_attendance.day.to_date.to_date,present: "A")
      #     # else
      #     #   employee_atten.update(present: " ")
      #     end
      #   end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def self.filter_by_date_costcenter_and_department(date, costcenter, department, current_user)
    @attendances = EmployeeAttendance.where(day: date).pluck(:employee_id)
    @joining_details = JoiningDetail.where(cost_center_id: costcenter).pluck(:employee_id)
    @departments = Employee.where(department_id: department).pluck(:id)
    @roles = collect_rolewise(current_user)
    final = (@departments) & @roles
    finals = (@joining_details) & @roles
    #Employee.where(id: finals,id: final)
  end

  def self.filter_by_date_and_costcenter_and_present(day, costcenter_id,present)
    @attendances = EmployeeAttendance.where(day: day.to_date).pluck(:employee_id)
    @joining_details = JoiningDetail.where(cost_center_id: costcenter_id).pluck(:employee_id)
    @attendance_status = EmployeeAttendance.where(present: present).pluck(:employee_id)
    EmployeeAttendance.where(employee_id: @joining_details - @attendances - @attendance_status)
  end

end
