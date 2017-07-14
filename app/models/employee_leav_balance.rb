class EmployeeLeavBalance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  belongs_to :company_leav
  has_many :employee_leav_requests
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
