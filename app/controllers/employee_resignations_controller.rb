class EmployeeResignationsController < ApplicationController
  before_action :set_employee_resignation, only: [:show, :edit, :update, :destroy]

  # GET /employee_resignations
  # GET /employee_resignations.json
  def index
    respond_to do |format|
      format.html
      format.csv { send_data @employee_resignations.to_csv }
      format.xls
      @employee_resignations = EmployeeResignation.where("(resign_status = ? or resign_status = ?)","Pending","Cancelled")
    end
  
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


  # def create
  #   @employee_resignation = EmployeeResignation.new(employee_resignation_params)
  #   @employee_resignation.resign_status = "Pending"
  #   respond_to do |format|
  #     if @employee_resignation.save
  #        # ReportingMastersResign.create(reporting_master_id: @employee_resignation.reporting_master_id, employee_resignation_id: @employee_resignation.id)
  #        # ResignationHistory.create(employee_resignation_id: @employee_resignation.id,resign_status: @employee_resignation.resign_status,employee_id: @employee_resignation.employee_id,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)

  #        byebug
  #        employees=Employee.where(employee_id: @employee_resignation.employee_id)
         
  #       EmployeeResignation.where(id: @employee_resignation.id).update_all(reporting_master_id: e.manager_id)
     
         
  #        EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now
  #       format.html { redirect_to @employee_resignation, notice: 'Employee Resignation created successfully.' }
  #       format.json { render :show, status: :created, location: @employee_resignation }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @employee_resignation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def create
    @employee_resignation = EmployeeResignation.new(employee_resignation_params)
    @employee_resignation.resign_status = "Pending"
      @employee_resignation.save
        # @employee_resignation = EmployeeResignation.new
        # byebug
        @employees=Employee.where(id: @employee_resignation.employee_id)
        @employees.each do |e|
          # byebug
          if e.manager_id.present?
           EmployeeResignation.where(id: @employee_resignation.id).update_all(reporting_master_id: e.manager_id,is_pending: true)
           ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "Pending",change_date: Date.today)
         else
        end
    end
      redirect_to employee_resignations_path
      flash[:notice] = 'Employee Resignation created successfully.'   
  end

  # PATCH/PUT /employee_resignations/1
  # PATCH/PUT /employee_resignations/1.json
   def update
    respond_to do |format|
      if @employee_resignation.update(employee_resignation_params)
        EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now
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
    # byebug
    @pending_resignation_requests = EmployeeResignation.where(is_pending: true, is_first_approved: nil,is_first_rejected: nil, is_cancelled: nil,reporting_master_id: current_user.employee_id)
    @first_approved_resignation_requests = EmployeeResignation.where(is_first_approved: true, is_second_approved: nil,is_second_rejected: nil, is_cancelled: nil,second_reporter_id: current_user.employee_id)
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

  def first_approve
    @employee_resignation = EmployeeResignation.find(params[:format])
    if @employee_resignation.employee.manager_2_id.nil?
      @employee_resignation.update(is_pending:nil,is_first_approved: true,is_final_approved: true,resign_status: "FinalApproved")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalApproved",change_date: Date.today)
    else
       @employee_resignation.update(is_pending:nil,is_first_approved: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstApproved")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FirstApproved",change_date: Date.today)
    end
    flash[:notice] = 'Resignation Request Approved Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def second_approve
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(is_second_approved: true,resign_status: "SecondApproved")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondApproved",change_date: Date.today)
    flash[:notice] = 'Resignation Request Approved Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def final_approve
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(final_reporter_id: current_user.employee_id,is_final_approved: true,resign_status: "FinalApproved")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalApproved",change_date: Date.today)
    flash[:notice] = 'Resignation Request Approved Successfully'
    redirect_to final_approval_emp_resignation_list_employee_resignations_path
  end

  def first_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    if @employee_resignation.employee.manager_2_id.nil?
      @employee_resignation.update(is_pending:nil,is_first_rejected: true,is_final_rejected: true,resign_status: "FinalRejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalRejected",change_date: Date.today)
    else
       @employee_resignation.update(is_pending:nil,is_first_rejected: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstRejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FirstRejected",change_date: Date.today)
    end
    flash[:alert] = 'Resignation Request Rejected Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def second_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(is_second_rejected: true,resign_status: "SecondRejected")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "SecondRejected",change_date: Date.today)
    flash[:notice] = 'Resignation Request Rejected Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def final_reject
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(final_reporter_id: current_user.employee_id,is_final_rejected: true,resign_status: "FinalRejected")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "FinalRejected",change_date: Date.today)
    flash[:notice] = 'Resignation Request Rejected Successfully'
    redirect_to final_approval_emp_resignation_list_employee_resignations_path
  end

  def final_approval_emp_resignation_list
    @employee_resignations = EmployeeResignation.where("(resign_status = ? or resign_status = ?)","SecondApproved","SecondRejected")
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation" 
  end

  def reject_employee_resignation
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(resign_status: "Rejected")
    # ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: @employee_resignation.reporting_master_id, resignation_status: "Rejected")
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Rejected")
    ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
    EmployeeResignationMailer.reject_resignation_email(@employee_resignation).deliver_now

    flash[:alert] = 'Resignation Rejected'
    redirect_to resignation_history_employee_resignations_path
  end

  def send_request_to_higher_authority
    @employee_resignation = EmployeeResignation.find(params[:id])
    @employee_resignation.update(resign_status: "Approved & Send Next",reporting_master_id: params[:employee_resignation][:reporting_master_id])
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id])
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Approved & Send Next")
    ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
    EmployeeResignationMailer.approve_and_send_next(@employee_resignation).deliver_now
    flash[:notice] = 'Resignation Details Send to Higher Authority For Approval'
    redirect_to resignation_history_employee_resignations_path
  end

  def cancel_resignation_request
     @employee_resignation = EmployeeResignation.find(params[:format])
     @employee_resignation.update(resign_status: "Cancelled",is_cancelled: true)
     ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: current_user.employee_id,status: "Cancelled",change_date: Date.today)
     # @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
     # ReportingMastersResign.where(reporting_master_id: @reporting_masters,employee_resignation_id: @employee_resignation.id).update_all(resignation_status: "Cancelled")
     # ResignationHistory.create(employee_resignation_id: @employee_resignation.id,employee_id: @employee_resignation.employee_id,resign_status: @employee_resignation.resign_status,reporting_master_id: @employee_resignation.reporting_master_id,resignation_date: @employee_resignation.resignation_date,reason: @employee_resignation.reason,is_notice_period: @employee_resignation.is_notice_period,notice_period: @employee_resignation.notice_period,short_notice_period: @employee_resignation.short_notice_period,tentative_leaving_date: @employee_resignation.tentative_leaving_date,remark: @employee_resignation.remark,exit_interview_date: @employee_resignation.exit_interview_date,note: @employee_resignation.note,leaving_date: @employee_resignation.leaving_date,settled_on: @employee_resignation.settled_on,has_left: @employee_resignation.has_left,notice_served: @employee_resignation.notice_served,rehired: @employee_resignation.rehired,leaving_reason_id: @employee_resignation.leaving_reason_id)
     # EmployeeResignationMailer.approve_resignation_email(@employee_resignation).deliver_now
     flash[:alert] = 'Resignation Request Cancelled'
     redirect_to employee_resignations_path
  end

  def emp_resignation_history
    @employee_resignations = EmployeeResignation.all
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  def show_resignation_detail
    @employee_id = Employee.find(params[:emp_id])
    @employee_resignation_id = EmployeeResignation.find(params[:resignation_id])
    @resignation_histories = ResignationHistory.where(employee_resignation_id: @employee_resignation_id.id)
  end


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
    @notice_period = @joining_detail.notice_period
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
    params.require(:employee_resignation).permit(:employee_id, :resign_status,:application_date,:reporting_master_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired , :leaving_reason_id, :is_stop_pay_request)
  end
end
