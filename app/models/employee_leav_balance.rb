class EmployeeLeavBalance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  belongs_to :company_leav
  has_many :employee_leav_requests
  has_many :leave_transfers
  #validates :employee_id, uniqueness: { scope: [:leav_category_id] }
  validates :no_of_leave, presence: true

  def self.count_leave(month)
    case month
    when '1'
      3
    when '2'
      2
    when '3'
      1
    when '4'
      12
    when '5'
      11
    when '6'
      10
    when '7'
      9
    when '8'
      8
    when '9'
      7
    when '10'
      6
    when '11'
      5
    when '12'
      4
    end
  end

  def self.filter_records(current_user)
    @employee_leav_balances =  if current_user.class == Group
    EmployeeLeavBalance.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        EmployeeLeavBalance.where(employee_id: @employees)  
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        EmployeeLeavBalance.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      end
    end
  end
  
  def is_present(e)
    LeaveMaster.exists?(leav_category_id: e.leav_category_id)
  end


  def self.import(file)
     spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        employee_id = @employee.id
        @leav_category = LeavCategory.find_by_name(spreadsheet.cell(i,'C'))
        if @leav_category == nil
          leav_category_name = spreadsheet.cell(i,'C')
           @leav_category_entry = LeavCategory.create(name: leav_category_name,code: leav_category_name)
           leav_category_id = @leav_category_entry.id
        else
        leav_category_id = @leav_category.id
        end
        no_of_leave = spreadsheet.cell(i,'D')
        total_leave = spreadsheet.cell(i,'E')
        from_date = spreadsheet.cell(i,'F')
        to_date = spreadsheet.cell(i,'G')
        is_active = spreadsheet.cell(i,'H')
        if is_active == "Yes" || is_active == "yes"
           is_active = true
        else
          is_active = false
        end
        leave_count = spreadsheet.cell(i,'I')
        collapse_value = spreadsheet.cell(i,'J')
        carry_forward = spreadsheet.cell(i,'K')
        working_day = spreadsheet.cell(i,'L')

        @employee_prsent = EmployeeLeavBalance.find_by(employee_id: employee_id)
      if @employee_prsent.nil?
        @employee_leav_balance = EmployeeLeavBalance.create(employee_id: employee_id,leav_category_id: leav_category_id,no_of_leave: no_of_leave,total_leave: total_leave,
          from_date: from_date,to_date: to_date,is_active: is_active,carry_forward: carry_forward,leave_count: leave_count,collapse_value: collapse_value,working_day: working_day)
      else
        @employee_prsent.update(employee_id: employee_id,leav_category_id: leav_category_id,no_of_leave: no_of_leave,total_leave: total_leave,
        from_date: from_date,to_date: to_date,is_active: is_active,carry_forward: carry_forward,leave_count: leave_count,collapse_value: collapse_value,working_day: working_day)
      end
    end  
   end
 end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end


  def emp_available(e)
    from_date = e.from_date
    to_date = e.to_date

    from_month = from_date.strftime('%B')
    to_month = to_date.strftime('%B')
    flag = 0
    for i in from_month..to_month
      flag = Workingday.exists?(employee_id: e.employee_id,month_name: i)
    end
    flag
  end

end
