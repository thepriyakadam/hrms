class LeaveCOff < ActiveRecord::Base
  belongs_to :employee

   def self.filter_records(current_user)
    @leave_c_offs =  if current_user.class == Group
    LeaveCOff.all
  elsif current_user.class == Member
    if current_user.role.name == "Company"
      @employees = Employee.where(company_id: current_user.company_id)
      LeaveCOff.where(employee_id: @employees)
    elsif current_user.role.name == "CompanyLocation"
      @employees = Employee.where(company_location_id: current_user.company_location_id)
      LeaveCOff.where(employee_id: @employees)  
    elsif current_user.role.name == "Department"
      @employees = Employee.where(department_id: current_user.department_id)
      LeaveCOff.where(employee_id: @employees)
    elsif current_user.role.name == "Employee"
      LeaveCOff.where(employee_id: current_user.employee_id)
    end
  end
  end
end
