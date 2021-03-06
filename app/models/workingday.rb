class Workingday < ActiveRecord::Base
  # enum month: [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  enum month: { January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12 }
  validates :employee_id, uniqueness: { scope: [:month_name, :year] }
  belongs_to :employee
  has_many :salaryslips

  #validates :workingday, uniqueness: { scope: [:month_name, :year] }
  #validates :month_name, uniqueness: { scope: [:year] }
  # validates_uniqueness_of :acronym, :allow_blank => true, :scope => [:group_id], :case_sensitive => false
  # validates_uniqueness_of :acronym, :allow_nil => true, :scope => [:group_id], :case_sensitive => false
  # validates :month_name, :presence => true
  # validates :year, :presence => true
  # validates :day_in_month, :presence => true
  # validates :present_day, :presence => true
  # validates :total_leave, :presence => true
  # validates :holiday_in_month, :presence => true
  # validates :week_off_day, :presence => true
  # validates :absent_day, :presence => true
  # validates :payable_day, :presence => true

 def self.import_day_file(file)
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

      #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
      if @employee.nil?
      else
      employee_id = @employee.id
      month_name = spreadsheet.cell(i,'C')
      year = spreadsheet.cell(i,'D').to_i
      date = Date.new(year.to_i,Workingday.months[month_name])

      day_in_month = spreadsheet.cell(i,'E')
      present_day = spreadsheet.cell(i,'F')
      week_off_day = spreadsheet.cell(i,'G')
      od_day = spreadsheet.cell(i,'H')
      pay_leave = spreadsheet.cell(i,'I')
      holiday_in_month = spreadsheet.cell(i,'J')
      payable_day = spreadsheet.cell(i,'K')
      ot_hours = spreadsheet.cell(i,'L')
      @workingday_data = Workingday.where(employee_id: employee_id,month_name: month_name,year: year).take 

        if @workingday_data == nil
          @workingday = Workingday.create(employee_id: employee_id,ot_hours: ot_hours, month_name: month_name,year: year, payable_day: payable_day,date: date.to_date, day_in_month: day_in_month, present_day: present_day, week_off_day: week_off_day, od_day: od_day, pay_leave: pay_leave, holiday_in_month: holiday_in_month)
        else
          if @workingday_data.paid == nil
            @workingday_data.update(employee_id: employee_id,ot_hours: ot_hours, month_name: month_name,year: year, payable_day: payable_day,date: date.to_date, day_in_month: day_in_month, present_day: present_day, week_off_day: week_off_day, od_day: od_day, pay_leave: pay_leave, holiday_in_month: holiday_in_month)
          else
          end#@workingday_data.paid == nil
        end#@workingday_data == nil
      end#@employee.nil?
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

  def self.find_by_role(workingdays, current_user)
    if current_user.class == Group
      Employee.where(id: workingdays)
    else
      if current_user.role.name == "GroupAdmin"
        Employee.all
      elsif current_user.role.name == 'Admin'
        Employee.where(id: workingdays, company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        Employee.where(id: workingdays, company_location_id: current_user.company_location_id)
      end
    end
  end

  def self.collect_attendance(date, employees)
    workingdays_data_structure = []
    employees.each do |ee|
      workingday = Workingday.new
      e = Employee.find(ee)
      lc = LeavCategory.where(is_payble: false).pluck(:id)
      workingday.day_in_month = workingday.create_day_in_month(e,date)
      workingday.total_leave = ParticularLeaveRecord.where(leave_date: date.beginning_of_month..date.end_of_month, employee_id: e.id).count
      workingday.holiday_in_month = Holiday.where(holiday_date: date.beginning_of_month..date.end_of_month).count
      workingday.week_off_day = WeekoffMaster.day(date)
      workingday.absent_day = workingday.total_leave.to_f
      workingday.present_day = workingday.day_in_month.to_i - workingday.absent_day
      workingday.employee_id = e.id
      workingday.lwp_leave = ParticularLeaveRecord.where(leave_date: date.beginning_of_month..date.end_of_month, employee_id: e.id, leav_category_id: lc).count
      workingday.payable_day = workingday.day_in_month.to_i - workingday.lwp_leave.to_f
      workingdays_data_structure << workingday
    end
    workingdays_data_structure
  end

   def self.filter_records(current_user)
    @workingdays =  if current_user.class == Group
      Workingday.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        Workingday.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        Workingday.where(employee_id: @employees)  
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        Workingday.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        Workingday.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        Workingday.where(employee_id: current_user.employee_id)
      end
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |workingday|
        csv << workingday.attributes.values_at(*column_names)
      end
    end
  end

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     workingday = find_by_id(row['id']) || new
  #     workingday.attributes = row.to_hash.slice(*row.to_hash.keys)
  #     workingday.save!
  #   end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
  #   when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
  #   when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end

  def create_day_in_month(e,date)
    if e.joining_detail.nil?
    else
      if e.joining_detail.employee_category.nil?
      else
        day = e.joining_detail.employee_category.name == 'Worker' ? 26 : date.end_of_month.day
      end
    end
    day
  end
end
