class LeaveCOff < ActiveRecord::Base
  belongs_to :employee
  validates_uniqueness_of :c_off_date, :scope => :employee_id,  uniqueness: { status: false }
  validates :c_off_expire_day, presence: true
  has_many :status_c_offs

  def self.filter_records(current_user)
  @leave_c_offs =  if current_user.class == Group
    LeaveCOff.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        LeaveCOff.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        LeaveCOff.where(employee_id: @employees)  
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        LeaveCOff.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        LeaveCOff.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        LeaveCOff.where(employee_id: current_user.employee_id)
      end
    end
  end
                                                                                                                                    
  def is_present?
    LeaveCOff.exists?(employee_id: self.employee_id,c_off_date: self.c_off_date)
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

        manual_employee_code = spreadsheet.cell(i,'B').to_i
        if manual_employee_code == 0
           manual_employee_code = spreadsheet.cell(i,'B')
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
        else
           manual_employee_code = spreadsheet.cell(i,'B').to_i
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        end

        @employee_id = @employee.id
        c_off_date = spreadsheet.cell(i,'c')
        c_off_type = spreadsheet.cell(i,'D')
        comment = spreadsheet.cell(i,'E')
        if c_off_type.nil? || c_off_date.nil?
        else
          if @employee == nil
          else
            @leave_c_off = LeaveCOff.new
            if @leave_c_off.is_present?
            else
              leav_category = LeavCategory.find_by(code: 'C.Off')
              
              if leav_category.nil?
              else
                is_exist = EmployeeLeavBalance.exists?(employee_id: @employee_id, leav_category_id: leav_category.id)
                
                joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
                if joining_detail.c_off_expire == true
                  @leave_c_off.c_off_expire_day = joining_detail.c_off_applicable_day.to_f
                  @leave_c_off.expiry_date = c_off_date.to_date + @leave_c_off.c_off_expire_day.to_f
                  @leave_c_off.expiry_status = true
                else
                  @leave_c_off.c_off_expire_day = 0
                  @leave_c_off.expiry_date = nil
                  @leave_c_off.expiry_status = joining_detail.c_off_expire
                end
                  
                if is_exist
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @employee_id, leav_category_id: leav_category.id).take
                  
                  if c_off_type == "Full Day" || c_off_type == "" || c_off_type == nil
                    @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
                    @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
                    @leave_c_off.leave_count = 1
                    @leave_c_off.c_off_type = "Full Day"
                    @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
                    @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
                  else
                    @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 0.5
                    @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 0.5
                    @leave_c_off.leave_count = 0.5
                    @leave_c_off.c_off_type = "Half Day"
                    @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
                    @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
                  end#c_off_type
                    @leave_c_off.current_status = "FinalApproved"
                    @leave_c_off.comment = comment
                    @leave_c_off.c_off_date = c_off_date
                    @leave_c_off.employee_id = @employee.id
                    @leave_c_off.is_expire = false

                  joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
                  if joining_detail.c_off_expire == true
                    @leave_c_off.c_off_expire_day = joining_detail.c_off_applicable_day.to_f
                    @leave_c_off.expiry_date = c_off_date.to_date + @leave_c_off.c_off_expire_day.to_f
                    @leave_c_off.expiry_status = true
                  else
                    @leave_c_off.c_off_expire_day = 0
                    @leave_c_off.expiry_date = nil
                    @leave_c_off.expiry_status = joining_detail.c_off_expire
                  end

                else#is_exist
                  @employee_leave_balance = EmployeeLeavBalance.new do |b|
                    b.employee_id = @employee_id
                    b.leav_category_id = leav_category.id
                    b.from_date = c_off_date
                    b.is_active = true
                    if c_off_type == "Full Day"
                      b.no_of_leave = 1
                      b.total_leave = 1
                      @leave_c_off.leave_count = 1
                      @leave_c_off.c_off_type = "Full Day"
                    @leave_c_off.c_off_date = c_off_date
                    @leave_c_off.employee_id = @employee.id
                      puts @leave_c_off.leave_count
                    else
                      b.no_of_leave = 0.5
                      b.total_leave = 0.5
                      @leave_c_off.leave_count = 0.5
                      @leave_c_off.c_off_type = "Half Day"
                    @leave_c_off.c_off_date = c_off_date
                    @leave_c_off.employee_id = @employee.id
                      puts @leave_c_off.leave_count
                    end
                    @leave_c_off.current_status = "FinalApproved"
                    @leave_c_off.is_expire = false
                    @leave_c_off.comment = comment
                  end #do
                   
                  joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
                  if joining_detail.c_off_expire == true
                    @leave_c_off.c_off_expire_day = joining_detail.c_off_applicable_day.to_f
                    @leave_c_off.expiry_date = c_off_date.to_date + @leave_c_off.c_off_expire_day.to_f
                    @leave_c_off.expiry_status = true
                  else
                    @leave_c_off.c_off_expire_day = 0
                    @leave_c_off.expiry_date = nil
                    @leave_c_off.expiry_status = joining_detail.c_off_expire
                  end
                end#is_exist
                #ActiveRecord::Base.transaction do
                  @leave_c_off.save
                  @employee_leave_balance.save
                  StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @leave_c_off.employee_id,status: "FinalApproved")
                #end
              end#leav_category.nil?

            end#@leave_c_off.is_present?
          end#@employee == nil
        end#c_off_type.nil?
    end#do
  end                                           
 
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def is_self_present(emp,date)
    flag = 0
    flag = LeaveCOff.exists?(employee_id: emp,c_off_date: date.to_date,status: true)
    flag 
  end
  
  def is_week_off_present(emp)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "W")
    flag 
  end

  def is_holiday_present(emp)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "H")
    flag 
  end

  def is_week_off_present_for_coff(emp,date)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "WOP",day: date.to_date)
    flag 
    end

  def is_holiday_present_for_coff(emp,date)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "HP",day: date.to_date)
    flag 
  end

  def is_od_present_for_coff(emp,date)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "OD",day: date.to_date)
    flag 
  end

   def is_od_present_for_coff_half(emp,date)
    flag = 0
    flag = EmployeeAttendance.exists?(employee_id: emp,present: "HD",day: date.to_date)
    flag 
   end
end
