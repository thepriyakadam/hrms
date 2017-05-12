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
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false, first_reporter_id: current_user.employee_id)
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
    if current_user.class == Group
      @pending_on_duty_requests = OnDutyRequest.where(is_first_approved: false, is_first_rejected: false, is_cancelled: false,employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: @employees_ind)
    else
      @pending_on_duty_requests = OnDutyRequest.where(is_first_approved: false, is_first_rejected: false, is_cancelled: false,employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: @employees_ind)
    end
    session[:active_tab] ="ManagerSelfService"
  end

  def od_request_list
    if current_user.class == Group
      @first_level_request_lists = OnDutyRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false)
    else
      @first_level_request_lists = OnDutyRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @on_duty_request = OnDutyRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @on_duty_request)
    end
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
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee)
  end
end
