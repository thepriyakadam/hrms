class SelfServicesController < ApplicationController
  #before_action :set_self_service, only: [:show, :edit, :update, :destroy]

  def employee
    @employees = Employee.where(id: current_user.employee_id)
    session[:active_tab] = "EmployeeSelfService"
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

  def present_to_title 
    emp = EmployeeAttendance.all
    emp.each do |empatt|
      present = empatt[:present]
      title = empatt[:title]
      if present == title
        
      else
        @empatt = empatt.update(present: present, title: present)
      end
    end
    redirect_to employee_attendance_self_services_path
  end

  def modal_info_about_attendance
  end 
  
  def employee_resignation
    @employee_resignation = EmployeeResignation.new
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    @notice_period = joining_detail.try(:notice_period)
    session[:active_tab] ="EmployeeSelfService"
  end

  def create_self_resignation
    @employee_resignation = EmployeeResignation.new
    employee_id = params[:employee_id]
    application_date = params[:application_date]
    resignation_date = params[:employee_resignation][:resignation_date]
    leaving_reason_id = params[:employee_resignation][:leaving_reason_id]
    # notice_period = params[:notice_period]
    tentative_leaving_date = params[:employee_resignation][:tentative_leaving_date]
    reason = params[:employee_resignation][:reason]
    note = params[:employee_resignation][:note]

    @employee = Employee.find_by(id: current_user.employee_id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @notice_period = @joining_detail.notice_period_after_probation

    if resignation_date == "" || leaving_reason_id == "" || tentative_leaving_date == "" || reason == ""
      flash[:alert] = "Please fill all mandatory fields!"
    else
      if @employee_resignation.is_there_self(employee_id)
      flash[:alert] = "Your Request already has been sent"
     else
        @employees=Employee.find_by(id: employee_id)
        @date_diff = (tentative_leaving_date.to_date - resignation_date.to_date).to_i

        @employee_resignation = EmployeeResignation.create(short_notice_period: @date_diff,reporting_master_id: @employees.manager_id,is_pending: true,resign_status: "Pending",is_first_approved: false,is_first_rejected: false, is_cancelled: false,employee_id: employee_id,resignation_date: resignation_date,application_date: application_date,reason: reason,note: note,leaving_reason_id: leaving_reason_id,notice_period: @notice_period,tentative_leaving_date: tentative_leaving_date)  
        @resignation_status_record = ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "Pending",change_date: Date.today)
        EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now
        flash[:notice] = "Created Successfully!"
      end#is_there?
    end#nil
      redirect_to employee_resignation_self_services_path
  end



  def display_notice_period
    @employee = Employee.find_by(id: current_user.employee_id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @notice_period = @joining_detail.notice_period_after_probation
  end

  def resignation_history
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def modal_show_resignation_detail
    @employee_resignation = EmployeeResignation.find(params[:format])

    @resignation_status_records = ResignationStatusRecord.where(employee_resignation_id: @employee_resignation.id)
    @employee_resignations = EmployeeResignation.where(id: @employee_resignation.id).take
    # @employee_resignation = EmployeeResignation.find_by_id(params[:id])
   # @employee_resignation = EmployeeResignation.find_by(id: @employee_resignations.id)
    @resignation_status_records = ResignationStatusRecord.where(employee_resignation_id: @employee_resignation.id)
    @employee_resignations = EmployeeResignation.where(id: @employee_resignation.id).take

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
    @latemark_master = LatemarkMaster.last
    if @latemark_master.nil?
      flash[:alert] = "Latemark Master not set"
       @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day DESC")
    else
      @latemark_master_time = @latemark_master.company_time
      @company_time = @latemark_master_time.strftime("%I:%M")
      @company_late_limit_time = @latemark_master.late_limit
      @company_late_time = @company_late_limit_time.strftime("%I:%M")
      @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day DESC")
    end
    names = @employee_attendances.map {|e| e.status }
    @numbers = names.group_by(&:itself).transform_values(&:count)
  end

  def investment_declaration
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.where(employee_id: current_user.employee_id)
    @employee = Employee.find_by(id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def show_investment_declaration_list
    # byebug
    # @investment_head_id = params[:investment_head_id]
    @investment_declaration = InvestmentDeclaration.find(params[:format])
    @employee = Employee.find_by(id: current_user.employee_id)
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


  def holiday_setup
    @day = params[:day]
    # @employee_attendances = EmployeeAttendance.where(present: 'H',employee_id: current_user.employee_id).order("day ASC")
    @employee_attendances = EmployeeAttendance.where(employee_id: current_user.employee_id).where.not(holiday_id: nil).order("day ASC")
    session[:active_tab] = "EmployeeSelfService"
  end


  def leave_c_off
    session[:active_tab] ="EmployeeSelfService"
    @leave_c_off = LeaveCOff.new
    @leave_c_offs = LeaveCOff.where(employee_id: current_user.employee_id).order("id ASC")
  end

  def show_leave_c_off_list
    @leave_c_off = LeaveCOff.find(params[:format])
  end

  def create_self_c_off
    @leave_c_off = LeaveCOff.new
    @employee_id = params[:employee_id]
    @c_off_date = params[:leave_c_off][:c_off_date]
    @c_off_type = params[:leave_c_off][:c_off_type]
    @in_time = params[:leave_c_off][:in_time]
    @out_time = params[:leave_c_off][:out_time]
    @comment = params[:leave_c_off][:comment]
    leav_category = LeavCategory.find_by(code: 'C.Off')

    if @c_off_type == nil || @c_off_type == ""
      @c_off_type = "Full Day"
    end
    @joining_detail = JoiningDetail.find_by(employee_id: @employee_id)

    if @joining_detail.c_off == true

      if @leave_c_off.is_self_present(@employee_id,@c_off_date)
        flash[:alert] = "Your COff already set for that day"
      else
        @leave_c_off = LeaveCOff.new(leave_c_off_params)
        @leave_c_offs = LeaveCOff.all
        
        if @joining_detail.c_off_expire == true
          c_off_expire_day = @joining_detail.c_off_applicable_day.to_f
          @expiry_date = @c_off_date.to_date + c_off_expire_day.to_f
          @expiry_status = true
        else
          c_off_expire_day = 0
          @expiry_date = nil
          @expiry_status = @joining_detail.c_off_expire
        end
        @c_off_expire_day = c_off_expire_day
        @expiry_date = @expiry_date
        @expiry_status = @expiry_status


        @emp_attendance = EmployeeAttendance.where(employee_id: @employee_id,day: @c_off_date.to_date).take
        total = @out_time.to_time - @in_time.to_time
        min = total.to_f/60
        hr = min.to_f/60
        #@total_working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
        @total_working_hrs = hr
        
          if leav_category.nil?
          else
           
            if  @emp_attendance.present?
              if @emp_attendance.holiday_id.present? || @emp_attendance.employee_week_off_id.present?
                if @emp_attendance.on_duty_request_id.present?
                  @on_duty_request = OnDutyRequest.find_by(id: @emp_attendance.on_duty_request_id)
                  if @on_duty_request.leave_type == "Half Day"
                    @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Half Day",c_off_expire_day: @c_off_expire_day,
                      expiry_status: @expiry_status,expiry_date: @expiry_date,is_expire: false,leave_count: 0.5,status: false,current_status: "Pending",
                      comment: @comment,in_time: @in_time,out_time: @out_time,total_working_hrs: @total_working_hrs)
                    StatusCOff.create(comment_coff: "COff Request By Employee",leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                    flash[:notice] = "Your COff Created Successfully!"
                    #COffMailer.pending(@leave_c_off).deliver_now

                  else#@on_duty_request.leave_type == "Full Day"
                    @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Full Day",c_off_expire_day: @c_off_expire_day,
                      expiry_status: @expiry_status,expiry_date: @expiry_date,is_expire: false,leave_count: 1,status: false,current_status: "Pending",
                      comment: @comment,in_time: @in_time,out_time: @out_time,total_working_hrs: @total_working_hrs)
                    StatusCOff.create(comment_coff: "COff Request By Employee",leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                    flash[:notice] = "Your COff Created Successfully!"
                    #COffMailer.pending(@leave_c_off).deliver_now

                  end#@on_duty_request.leave_type == "Half Day"
                else#emp_attendance.on_duty_request_id != nil
                  if @emp_attendance.working_hrs.to_s < "07:00"
                    if @emp_attendance.working_hrs.to_s < "04:00"
                      flash[:alert] = "Working hours less then 4"
                    else#working_hrs.to_s < "4:00"
                      @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Half Day",
                        c_off_expire_day: @c_off_expire_day,expiry_status: @expiry_status,expiry_date: @expiry_date,is_expire: false,leave_count: 0.5,
                        status: false,current_status: "Pending",comment: @comment,in_time: @in_time,out_time: @out_time,total_working_hrs: @total_working_hrs)
                      StatusCOff.create(comment_coff: "COff Request By Employee",leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                      flash[:notice] = "Your COff Created Successfully!"
                      #COffMailer.pending(@leave_c_off).deliver_now

                    end#working_hrs.to_s < "4:00"
                  else#@emp_attendance.working_hrs.to_s < "7:00"

                    @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Full Day",c_off_expire_day: @c_off_expire_day,
                      expiry_status: @expiry_status,expiry_date: @expiry_date,is_expire: false,leave_count: 1,status: false,current_status: "Pending",
                      comment: @comment,in_time: @in_time,out_time: @out_time,total_working_hrs: @total_working_hrs)
                    StatusCOff.create(comment_coff: "COff Request By Employee",leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                    flash[:notice] = "Your COff Created Successfully!"
                    #COffMailer.pending(@leave_c_off).deliver_now

                  end#@emp_attendance.working_hrs.to_s < "7:00"
                end#@emp_attendance.on_duty_request_id != nil
              else#@emp_attendance.holiday_id != nil
                flash[:alert] = "Holiday Or Week Off not available !"
              end#@emp_attendance.holiday_id != nil
            else
              flash[:alert] = "Attendance not available !"
            end#@emp_attendance.present?

          end#leav_category.nil?
      end#@leave_c_off.is_self_present(@employee_id,@c_off_date)
    else
      flash[:alert] = "You are not applicable for compansatory off!"
    end
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

  def employee_contact_library
    @employees = Employee.where(status: "Active")
    session[:active_tab] = "EmployeeSelfService"
  end

  def add_attendance
    #@employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    @emp_attendance = EmployeeAttendance.where(employee_id: current_user.employee_id,day: Date.today).take
    @employee_attendances = EmployeeAttendance.where(employee_id: current_user.employee_id).order('day DESC')
  end

  def create_in_time
    # @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    # employee_id = params[:salary][:employee_id]
    # day = params[:salary][:day]
    # in_time = params[:salary][:in_time]
    # @emp = Employee.find_by(id: employee_id)
     # if @employee_attendance.is_present(day,employee_id)
    #   flash[:notice] = "Already Exist"
    # else
    time = Time.now
    in_time = Time.at(time).strftime("%H:%M")
      @emp_atten = EmployeeAttendance.create(employee_id: current_user.employee_id,day: Date.today,present: 'P',in_time: in_time, is_confirm: false)  
      date = Date.today
      previous_date = (date - 1).to_date
      @employee_attendances = EmployeeAttendance.where(day: previous_date, out_time: nil,comment: nil).where.not(in_time: nil)
      @employee_attendances.each do |ea|
        ea.update(present: 'A',comment: 'Out time not available')
      end

      if @emp_atten.save
        flash[:notice] = "Created successfully"
      else
        flash[:alert] = "Already Exist"
      end
    # end
    redirect_to add_attendance_self_services_path
  end

  def create_out_time 
    emp_attendance = params[:emp_attendance]
    @employee_attendance = EmployeeAttendance.find_by(id: emp_attendance)
    in_time = @employee_attendance.in_time
    time = Time.now
    out_time = Time.at(time).strftime("%H:%M")
    
    total_hrs = out_time.to_time - in_time.to_time
    working_hrs = Time.at(total_hrs).strftime("%H:%M")
    if working_hrs.to_s > "08:00" 
      @employee_attendance.update(out_time: out_time,working_hrs: working_hrs,present: 'P')

    elsif working_hrs.to_s < "04:00"
      @employee_attendance.update(out_time: out_time,working_hrs: working_hrs,present: 'A')
    elsif working_hrs.to_s < "08:00"
      @employee_attendance.update(out_time: out_time,working_hrs: working_hrs,present: 'HD')
    end
    flash[:notice] = "Out time created successfully"
    redirect_to add_attendance_self_services_path
  end

  def exit_interview
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def internal
    @vacancy_masters = VacancyMaster.where(vacancy_of: 'Internal',is_confirmed: nil)
  end

  def show_internal_modal
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resume1 = SelectedResume.where(vacancy_master_id: @vacancy_master.id,add_by_id: current_user.employee_id)
  end

  def modal_contact_library
    @employee = Employee.find(params[:format])
  end

   def exit_interview
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def modal_c_off
    @leave_c_off = LeaveCOff.find(params[:format])
  end

  def self_exit_interview_list
    @exit_interviews = ExitInterview.where(employee_id: current_user.employee_id)
    # redirect_to self_exit_interview_list_self_services_path
  end
  # def apply_internally
  #   @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  # end
  #  def employee_attendance_params
  #   params.require(:employee_attendance).permit(:employee_id, :day, :present, :in_time)
  # end

  def leave_c_off_params
    params.require(:leave_c_off).permit(:is_expire,:employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status, :expiry_date, :leave_count)
  end
end


