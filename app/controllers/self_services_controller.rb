class SelfServicesController < ApplicationController
  #before_action :set_self_service, only: [:show, :edit, :update, :destroy]

  def employee
    @employees = Employee.where(id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def employee_template
    @employee = Employee.find(current_user.employee_id)
    @employee_templates = @employee.employee_templates
    @template = EmployeeTemplate.where(employee_id: @employee.id)
    @salaryslip_component = SalaryslipComponent.all
    session[:active_tab] ="EmployeeSelfService"
  end

  def attendance
    @attendances = Attendance.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def salaryslip
   @salary_slips = Salaryslip.where("employee_id = ? AND  is_confirm =?",current_user.employee_id , true).order("id DESC")
   session[:active_tab] ="EmployeeSelfService"
  end

  def advance
    @advance_salaries = AdvanceSalary.where(employee_id: current_user.employee_id)
    if @advance_salaries.nil?
      flash[:alert] = 'Advance Salary not taken.'
      redirect_to root_url
    else
      # @instalments = @advance_salary.instalments
    end
    session[:active_tab] ="EmployeeSelfService"
  end

  def employee_resignation
    @employee_resignation = EmployeeResignation.new
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def resignation_history
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def show_resignation_detail
    @employee_resignation_id = EmployeeResignation.find_by_employee_id(params[:emp_id])
    @resignation_histories = ResignationHistory.where(employee_resignation_id: @employee_resignation_id.id)
  end

  def employee_transfer
    @employee_transfer = EmployeeTransfer.new
    @employee_transfers = EmployeeTransfer.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def travel_request
    @travel_request = TravelRequest.new
    @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def employee_attendance
    @employee_attendance = EmployeeAttendance.new
    @employee_attendances = EmployeeAttendance.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def show_self_datewise_attendance
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_id = params[:employee][:employee_id]
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id)

  end

  def investment_declaration
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.where(employee_id: current_user.employee_id)
    @employee = Employee.find_by(id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def create_self_declaration
    @employee_id = params[:employee_id]
    @investment_head_id = params[:investment_declaration][:investment_head_id]
    @amount = params[:investment_declaration][:amount]
    @date = params[:investment_declaration][:date]
    @status = params[:investment_declaration][:status]
    @document = params[:investment_declaration][:document]
    InvestmentDeclaration.create(date: @date,investment_head_id: @investment_head_id,amount: @amount,employee_id: @employee_id,status: @status)
    flash[:notice] = "created Successfully!"
    redirect_to investment_declaration_self_services_path
  end

  def investment_document2
        @investment_declaration = InvestmentDeclaration.find(params[:id])
        send_file @investment_declaration.document.path,
               filename: @investment_declaration.document_file_name,
               type: @investment_declaration.document_content_type,
               disposition: 'attachment'
    
   end
end