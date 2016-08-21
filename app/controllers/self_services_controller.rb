class SelfServicesController < ApplicationController
  def employee
    @employees = Employee.where(id: current_user.employee_id)
    session[:active_tab] ="selfservice"
  end

  def employee_template
    @employee = Employee.find(current_user.employee_id)
    @employee_templates = @employee.employee_templates
    session[:active_tab] ="selfservice"
  end

  def attendance
    @attendances = Attendance.where(employee_id: current_user.employee_id)
    session[:active_tab] ="selfservice"

  end

  def salaryslip
    # @employee = Employee.find(current_user.employee_id)
    @salray_slips = Salaryslip.where(employee_id: current_user.employee_id)
    session[:active_tab] ="selfservice"
  end

  def advance
    @advance_salaries = AdvanceSalary.where(employee_id: current_user.employee_id)
    if @advance_salaries.nil?
      flash[:alert] = 'Advance Salary not taken.'
      redirect_to root_url
    else
      # @instalments = @advance_salary.instalments
    end
    session[:active_tab] ="selfservice"
  end

  def employee_resignation
    @employee_resignation = EmployeeResignation.new
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
  end

  def resignation_history
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
  end

  def show_resignation_detail
    @employee_resignation_id = EmployeeResignation.find_by_employee_id(params[:emp_id])
    @resignation_histories = ResignationHistory.where(employee_resignation_id: @employee_resignation_id.id)
  end

  def employee_transfer
    @employee_transfer = EmployeeTransfer.new
    @employee_transfers = EmployeeTransfer.where(employee_id: current_user.employee_id)
    session[:active_tab] = "selfservice"
  end


end

