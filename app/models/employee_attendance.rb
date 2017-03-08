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
  
  def attendance_date_wise_role(date,company,location,department,current_user)
    if current_user.class == Group
      if company == ""
        @employees = Employee.where(status: 'Active').pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
      elsif location == ""
        @employees = Employee.where(company_id: company.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
      elsif department == ""
        @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
      else
        @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          @employees = Employee.where(status: 'Active').pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        elsif location == ""
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        elsif department == ""
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        end
        elsif current_user.role.name == 'Admin'
         if company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        elsif location == ""
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        elsif department == ""
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        end
        elsif current_user.role.name == 'Branch'
          if company == "" || location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
         elsif department == ""
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
          else 
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        end
        elsif current_user.role.name == 'HOD'
          if company == "" || location == "" || department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        else 
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          @employee_attendances = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: date.to_date ,employee_id: @employees).take
        end
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
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
