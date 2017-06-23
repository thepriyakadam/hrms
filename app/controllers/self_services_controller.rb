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
    @employee_resignations = EmployeeResignation.find_by_employee_id(params[:emp_id])
    # @employee_resignations = EmployeeResignation.where(id: @employee_resignation_id.id)
  end

  def employee_transfer
    @employee_transfer = EmployeeTransfer.new
    @employee_transfers = EmployeeTransfer.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def travel_request
    @travel_request = TravelRequest.new
    @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    @employee = Employee.find_by(id: current_user.employee_id)
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
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day")

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

  def leave_c_off
    session[:active_tab] ="EmployeeSelfService"
    @leave_c_off = LeaveCOff.new
    @leave_c_offs = LeaveCOff.where(employee_id: current_user.employee_id).order("id DESC")
  end

  def create_self_c_off
    @leave_c_off = LeaveCOff.new
    @employee_id = params[:employee_id]
    @c_off_date = params[:leave_c_off][:c_off_date]
    @c_off_type = params[:leave_c_off][:c_off_type]

    if @leave_c_off.is_self_present(@employee_id,@c_off_date)
      flash[:alert] = "Your COff already set for that day"
    else
      @leave_c_off = LeaveCOff.new(leave_c_off_params)
      @leave_c_offs = LeaveCOff.all
      leav_category = LeavCategory.find_by(code: 'C.Off')

      if @leave_c_off.is_week_off_present(@employee_id) || @leave_c_off.is_holiday_present(@employee_id)

        if leav_category.nil?
        else
          @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
          if @c_off.nil?
          else
            @c_off.each do |l|
              if l.try(:expiry_date).to_date < Date.today
                LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
              else
              end
            end#do
          end#c_off.nil?

          if @c_off_type == 'Full Day'
            @leave_c_off = LeaveCOff.create(employee_id:
             @employee_id,c_off_date: @c_off_date,c_off_type: @c_off_type,c_off_expire_day: 0,expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 1,status: false,current_status: "Pending")
            StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
            flash[:notice] = "Your COff Created Successfully!"
            COffMailer.pending(@leave_c_off).deliver_now
          else
            @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: @c_off_type,c_off_expire_day: 0,expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 0.5,status: false,current_status: "Pending")
            StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
            flash[:notice] = "Your COff Created Successfully!"
            COffMailer.pending(@leave_c_off).deliver_now
          end#@c_off_type
        end#leav_category.nil?
      else
        flash[:alert] = "Week Off Or Holiday Not Set"
      end#is_week_off_present

    end#@leave_c_off.is_self_present?
    redirect_to leave_c_off_self_services_path
  end#def

  def reimbursement_request
    @reimbursement_request = ReimbursementRequest.new
    @reimbursement_requests = ReimbursementRequest.where(employee_id: current_user.employee_id)
    session[:active_tab] = "PayrollManagement"
    session[:active_tab1] ="ltareimbursement"
  end

  def create_reimbursement_request
    @reimbursement_request = ReimbursementRequest.new
    @employee_id = params[:employee_id]
    @reimbursement_head_id = params[:reimbursement_request][:reimbursement_head_id]
    @date = params[:reimbursement_request][:date]
    @amount = params[:reimbursement_request][:amount]
    ReimbursementRequest.create(employee_id: @employee_id,reimbursement_head_id: @reimbursement_head_id,date: @date,amount: @amount,status: "Pending")
    flash[:notice] = "Reimbursement Request Created Successfully!"
    redirect_to reimbursement_request_self_services_path
  end

  def employee_rembursment
    @rembursment = Rembursment.new
    @rembursments = Rembursment.where(employee_id: current_user.employee_id)
  end

  def create_emp_rembursment
    @rembursment = Rembursment.new
    employee_id = params[:rembursment][:employee_id]
    application_date = params[:rembursment][:application_date]
    rembursment_date = params[:rembursment][:rembursment_date]
    rembursmentmaster_id = params[:rembursment][:rembursmentmaster_id]
    amount = params[:rembursment][:amount]
    @employee = Employee.find_by(id: employee_id)
    @rembursment_req = Rembursment.create(employee_id: employee_id,application_date: application_date,rembursment_date: rembursment_date,rembursmentmaster_id: rembursmentmaster_id,amount: amount,status: "Pending",manager_id: @employee.manager_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment_req.id,status: "Pending",manager_id: employee_id)
    flash[:notice] = "Reimbursement Request Created Successfully!"
    redirect_to employee_rembursment_self_services_path
  end

  def add_attendance
    @employee_attendances = EmployeeAttendance.where(employee_id: current_user.employee_id)
  end

  def create_self_attendance
    # @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    employee_id = params[:salary][:employee_id]
    day = params[:salary][:day]
    present = params[:salary][:present]
    @emp = Employee.find_by(id: employee_id)
    # if @employee_attendance.is_present(day,employee_id)
    #   flash[:notice] = "Already Exist"
    # else
      @emp_atten = EmployeeAttendance.create(employee_id: employee_id,day: day,present: present, is_confirm: false)  
      if @emp_atten.save
        flash[:notice] = "Created successfully"
      else
        flash[:alert] = "Already Exist"
      end
    # end
    redirect_to add_attendance_self_services_path
  end

  def leave_c_off_params
    params.require(:leave_c_off).permit(:is_expire,:employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status, :expiry_date, :leave_count)
  end
 

end