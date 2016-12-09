class HomeController < ApplicationController
  # load_and_authorize_resource
  def index
    @circulars = Circular.all
    @company_policies = CompanyPolicy.all
    @companies = Company.all
    @company_locations = CompanyLocation.all
    @departments = Department.all
    #@employees = Employee.all
    if current_user.class == Member
      @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id, status: true)
      if current_user.role.name == 'Employee'
        @employee = Employee.find(current_user.employee_id)
        #redirect_to home_index_path
      elsif current_user.role.try(:name) == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Department'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        # @employees_indirect = @emp.indirect_subordinates
        # @employees_direct = @emp.subordinates
        @employees = @emp.subordinates
      elsif current_user.role.name == 'SalaryAccount'
        @employee = Employee.find(current_user.employee_id)
      end
    else
      #@employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id, status: true)
      @employees = Employee.all
    end
  end

  def created_user
   session[:active_tab] ="UserAdministration"
    if current_user.class == Group
      @employees = Employee.joins('INNER JOIN members on employees.id = members.employee_id')
    else
      if current_user.role.name == 'Company'
        @employees = Employee.joins('INNER JOIN members on employees.id = members.employee_id')
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id where employees.company_location_id = #{current_user.company_location_id}")
      end
    end
  end
end
