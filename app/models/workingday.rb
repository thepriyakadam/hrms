class Workingday < ActiveRecord::Base
  # enum month: [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  enum month: { January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12 }
  validates :employee_id, uniqueness: { scope: :month_name }
  belongs_to :employee
  has_many :salaryslips

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

  def self.find_by_role(workingdays, current_user)
    if current_user.class == Group
      Employee.where(id: workingdays)
    else
      if current_user.role.name == 'Company'
        Employee.where(id: workingdays)
      elsif current_user.role.name == 'CompanyLocation'
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
      if current_user.role.name == "Company"
        @employees = Employee.where(company_id: current_user.company_id)
        Workingday.where(employee_id: @employees)
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        Workingday.where(employee_id: @employees)  
      elsif current_user.role.name == "Department"
        @employees = Employee.where(department_id: current_user.department_id)
        Workingday.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        Workingday.where(employee_id: current_user.employee_id)
      end
    end
  end

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
