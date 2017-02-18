class EmployeeAttendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_leav_request
  belongs_to :machine_attendance
  belongs_to :company_time_master
  validates :day, uniqueness: { scope: [:employee_id] }


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
