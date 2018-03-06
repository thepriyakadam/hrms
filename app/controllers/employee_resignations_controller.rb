class EmployeeResignationsController < ApplicationController
  before_action :set_employee_resignation, only: [:show, :edit, :update, :destroy]

  # GET /employee_resignations
  # GET /employee_resignations.json
  def index
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @employee_resignations.to_csv }
    #   format.xls
    #     # @employee_resignations = EmployeeResignation.where("employee_id=? and (resign_status = ? or resign_status = ?)",current_user.employee_id,"Pending","Cancelled")
    #     @employee_resignations = EmployeeResignation.all
    # end
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employee_resignations = EmployeeResignation.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @employee_resignations = EmployeeResignation.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end
  
  # GET /employee_resignations/1
  # GET /employee_resignations/1.json
  def show
  # @reporting_master = ReportingMaster.find(@employee_resignation.reporting_master_id)
  # @employee = Employee.find(@reporting_master.employee_id)
  end

  # GET /employee_resignations/new
  def new
    @employee_resignation = EmployeeResignation.new
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"  
  end

  # GET /employee_resignations/1/edit
  def edit
  end


  def create
    @employee_resignation = EmployeeResignation.new(employee_resignation_params)

    if @employee_resignation.is_there?
      flash[:alert] = "Your Request already has been sent"
      redirect_to employee_resignations_path
     else
      if @employee_resignation.employee.try(:manager_id).nil?
        flash[:alert] = "Select Employee"
        redirect_to new_employee_resignation_path
      else
        respond_to do |format|
          if @employee_resignation.save
            @employees=Employee.where(id: @employee_resignation.employee_id).take
            @date_diff = (@employee_resignation.tentative_leaving_date - @employee_resignation.resignation_date).to_i
             EmployeeResignation.where(id: @employee_resignation.id).update_all(short_notice_period: @date_diff,reporting_master_id: @employees.manager_id,resign_status: "FinalApproved",final_reporter_id: current_user.employee_id,is_final_approved: true,exit_interview_date: @employee_resignation.exit_interview_date,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on)
             ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalApproved",change_date: Date.today)
             ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id,resign_status: @employee_resignation.resign_status)

             EmployeeResignationMailer.hr_request_to_employee(@employee_resignation).deliver_now
          
           if @employee_resignation.employee.manager_2_id.nil?  
             EmployeeResignationMailer.hr_request_to_manager_one(@employee_resignation).deliver_now
           else  
            EmployeeResignationMailer.hr_request_to_manager_one(@employee_resignation).deliver_now
             EmployeeResignationMailer.hr_request_to_manager_two(@employee_resignation).deliver_now
           end   

              @emp = Employee.find_by(id: @employee_resignation.employee_id)
              @emp.update(status: "Inactive")
              # EmployeeResignationMailer.no_second_reporter_approval_email_to_employee(@employee_resignation).deliver_now
              EmployeeResignationMailer.final_approval_email_to_employee(@employee_resignation).deliver_now

            format.html { redirect_to @employee_resignation, notice: 'Employee has been separated from the system' }
            format.json { render :show, status: :created, location: @employee_resignation }
          else
            format.html { render :new }
            format.json { render json: @employee_resignation.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /employee_resignations/1
  # PATCH/PUT /employee_resignations/1.json
   def update
    respond_to do |format|
      if @employee_resignation.update(employee_resignation_params)
        # EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now
        format.html { redirect_to @employee_resignation, notice: 'Employee Resignation was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_resignation }
      else
        format.html { render :edit }
        format.json { render json: @employee_resignation.errors, status: :unprocessable_entity }
        redirect_to employee_resignations_path

      end
    end
  end


  # def update
  #   @employee_resignation.update(employee_resignation_params)
  #   @employee_resignations = EmployeeResignation.all
  #   @employee_resignation = EmployeeResignation.new
  #   @reporting_master = ReportingMaster.find(@employee_resignation.reporting_master_id)

  #   # EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now

  #   flash[:notice]= "Updated successfully"
  #   redirect_to employee_resignations_path
  # end

  # DELETE /employee_resignations/1
  # DELETE /employee_resignations/1.json
  def destroy
    @employee_resignation.destroy
    respond_to do |format|
      format.html { redirect_to employee_resignations_url, notice: 'Employee resignation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_resignation_list
    # @employee = Employee.find(params[:emp_id])
    @employee_resignations = EmployeeResignation.all
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end
  
  # def resignation_history
  #   @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
  #   @employee_resignations = EmployeeResignation.where(reporting_master_id: @reporting_masters)
  #   session[:active_tab] ="employee_resignation"
  #   session[:active_tab1] = "resignation"   
  # end

  def resignation_history
    @pending_resignation_requests = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false,reporting_master_id: current_user.employee_id)
    @first_approved_resignation_requests = EmployeeResignation.where(is_first_approved: true, is_second_approved: false,is_second_rejected: false, is_cancelled: false,second_reporter_id: current_user.employee_id)
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] ="resignation"
  end

  def print_resignation_detail
    @employee = Employee.find(params[:emp_id])
    @employee_resignation = EmployeeResignation.find(params[:resignation_id])
    @employees = Employee.where(id: @employee.id).group(:id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @employee_resignation_id = EmployeeResignation.find_by_employee_id(params[:emp_id])
    @resignation_histories = ResignationHistory.where(employee_resignation_id: @employee_resignation_id.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_resignation_detail',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'employee_resignations/print_resignation_detail.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def employee_resignation_confirmation
     # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     @employee_resignation = EmployeeResignation.find(params[:format])
     # @reporting_master = ReportingMaster.find(@employee_resignation.reporting_master_id)
     # @employee = Employee.find(@reporting_master.employee_id)
     @employee_resignations = EmployeeResignation.where(employee_id: @employee_resignation.employee_id)
  end

  # def approve_resignation
  #   @employee_resignation = EmployeeResignation.find(params[:format])
  #   @employee_resignation.update(resign_status: "FirstApproved",is_pending: nil,is_first_approved: true,reporting_)
   
  #   session[:active_tab] ="resignationmanagement"
  #   session[:active_tab1] = "resign"  
  # end
  def first_approve_modal
    @employee_resignation = EmployeeResignation.find(params[:format])
  end

  def first_approve
    @employee_resignation = EmployeeResignation.find(params[:emp_resignation_id])
     @leaving_date = params[:employee_resignation] ? params[:employee_resignation][:leaving_date] : params[:leaving_date]
    #@leaving_date = params[:leaving_date]
    if @employee_resignation.employee.manager_2_id.nil?
    EmployeeResignation.where(id: @employee_resignation.id).update_all(leaving_date: @leaving_date)
   
      @employee_resignation.update(is_pending:true,is_first_approved: true,is_second_approved: true,resign_status: "SecondApproved")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondApproved",change_date: Date.today)
      EmployeeResignationMailer.no_second_reporter_approval_email_to_employee(@employee_resignation).deliver_now
    else

      EmployeeResignation.where(id: @employee_resignation.id).update_all(leaving_date: @leaving_date)
      @employee_resignation.update(is_pending:true,is_first_approved: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstApproved",is_second_approved: false,is_second_rejected: false, is_cancelled: false)
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FirstApproved",change_date: Date.today)
      EmployeeResignationMailer.first_level_approval_email_to_employee(@employee_resignation).deliver_now
      # EmployeeResignationMailer.second_level_request_email_to_reporting_manager(@employee_resignation).deliver_now
    end
    flash[:notice] = 'Resignation Request Approved Successfully'
    if @employee_resignation.employee_id == current_user.employee_id 
      redirect_to resignation_history_employee_resignations_path
    else
      redirect_to resignation_history_manager_self_services_path
    end
  end

  # def first_approve
  #   @employee_resignation = EmployeeResignation.find(params[:format])
  #   if @employee_resignation.employee.manager_2_id.nil?
  #     @employee_resignation.update(is_pending:true,is_first_approved: true,is_second_approved: true,resign_status: "SecondApproved")
  #     ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondApproved",change_date: Date.today)
  #     EmployeeResignationMailer.no_second_reporter_approval_email_to_employee(@employee_resignation).deliver_now
  #   else
  #     @employee_resignation.update(is_pending:true,is_first_approved: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstApproved",is_second_approved: false,is_second_rejected: false, is_cancelled: false)
  #     ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FirstApproved",change_date: Date.today)
  #     EmployeeResignationMailer.first_level_approval_email_to_employee(@employee_resignation).deliver_now
  #     EmployeeResignationMailer.second_level_request_email_to_reporting_manager(@employee_resignation).deliver_now
  #   end
  #   flash[:notice] = 'Resignation Request Approved Successfully'
  #   redirect_to resignation_history_employee_resignations_path
  # end

  def second_approve
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(is_second_approved: true,resign_status: "SecondApproved")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondApproved",change_date: Date.today)
    EmployeeResignationMailer.second_level_approval_email_to_employee(@employee_resignation).deliver_now
    flash[:notice] = 'Resignation Request Approved Successfully'
    if @employee_resignation.employee_id == current_user.employee_id 
      redirect_to resignation_history_employee_resignations_path
    else
      redirect_to resignation_history_manager_self_services_path
    end
  end

  def final_approve
    @exit_interview_date = params[:employee_resignation] ? params[:employee_resignation][:exit_interview_date] : params[:exit_interview_date]
    @leaving_date = params[:employee_resignation] ? params[:employee_resignation][:leaving_date] : params[:leaving_date]
    @settled_on = params[:employee_resignation] ? params[:employee_resignation][:settled_on] : params[:settled_on]
    @employee_resignation = EmployeeResignation.find(params[:format])
    EmployeeResignation.where(id: @employee_resignation.id).update_all(exit_interview_date: @exit_interview_date,leaving_date: @leaving_date,settled_on: @settled_on)
    @employee_resignation.update(final_reporter_id: current_user.employee_id,is_final_approved: true,resign_status: "FinalApproved")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalApproved",change_date: Date.today)
    # EmployeeResignationMailer.no_second_reporter_approval_email_to_employee(@employee_resignation).deliver_now
    EmployeeResignationMailer.final_approval_email_to_employee(@employee_resignation).deliver_now
    if @employee_resignation.resign_status == "FinalApproved"
      flash[:notice] = 'Resignation Request Approved Successfully'
      redirect_to final_approval_emp_resignation_list_employee_resignations_path
    else
      flash[:notice] = 'Resignation Request Approved Successfully'
      redirect_to resignation_history_employee_resignations_path
    end
  end

  def final_approve_modal
    @employee_resignation = EmployeeResignation.find(params[:format])
  end

  def first_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    if @employee_resignation.employee.manager_2_id.nil?
      @employee_resignation.update(is_pending:false,is_first_rejected: true,is_final_rejected: true,resign_status: "Rejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "Rejected",change_date: Date.today)
      EmployeeResignationMailer.no_second_reporter_reject_email_to_employee(@employee_resignation).deliver_now
    else
       @employee_resignation.update(is_pending:false,is_first_rejected: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstRejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FirstRejected",change_date: Date.today)
      EmployeeResignationMailer.first_reject_email_to_employee(@employee_resignation).deliver_now
    end
    flash[:alert] = 'Resignation Request Rejected Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def second_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(is_second_rejected: true,resign_status: "SecondRejected")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondRejected",change_date: Date.today)
    EmployeeResignationMailer.second_reject_email_to_employee(@employee_resignation).deliver_now
    flash[:notice] = 'Resignation Request Rejected Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def final_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(final_reporter_id: current_user.employee_id,is_final_rejected: true,resign_status: "FinalRejected")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalRejected",change_date: Date.today)
    EmployeeResignationMailer.final_reject_email_to_employee(@employee_resignation).deliver_now
    flash[:notice] = 'Resignation Request Rejected Successfully'
    redirect_to final_approval_emp_resignation_list_employee_resignations_path
  end

  def final_approval_emp_resignation_list
    # @employee_resignations = EmployeeResignation.where("(resign_status = ? or resign_status = ?)","SecondApproved")
    @employee_resignations = EmployeeResignation.where("(resign_status = ?)","SecondApproved")
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  # def reject_employee_resignation
  #   @employee_resignation = EmployeeResignation.find(params[:format])
  #   @employee_resignation.update(resign_status: "Rejected")
  #   # ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: @employee_resignation.reporting_master_id, resignation_status: "Rejected")
  #   @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
  #   ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Rejected")
  #   ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
  #   EmployeeResignationMailer.reject_resignation_email(@employee_resignation).deliver_now

  #   flash[:alert] = 'Resignation Rejected'
  #   redirect_to resignation_history_employee_resignations_path
  # end

  # def send_request_to_higher_authority
  #   @employee_resignation = EmployeeResignation.find(params[:id])
  #   @employee_resignation.update(resign_status: "Approved & Send Next",reporting_master_id: params[:employee_resignation][:reporting_master_id])
  #   ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id])
  #   @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
  #   ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Approved & Send Next")
  #   ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
  #   EmployeeResignationMailer.approve_and_send_next(@employee_resignation).deliver_now
  #   flash[:notice] = 'Resignation Details Send to Higher Authority For Approval'
  #   redirect_to resignation_history_employee_resignations_path
  # end

  def cancel_resignation_request
     @employee_resignation = EmployeeResignation.find(params[:format])
     @employee_resignation.update(resign_status: "Cancelled",is_cancelled: true)
     ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "Cancelled",change_date: Date.today)
     # @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
     # ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Cancelled")
     # ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
     EmployeeResignationMailer.cancel_resignation_email_to_reporting_manager(@employee_resignation).deliver_now
     flash[:alert] = 'Resignation Request Cancelled'
     redirect_to employee_resignations_path
  end

  def emp_resignation_history
    # @employee_resignations = EmployeeResignation.group(:employee_id)
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employee_resignations = EmployeeResignation.group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'HOD'
        # byebug
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @employee_resignations = EmployeeResignation.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @employee_resignations = EmployeeResignation.where(employee_id: @employees).group(:employee_id)
      else current_user.role.name == 'Employee'
        @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  # def show_resignation_detail
  #   @employee_id = Employee.find(params[:format])
  #   @employee_resignation_id = EmployeeResignation.find(params[:resignation_id])
  #   @resignation_histories = ResignationHistory.where(employee_resignation_id: @employee_resignation_id.id)
  # end

  def modal_show_resignation_status_detail
    @employee_resignation = EmployeeResignation.find(params[:format])
    # byebug
    # @employee_resignation_id = EmployeeResignation.find(params[:resignation_id])
    @resignation_status_records = ResignationStatusRecord.where(employee_resignation_id: @employee_resignation.id)
    @employee_resignations = EmployeeResignation.where(id: @employee_resignation.id).take
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  # def show_resignation_detail
  #   @employee_resignation = EmployeeResignation.find(params[:format])
  #   @employee_resignations = EmployeeResignation.where(id: @employee_resignation.id)
  # end


  def edit_n_approve_modal
    @employee_resignation = EmployeeResignation.find(params[:format])
  end


  
  def edit_n_approve
    @employee_resignation = EmployeeResignation.find(params[:resignation_id])
    @reporting_master = ReportingMaster.find(@employee_resignation.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @resignation_history = ResignationHistory.new
    @employee_resignation = EmployeeResignation.find(params[:employee_resignation][:employee_resignation_id])
    
    @resignation_history.reporting_master_id = @employee_resignation.reporting_master_id
    @resignation_history.resignation_date = @employee_resignation.resignation_date
    @resignation_history.reason = @employee_resignation.reason
    @resignation_history.is_notice_period = @employee_resignation.is_notice_period
    @resignation_history.notice_period = @employee_resignation.notice_period
    @resignation_history.short_notice_period = @employee_resignation.short_notice_period
    @resignation_history.tentative_leaving_date = @employee_resignation.tentative_leaving_date
    @resignation_history.remark = @employee_resignation.remark
    @resignation_history.exit_interview_date = @employee_resignation.exit_interview_date
    @resignation_history.note = @employee_resignation.note
    @resignation_history.leaving_date = @employee_resignation.leaving_date
    @resignation_history.settled_on = @employee_resignation.settled_on
    @resignation_history.has_left = @employee_resignation.has_left
    @resignation_history.notice_served = @employee_resignation.notice_served
    @resignation_history.rehired = @employee_resignation.rehired
    @resignation_history.leaving_reason_id = @employee_resignation.leaving_reason_id
    @resignation_history.employee_resignation_id = @employee_resignation.id
                        
    @employee_resignation.update(leaving_reason_id: params[:employee_resignation][:leaving_reason_id],resignation_date: params[:employee_resignation][:resignation_date],notice_period: params[:employee_resignation][:notice_period],short_notice_period: params[:employee_resignation][:short_notice_period],tentative_leaving_date: params[:employee_resignation][:tentative_leaving_date],remark: params[:employee_resignation][:remark],exit_interview_date: params[:employee_resignation][:exit_interview_date],note: params[:employee_resignation][:note],leaving_date: params[:employee_resignation][:leaving_date],settled_on: params[:employee_resignation][:settled_on],is_stop_pay_request: params[:employee_resignation][:is_stop_pay_request],reason: params[:employee_resignation][:reason],resign_status: "Edit & Approved")
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id])
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Edit & Approved")
    ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id,resign_status: @employee_resignation.resign_status)
    redirect_to resignation_history_employee_resignations_path
    flash[:notice] = ' Request Edited And Approved Successfully.'   
    EmployeeResignationMailer.edit_and_approve(@employee_resignation).deliver_now

    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id], resignation_status: "Edit & Approved")
  end

  def edit_n_send_next_modal
    # byebug
    @employee_resignation = EmployeeResignation.find(params[:format])
    @reporting_master = ReportingMaster.find(@employee_resignation.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
  end 
  

  def edit_n_send
    # byebug
    @employee_resignation = EmployeeResignation.find(params[:resignation_id])
    @resignation_history = ResignationHistory.new
    @employee_resignation = EmployeeResignation.find(params[:employee_resignation][:employee_resignation_id])
    
    @resignation_history.reporting_master_id = @employee_resignation.reporting_master_id
    @resignation_history.resignation_date = @employee_resignation.resignation_date
    @resignation_history.reason = @employee_resignation.reason
    @resignation_history.employee_id = @employee_resignation.employee_id
    @resignation_history.is_notice_period = @employee_resignation.is_notice_period
    @resignation_history.notice_period = @employee_resignation.notice_period
    @resignation_history.short_notice_period = @employee_resignation.short_notice_period
    @resignation_history.tentative_leaving_date = @employee_resignation.tentative_leaving_date
    @resignation_history.remark = @employee_resignation.remark
    @resignation_history.exit_interview_date = @employee_resignation.exit_interview_date
    @resignation_history.note = @employee_resignation.note
    @resignation_history.leaving_date = @employee_resignation.leaving_date
    @resignation_history.settled_on = @employee_resignation.settled_on
    @resignation_history.has_left = @employee_resignation.has_left
    @resignation_history.notice_served = @employee_resignation.notice_served
    @resignation_history.rehired = @employee_resignation.rehired
    @resignation_history.leaving_reason_id = @employee_resignation.leaving_reason_id
    @resignation_history.employee_resignation_id = @employee_resignation.id
     # byebug                   
    # @employee_resignation.update(employee_id: params[:employee_resignation][:employee_id], reporting_master_id: params[:employee_resignation][:reporting_master_id],leaving_reason_id: params[:employee_resignation][:leaving_reason_id],resignation_date: params[:employee_resignation][:resignation_date],notice_period: params[:employee_resignation][:notice_period],short_notice_period: params[:employee_resignation][:short_notice_period],tentative_leaving_date: params[:employee_resignation][:tentative_leaving_date],remark: params[:employee_resignation][:remark],exit_interview_date: params[:employee_resignation][:exit_interview_date],note: params[:employee_resignation][:note],leaving_date: params[:employee_resignation][:leaving_date],settled_on: params[:employee_resignation][:settled_on],is_stop_pay_request: params[:employee_resignation][:is_stop_pay_request],reason: params[:employee_resignation][:reason],resign_status: "Edit & Send Next")
    @employee_resignation.update(reporting_master_id: params[:employee_resignation][:reporting_master_id],leaving_reason_id: params[:employee_resignation][:leaving_reason_id],resignation_date: params[:employee_resignation][:resignation_date],notice_period: params[:employee_resignation][:notice_period],short_notice_period: params[:employee_resignation][:short_notice_period],tentative_leaving_date: params[:employee_resignation][:tentative_leaving_date],remark: params[:employee_resignation][:remark],exit_interview_date: params[:employee_resignation][:exit_interview_date],note: params[:employee_resignation][:note],leaving_date: params[:employee_resignation][:leaving_date],settled_on: params[:employee_resignation][:settled_on],is_stop_pay_request: params[:employee_resignation][:is_stop_pay_request],reason: params[:employee_resignation][:reason],resign_status: "Edit & Send Next")
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id])
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Edit & Send Next")
    ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id,resign_status: @employee_resignation.resign_status)

    redirect_to resignation_history_employee_resignations_path
    flash[:notice] = ' Request Edited And Send Next Successfully.'   
    # ReportingMastersResign.create(reporting_master_id: @employee_resignation.reporting_master_id, employee_resignation_id: @employee_resignation.id, resignation_status: @employee_resignation.resign_status)

    EmployeeResignationMailer.edit_and_send_next(@employee_resignation).deliver_now

    # ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id], resignation_status: "Edit & Send Next")
  end


  def modal
    @employee_resignation = EmployeeResignation.find(params[:format])
  end

  def send_email_to_reporting_manager
  end

  def display_notice_period
    @employee = Employee.find(params[:id])
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @notice_period = @joining_detail.notice_period_after_probation
  end

  def all_employee_resignation_list
    @employee = Employee.find(params[:emp_id])
    @employee_resignations = EmployeeResignation.where(employee_id: @employee.id)
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  def final_approved_list
    @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved")
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  def confirm_resignation
     @employee_resignation = EmployeeResignation.find(params[:format])
     JoiningDetail.where(employee_id: @employee_resignation.employee_id).update_all(leaving_date: @employee_resignation.leaving_date)
     Employee.where(id: @employee_resignation.employee_id).update_all(status: "Inactive")
     redirect_to final_approved_list_employee_resignations_path
     flash[:notice] = 'Resignation Request Confirmed Successfully.'   
  end

  def cancel_resignation_list
    @employee_resignations = EmployeeResignation.where(employee_id: current_user.employee_id,resign_status: "Pending")
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  def modal_resignation_detail
    @employee_resignation = EmployeeResignation.find(params[:format])
  end

  def list_for_settelment
    @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved",settled_on: nil)
  end

  def settelment_date
    @emp_resig = EmployeeResignation.find(params[:format])
  end

  def settelment_date_create
    @emp_resig = EmployeeResignation.find(params[:resignation_id])
    @settled_on = params[:employee_resignation][:settled_on]
    @emp_resig.update(settled_on: @settled_on)
    flash[:notice] = 'Created Successfully!'
    redirect_to list_for_settelment_employee_resignations_path
  end

  def first_approve_update_dates
    @employee_resignation = EmployeeResignation.find(params[:resignation_id])
    @exit_interview_date = params[:employee_resignation][:exit_interview_date]
    @leaving_date = params[:employee_resignation][:leaving_date]
    @employee_resignation.update(exit_interview_date: @exit_interview_date,leaving_date: @leaving_date,resign_status: "FirstApproved")
    flash[:notice] = 'Updated Successfully!'
    redirect_to final_approval_emp_resignation_list_employee_resignations_path
  end

  def update_dates
    @employee_resignation = EmployeeResignation.find(params[:resignation_id])
    @exit_interview_date = params[:employee_resignation][:exit_interview_date]
    @leaving_date = params[:employee_resignation][:leaving_date]
    @employee_resignation.update(exit_interview_date: @exit_interview_date,leaving_date: @leaving_date,resign_status: "FinalApproved")
    flash[:notice] = 'Updated Successfully!'
    redirect_to final_approval_emp_resignation_list_employee_resignations_path
  end

  def collect_date
    resignation_date = params[:resignation_date]
    todays_date = Date.today
    d = todays_date.to_date - resignation_date.to_date
    age = d.to_i/365
    @age = age
  end

  def exit_interview_employee_list
    @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved")
  end

  def exit_interview
    @employee = params[:employee_id]
    @question_master = QuestionMaster.all
     @question_master.each do |qc|
    ExitInterview.create(question_master_id: qc.id,employee_id: @employee)

  end
    @employee_resignations = EmployeeResignation.where(employee_id: @employee,resign_status: "FinalApproved")
    @employee_resignations.update_all(exit_interview_status: true)
    flash[:notice] = "Created Successfully"
    redirect_to exit_interview_employee_list_employee_resignations_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee_resignation
    @employee_resignation = EmployeeResignation.find(params[:id])
  end

  def resignation_history_params
    params.require(:resignation_history).permit(:employee_id,:employee_resignation_id,:reporting_master_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired , :leaving_reason_id,:resign_status)
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_resignation_params
    params.require(:employee_resignation).permit(:employee_id, :resign_status,:application_date,:reporting_master_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired , :leaving_reason_id, :is_stop_pay_request,:exit_interview_status)
  end
end