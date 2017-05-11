class SelfServicesController < ApplicationController


 def show
 end
 
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
    # byebug
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: current_user.employee_id)
    
    respond_to do |format|
      format.js
      format.xls {render template: 'self_services/datewise_attendance_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'datewise_attendance_report_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'self_services/datewise_attendance_report_pdf.pdf.erb',
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
end