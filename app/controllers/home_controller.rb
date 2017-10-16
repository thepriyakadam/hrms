class HomeController < ApplicationController

  # before_action :set_home, only: [:show]
  # load_and_authorize_resource
  require 'date'

  def index
    @circulars = Circular.where(is_active: true)
    @company_policies = CompanyPolicy.group("policy_type_id")
    @company_events = CompanyEvent.all
    @companies = Company.all
    @company_locations = CompanyLocation.all
    @departments = Department.all
    @employees = Employee.all
    #vacancy
    @vacancy_masters = VacancyMaster.where(vacancy_of: 'Refferal',is_confirmed: nil)
   
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
      elsif current_user.role.name == 'Account'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'NewEmployee'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'Recruitment'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'GroupRecruiter'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'AdminRecruiter'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'TimeAndAttendance'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'GroupTimeManagement'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'AdminTimeManagement'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'NewEmployee'
        @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == 'CEO'
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

  def company_policy_detail_dashboard
      @company_policy = CompanyPolicy.find(params[:company_policy_id])
      policy_type = @company_policy.policy_type
      @company_policies = CompanyPolicy.where(policy_type: policy_type)
  end
  
  def event_detail
    @company_event = CompanyEvent.find(params[:id])
  end

  
 
end
