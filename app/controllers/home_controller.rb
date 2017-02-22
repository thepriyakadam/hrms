class HomeController < ApplicationController
  # load_and_authorize_resource
  def index
    @circulars = Circular.where(is_active: true)
    @company_policies = CompanyPolicy.all
    @company_events = CompanyEvent.all
    @companies = Company.all
    @company_locations = CompanyLocation.all
    @departments = Department.all
    #@employees = Employee.all
    if current_user.class == Member
      @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id, status: true)
      
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.try(:name) == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      elsif current_user.role.name == 'Employee'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'AccountAdmin'
        @employee = Employee.find(current_user.employee_id)
      else current_user.role.name == 'Account'
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
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.joins('INNER JOIN members on employees.id = members.employee_id')
      elsif current_user.role.name == 'Admin'
        @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id where employees.company_id = #{current_user.company_location.company_id}")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id where employees.company_location_id = #{current_user.company_location_id}")
      else
        @employees = Employee.joins('INNER JOIN members on employees.id = members.employee_id')
      end
    end
  end
  
  def event_detail
    @company_event = CompanyEvent.find(params[:id])
  end
  
end
