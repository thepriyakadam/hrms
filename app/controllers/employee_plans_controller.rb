class EmployeePlansController < ApplicationController
  before_action :set_employee_plan, only: [:show, :edit, :update, :destroy]

  # GET /employee_plans
  # GET /employee_plans.json
  def index
    # @employee_plan = EmployeePlan.new

    @employee_plans = EmployeePlan.where(employee_id: current_user.employee_id)
  end

  # GET /employee_plans/1
  # GET /employee_plans/1.json
  def show
  end

  # GET /employee_plans/new
  def new
    @employee_plan = EmployeePlan.new
    session[:active_tab] ="MeetingPlan"
    session[:active_tab1] ="Process"
  end

  # GET /employee_plans/1/edit
  def edit
  end

  def minutes_form
    @meeting_minute = MeetingMinute.new
  end

  def create
    @employee_plan = EmployeePlan.all
    @employee_plan = @employee_plan.check_availability(current_user, params[:employee_plan][:from_date], params[:employee_plan][:to_date], params[:employee_plan][:from_time], params[:employee_plan][:to_time])
    if @employee_plan == true
      flash[:alert] = 'Sorry..!! This Time was already reserved...'
      redirect_to employee_plans_url
    else
      @employee_plan = EmployeePlan.new(employee_plan_params)
      respond_to do |format|
        if @employee_plan.save
          format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully created.' }
          format.json { render :show, status: :created, location: @employee_plan }
        else
          format.html { render :new }
          format.json { render json: @employee_plan.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def arrange_meeting
    @employee_plan = EmployeePlan.new
    session[:active_tab] ="ManagerSelfService"
  end

  def ajax_employee_plan_details
    @employee_plans = EmployeePlan.find(params[:id])
  end

  def employee_wise_report
    session[:active_tab] ="MeetingPlan"
    session[:active_tab1] ="MeetingReport"
  end

  def gps_tracking
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def employee_gps_tracking
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    @employee = Employee.find(emp_id)
    @employee_plan = EmployeeLocationHistory.where(employee_id: emp_id)
    if from_date.present? && !to_date.present?
      @emp_report = EmployeeLocationHistory.where("date >= ? and employee_id =?", from_date.to_date, emp_id).order("date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeeLocationHistory.where("date <= ? and employee_id =?", to_date.to_date, emp_id).order("date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeeLocationHistory.where(date:  from_date.to_date..to_date.to_date, employee_id: emp_id).order("date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present?
      @emp_report = EmployeeLocationHistory.where("employee_id =?", emp_id).order("date DESC")
    end

    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/employee_gps_tracking_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'employee_gps_tracking_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/employee_gps_tracking_pdf.pdf.erb',
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

  def employee_report_data
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    @employee = Employee.find(emp_id)
    @employee_plan = EmployeePlan.where(employee_id: emp_id)
    if from_date.present? && !to_date.present?
      @emp_report = EmployeePlan.where("from_date >= ? and employee_id =?", from_date.to_date, emp_id).order("from_date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where("to_time <= ? and employee_id =?", to_date.to_date, emp_id).order("from_date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where(from_date:  from_date.to_date..to_date.to_date, employee_id: emp_id).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where("employee_id =?", emp_id).order("from_date DESC")
    end

    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_employee_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_employee_wise_report_pdf.pdf.erb',
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

  def manager_wise_report
    session[:active_tab] = "MeetingPlan"
    session[:active_tab1] = "MeetingReport"
    # session[:active_tab1] = "travelrequestreports"
  end

  def manager_report
    @emp_plan = EmployeePlan.all
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    if from_date.present? && !to_date.present?
      @emp_report = EmployeePlan.where("from_date >= ? and manager_id =?", from_date.to_date, emp_id).order("from_date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where("to_time <= ? and manager_id =?", to_date.to_date, emp_id).order("from_date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where(from_date:  from_date.to_date..to_date.to_date, manager_id: emp_id).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present? 
      @emp_report = EmployeePlan.where("manager_id =?", emp_id).order("from_date DESC")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_manager_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_manager_wise_report_pdf.pdf.erb',
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

  def company_wise_report
    session[:active_tab] = "MeetingPlan"
    session[:active_tab1] = "MeetingReport"

  end

  def company_report
    @emp_plan = EmployeePlan.all
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    listed_company = params[:employee_plan] ? params[:employee_plan][:listed_company_id] : params[:listed_company_id]
    if from_date.present? && !to_date.present?
      @emp_report = EmployeePlan.where("from_date >= ? and listed_company_id =?", from_date.to_date, listed_company).order("from_date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where("to_time <= ? and listed_company_id =?", to_date.to_date, listed_company).order("from_date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where(from_date: from_date.to_date..to_date.to_date, listed_company_id: listed_company).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && listed_company.present? 
      @emp_report = EmployeePlan.where("listed_company_id =?", listed_company).order("from_date DESC")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_company_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_company_wise_report_pdf.pdf.erb',
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

  def status_wise_report
    session[:active_tab] = "MeetingPlan"
    session[:active_tab1] = "MeetingReport"
  end

  def status_report
    @emp_plan = EmployeePlan.all
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    current_status = params[:employee_plan] ? params[:employee_plan][:current_status] : params[:current_status]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    if from_date.present? && !to_date.present? && !emp_id.present?
      @emp_report = EmployeePlan.where("from_date >= ? and current_status =? ", from_date.to_date, current_status).order("from_date DESC")
    end
    if from_date.present? && !to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where("from_date >= ? and current_status =? and employee_id =?", from_date.to_date, current_status, emp_id).order("from_date DESC")
    end
    if !from_date.present? && to_date.present? && !emp_id.present?
      @emp_report = EmployeePlan.where("to_time <= ? and current_status =?", to_date.to_date, current_status).order("from_date DESC")
    end
    if !from_date.present? && to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where("to_time <= ? and current_status =? and employee_id =?", to_date.to_date, current_status, emp_id).order("from_date DESC")
    end
    if from_date.present? && to_date.present? && !emp_id.present?
      @emp_report = EmployeePlan.where(from_date: from_date.to_date..to_date.to_date, current_status: current_status).order("from_date DESC")
    end
    if from_date.present? && to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where(from_date: from_date.to_date..to_date.to_date, current_status: current_status, employee_id: emp_id).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && current_status.present? && !emp_id.present?
      @emp_report = EmployeePlan.where("current_status =?", current_status).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && current_status.present? && emp_id.present?
      @emp_report = EmployeePlan.where("current_status =? and employee_id =?", current_status, emp_id).order("from_date DESC")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_status_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_status_wise_report_pdf.pdf.erb',
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

  def meeting_minutes_history
    session[:active_tab] = "MeetingPlan"
    session[:active_tab1] = "MeetingReport"
  end

  def meeting_minutes_history_report
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    @employee = Employee.find(emp_id)
    @employee_plan = EmployeePlan.where(employee_id: emp_id)
    if from_date.present? && !to_date.present?
      @emp_report = EmployeePlan.where("from_date >= ? and employee_id =?", from_date.to_date, emp_id).order("from_date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where("to_time <= ? and employee_id =?", to_date.to_date, emp_id).order("from_date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where(from_date:  from_date.to_date..to_date.to_date, employee_id: emp_id).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where("employee_id =?", emp_id).order("from_date DESC")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_employee_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_employee_wise_report_pdf.pdf.erb',
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
  
  def plan_meeting_minutes
    plan_id = params[:plan_id]
    @employee_plan = EmployeePlan.find(plan_id)
    @emp_minutes = MeetingMinute.where(employee_plan_id: plan_id)
    @all_minutes = []
    if @emp_minutes.present?
      @emp_minutes.each do |m|
        @minut = m.minutes
        @all_minutes << @minut
      end
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/plan_meeting_minutes_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/plan_meeting_minutes_pdf.pdf.erb',
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

  def meeting_follow_up

    session[:active_tab] = "MeetingPlan"
    session[:active_tab1] = "Process"
  end

  def meeting_follow_up_report
    from_date = params[:employee_plan] ? params[:employee_plan][:from_date] : params[:from_date]
    to_date = params[:employee_plan] ? params[:employee_plan][:to_date] : params[:to_date]
    emp_id = params[:employee_plan] ? params[:employee_plan][:employee_id] : params[:employee_id]
    @employee = Employee.find(emp_id)
    @employee_plan = EmployeePlan.where(employee_id: emp_id)
    if from_date.present? && !to_date.present?
      @emp_report = EmployeePlan.where("from_date >= ? and employee_id =?", from_date.to_date, emp_id).where.not(start_time: nil?).order("from_date DESC")
    end
    if !from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where("to_time <= ? and employee_id =?", to_date.to_date, emp_id).where.not(start_time: nil?).order("from_date DESC")
    end
    if from_date.present? && to_date.present?
      @emp_report = EmployeePlan.where(from_date:  from_date.to_date..to_date.to_date, employee_id: emp_id).where.not(start_time: nil?).order("from_date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present?
      @emp_report = EmployeePlan.where("employee_id =?", emp_id).where.not(start_time: nil?).order("from_date DESC")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/print_employee_wise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/print_employee_wise_report_pdf.pdf.erb',
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
  # PATCH/PUT /employee_plans/1
  # PATCH/PUT /employee_plans/1.json

   def update
  #   @employee_plan = EmployeePlan.all
  #   @employee_plan = @employee_plan.check_availability(current_user, params[:employee_plan][:from_date], params[:employee_plan][:to_date], params[:employee_plan][:from_time], params[:employee_plan][:to_time])
  #   if @employee_plan == true
  #     flash[:alert] = 'Sorry..!! This Time was already reserved...'
  #     redirect_to employee_plans_url
  #   else
  #     @employee_plan = EmployeePlan.new(employee_plan_params)
      respond_to do |format|
        if @employee_plan.update(employee_plan_params)
          format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully created.' }
          format.json { render :show, status: :created, location: @employee_plan }
        else
          format.html { render :new }
          format.json { render json: @employee_plan.errors, status: :unprocessable_entity }
        end
      end
    # end
  end


  def meeting_plan_approval
    @employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: current_user.employee_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def view_plan
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
  end  
  
  def plan_approve
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: "Approved", status: "true", confirm: "true")
    redirect_to meeting_plan_approval_employee_plans_path
  end

  def plan_reject
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: "Rejected", status: "false", confirm: "false")
    redirect_to meeting_plan_approval_employee_plans_path
  end

  def employee_feedback
    emp_paln_id = params[:format]
    @employee_plan = EmployeePlan.find(emp_paln_id)
    @emp_minutes = MeetingMinute.where(employee_plan_id: emp_paln_id)
  end

  def start_meeting
  end

  def end_meeting
    emp_paln_id = params[:format]
    emp_plan = EmployeePlan.find_by_id(emp_paln_id)
    emp_plan.update(end_date: Time.now.to_date, end_time: Time.now.to_time)
    redirect_to employee_feedback_employee_plans_path(emp_paln_id)
    flash[:notice] = 'Meeting Successfully End..!!'
  end

  def feedback
    plan_id = params[:employee_plan_id]
    feedback = params[:employee_plan][:feedback]
    emp_plan = EmployeePlan.find(plan_id)
    emp_feedback = emp_plan.update(feedback: feedback)
    flash[:notice] = 'Feedback Successfully Updated'
    redirect_to employee_plans_path
  end

  def employee_reason
    @employee_plan = EmployeePlan.find(params[:format])
  end

  def reason
    plan_id = params[:employee_plan_id]
    reason_id = params[:plan_reason_master_id]
    reason = params[:employee_plan][:feedback]
    emp_plan = EmployeePlan.find(plan_id)
    emp_feedback = emp_plan.update(feedback: reason, plan_reason_master_id: reason_id)
    flash[:notice] = 'Plan Reason Successfully Updated'
    redirect_to employee_plans_path
  end

  def meeting_follow_up_record
    @emp_plan = EmployeePlan.find_by_id(params[:plan_id])
    @emp_minutes = MeetingMinute.where(employee_plan_id: params[:plan_id])
    @meeting_follow_up = MeetingFollowUp.where(employee_plan_id: params[:plan_id])
    respond_to do |format|
      format.js
      format.xls {render template: 'employee_plans/meeting_follow_up_record_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'meeting_follow_up_record_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'employee_plans/meeting_follow_up_record_pdf.pdf.erb',
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

  def follow_up_record_form
    @meeting_follow_up = MeetingFollowUp.new
  end

  # DELETE /employee_plans/1
  # DELETE /employee_plans/1.json
  def destroy
    @employee_plan.update(current_status: "Cancelled", status: "false", confirm: "false")
    respond_to do |format|
      format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal_employee_plan_detail
    @employee_plan = EmployeePlan.find(params[:format])
  end

  def employee_plan_detail_list
    @employee_plans = EmployeePlan.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_plan
      @employee_plan = EmployeePlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_plan_params
      params.require(:employee_plan).permit(:employee_id, :plan_or_unplan, :listed_company_id, :from_date, :to_date, :from_time, :to_time, :meeting_with, :location, :meeting_agenda, :lat, :lng, :confirm, :status, :current_status, :manager_id, :latitude, :longitude, :plan_reason_master_id, :feedback, :start_latitude, :end_latitude, :created_latitude, :start_longitude, :end_longitude, :created_longitude, :start_place, :end_place, :created_place, :created_date, :created_time)
    end
end
