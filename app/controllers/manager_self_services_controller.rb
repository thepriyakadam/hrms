class ManagerSelfServicesController < ApplicationController
	def subordinate_list
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def appraiser_subordinate
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(appraisee_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def reviewer_subordinate
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(appraiser_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_list
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(" appraiser_confirm = ? OR reviewer_confirm = ?", true,true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def approved_or_rejected_leave_request
    if current_user.class == Group
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false)
    else
      @pending_employee_leav_requests = EmployeeLeavRequest.where(current_status: "Pending", first_reporter_id: current_user.employee_id)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false, second_reporter_id: current_user.employee_id)
    end
    session[:active_tab] ="ManagerSelfService"
  end

  def all_leave_request_list
    if current_user.class == Group
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false)
    else
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @emp_leav_req)
    end
    session[:active_tab] ="ManagerSelfService"
  end

  def request_approval_list
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
      @pending_on_duty_requests = OnDutyRequest.where(current_status: "Pending", employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: @employees_ind)
    session[:active_tab] ="ManagerSelfService"
  end

  def od_request_list
   
      @first_level_request_lists = OnDutyRequest.where(current_status: "Pending")
      @on_duty_request = OnDutyRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @on_duty_request)
    
    session[:active_tab] ="ManagerSelfService"
  end
  
  def training_request_list
    @training_requests = TrainingRequest.where("reporting_master_id = ? and (status = ? or status = ? or status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] = "ManagerSelfService"
  end

  def final_approval_training_list
    @training_requests = TrainingRequest.where(status: "SecondApproved")
  	session[:active_tab] ="ManagerSelfService"
  end

  def resignation_history
    @pending_resignation_requests = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false,reporting_master_id: current_user.employee_id)
    @first_approved_resignation_requests = EmployeeResignation.where(is_first_approved: true, is_second_approved: false,is_second_rejected: false, is_cancelled: false,second_reporter_id: current_user.employee_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_resignation_history
    @emp = Employee.find(current_user.employee_id)
    @sub = @emp.subordinates
    @ind_sub = @emp.indirect_subordinates
    @employee = @sub + @ind_sub

    @employee_resignations = EmployeeResignation.where(employee_id: @employee).group(:employee_id)
  end

  def final_approval_emp_resignation_list
    @employee_resignations = EmployeeResignation.where("(resign_status = ?)","SecondApproved")
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_attendance
    session[:active_tab] ="ManagerSelfService"
  end

  def show_datewise_attendance
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee = @employees + @employees_ind

    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_id = params[:employee][:employee_id]
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day ASC")
  end

  def subordinate_attendance
    session[:active_tab] ="ManagerSelfService"
  end

  def show_subordinate_attendance
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee_id = @employees + @employees_ind

    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day DESC")

     respond_to do |format|
        format.js
        format.xls {render template: 'manager_self_services/subordinate_attendance.xls.erb'}
        format.html
        format.pdf do
        render pdf: 'show_subordinate_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'manager_self_services/subordinate_attendance.pdf.erb',
              # show_as_html: params[:debug].present?,
              :page_height      => 1000,
              :dpi              => '300',
              :margin           => {:top    => 10, # default 10 (mm)
                            :bottom => 10,
                            :left   => 20,
                            :right  => 20},
              :show_as_html => params[:debug].present?
        end
      end
  end

  def investment_declaration
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] = "IncomeTax"
    @emp = InvestmentDeclaration.where(status: true,is_confirm: false).pluck(:employee_id)
    @employees = Employee.where(status: 'Active',id: @emp)
  end

  def investment_declaration_list
    @employee_id = params[:employee_id]
    @emp = Employee.find_by(id: @employee_id)
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.where(employee_id: @employee_id,status: true,is_confirm: false)
  end

  def reject_declaration
    comment = params[:comment]
    investment_declaration_id = params[:investment_declaration_id]
    @investment_declaration = InvestmentDeclaration.find_by(id: investment_declaration_id)
    @investment_declaration.update(status: false,comment: comment)
    flash[:alert] = "Rejected!"
    redirect_to investment_declaration_manager_self_services_path
  end

  def leave_c_off
    # byebug
    session[:active_tab] ="ManagerSelfService"
    current_login = Employee.find_by(id: current_user.employee_id)
    @sub = current_login.subordinates
    @ind_sub = current_login.indirect_subordinates

    @emp = @sub + @ind_sub
    @leave_c_off_pending = LeaveCOff.where(employee_id: @sub,is_taken: false,status: false,is_expire: false,current_status: "Pending")
    @leave_c_off_first_approved = LeaveCOff.where(employee_id: @ind_sub,is_taken: false,status: false,is_expire: false,current_status: "FirstApproved")

  end

  def employee_resignation_history
    @emp = Employee.find(current_user.employee_id)
    @sub = @emp.subordinates
    @ind_sub = @emp.indirect_subordinates
    @employee = @sub + @ind_sub

    @employee_resignations = EmployeeResignation.where(employee_id: @employee).group(:employee_id)
  end

  def vacancy_request
  end

  def vacancy_request_create
    @employee_designation = params[:vacancy_master][:employee_designation_id]
    flash[:notice] = "Vacancy Request Created!"
    redirect_to vacancy_request_manager_self_services_path   
   end


end
