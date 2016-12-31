class LeaveCOff < ActiveRecord::Base
  belongs_to :employee
  validates_uniqueness_of :c_off_date, :scope => :employee_id
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
  # def is_available?
  #   LeaveCOff.exists?(employee_id: self.employee_id,c_off_type: 'Full Day')
  # end

end
