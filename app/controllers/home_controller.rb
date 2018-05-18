class HomeController < ApplicationController

  # before_action :set_home, only: [:show]

  # ##load_and_authorize_resource
  # require 'date'

  def index
    @sidebar_tabs = SidebarTab.all
    
    @circulars = Circular.where(is_active: true)
    @company_policies = CompanyPolicy.group("policy_type_id")
    @company_events = CompanyEvent.all
    @galleries = Gallery.all
    @companies = Company.all
    @company_locations = CompanyLocation.all
    @departments = Department.all
    @employees = Employee.all
    #vacancy
    @vacancy_masters = VacancyMaster.where(vacancy_of: 'Refferal',is_confirmed: nil)
   
    @employees = Employee.all
    if current_user.class == Member
      # @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id, status: true)
      
      #if current_user.role.name == "Employee" 
        @self_pending_od = OnDutyRequest.where(current_status: "Pending", employee_id: current_user.employee_id).count
        @self_pending_leave  = EmployeeLeavRequest.where(current_status: "Pending", employee_id: current_user.employee_id).count
        @self_leave_c_off = LeaveCOff.where(employee_id: current_user.employee_id, current_status: "Pending").count
        @self_employee_plan = EmployeePlan.where(employee_id: current_user.employee_id, current_status: "Pending").count
        @self_travel_requests = TravelRequest.where(employee_id: current_user.employee_id, current_status: "Pending").count
        @self_expense_claim = TravelRequest.where(employee_id: current_user.employee_id, current_status: "FinalApproved").count
     
      #elsif current_user.role.name == "Admin"
        @all_pending_od = OnDutyRequest.where(current_status: "Pending").count
        @all_pending_leave  = EmployeeLeavRequest.where(current_status: "Pending").count
        @admin_c_off = LeaveCOff.where(current_status: "Pending").count
        @admin_employee_plan = EmployeePlan.where(current_status: "Pending").count
        @admin_travel_requests = TravelRequest.where(current_status: "Pending").count
        @admin_expense_claim = TravelRequest.where(current_status: "FinalApproved",is_confirm: true).count
        @final_travel_requests = TravelRequest.where(current_status: "Approved").count

      #else 
        @pending_od = OnDutyRequest.where(current_status: "Pending", first_reporter_id: current_user.employee_id).count
        @pending_leave  = EmployeeLeavRequest.where(current_status: "Pending", first_reporter_id: current_user.employee_id).count
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
        @leave_c_off = LeaveCOff.where(employee_id: @employees, current_status: "Pending").count
        @employee_plan = EmployeePlan.where(employee_id: current_user.employee_id, current_status: "Pending").count
        @travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id, current_status: "Pending").count
        @expense_claim = TravelRequest.where(employee_id: current_user.employee_id, current_status: "FinalApproved").count
      #end

      #pms
        @period = Period.where(status: true).last

        goal_bunches = GoalBunch.where(period_id: @period.id).pluck(:employee_id)
        @period_not_set = Employee.where(status: "Active").where.not(id: goal_bunches).count
        @emp = Employee.where(status: "Active").pluck(:id)
        @period_set = GoalBunch.where(period_id: @period.id,employee_id: @emp).where.not(employee_id: nil).count

        @goal_set = GoalBunch.where(period_id: @period.id,employee_id: @emp,goal_confirm: true).count
        @goal_set_not_confirm = GoalBunch.where(period_id: @period.id,employee_id: @emp).where.not(goal_confirm: true).count

        @goal_approved = GoalBunch.where(period_id: @period.id,employee_id: @emp,goal_approval: true,goal_confirm: true).count
        @goal_approved_not_confirm = GoalBunch.where(period_id: @period.id,employee_id: @emp,goal_confirm: true).where.not(goal_approval: true).count

        @self_evaluation = GoalBunch.where(period_id: @period.id,employee_id: @emp,appraisee_confirm: true,goal_approval: true).count
        @self_evaluation_not_confirm = GoalBunch.where(period_id: @period.id,employee_id: @emp,appraisee_confirm: nil,goal_approval: true).count

        @appraiser_evaluation = GoalBunch.where(period_id: @period.id,employee_id: @emp,appraisee_confirm: true,appraiser_confirm: true).count
        @appraiser_evaluation_not_confirm = GoalBunch.where(period_id: @period.id,employee_id: @emp,appraisee_confirm: true).where.not(appraiser_confirm: true).count

        @reviewer_evaluation = GoalBunch.where(period_id: @period.id,employee_id: @emp,reviewer_confirm: true,appraiser_confirm: true).count
        @reviewer_evaluation_not_confirm = GoalBunch.where(period_id: @period.id,employee_id: @emp,reviewer_confirm: nil,appraiser_confirm: true).count

        @final_evaluation =  GoalBunch.where(period_id: @period.id,employee_id: @emp,final_confirm: true).count
        @final_evaluation_not_confirm =  GoalBunch.where(period_id: @period.id,employee_id: @emp).where.not(final_confirm: true).count

        @total_set = @goal_set.to_f + @goal_approved.to_f + @self_evaluation.to_f + @appraiser_evaluation.to_f + @reviewer_evaluation.to_f + @final_evaluation.to_f
        @employee = Employee.all.count
        #@period_not_set =  @employee.to_i - @total_set.to_i

      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.try(:name) == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
       @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      elsif current_user.role.name == 'CEO'
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

  def assigned_user
      @employees = Employee.all
      respond_to do |f|
      f.js
      f.xls {render template: 'home/assigned_user.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'assigned_user',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'home/assigned_user.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end
  
  def event_detail
    @company_event = CompanyEvent.find(params[:id])
  end
end
