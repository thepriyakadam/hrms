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

  def is_self_present(emp,date)
    flag = 0
    flag = LeaveCOff.exists?(employee_id: emp,c_off_date: date.to_date,status: nil)
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
end
