require 'query_report/helper'  # need to require the helper
class IssueRequestsController < ApplicationController
  before_action :set_issue_request, only: [:show, :edit, :update, :destroy]
   include QueryReport::Helper  # need to include it

  # GET /issue_requests
  # GET /issue_requests.json
  def index
    @issue_requests = IssueRequest.all
  end

  # GET /issue_requests/1
  # GET /issue_requests/1.json
  def show
  end

  # GET /issue_requests/new
  def new
    @issue_request = IssueRequest.new
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess" 
  end

  # GET /issue_requests/1/edit
  def edit
  end


  # POST /issue_requests
  # POST /issue_requests.json


  def create
   @issue_request = IssueRequest.new(issue_request_params)
    respond_to do |format|
      if @issue_request.save
        IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,status: @issue_request.status,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority)
        IssueRequestMailer.issue_tracker_group_email(@issue_request).deliver_now
        format.html { redirect_to @issue_request, notice: 'Issue request was successfully saved Successfully.' }
        format.json { render :show, status: :created, location: @issue_request }
      else
        format.html { render :new }
        format.json { render json: @issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_requests/1
  # PATCH/PUT /issue_requests/1.json
  def update
    respond_to do |format|
      if @issue_request.update(issue_request_params)
         # IssueHistory.create(issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,status: @issue_request.status,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority)
        format.html { redirect_to @issue_request, notice: 'Issue request was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_request }
      else
        format.html { render :edit }
        format.json { render json: @issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_requests/1
  # DELETE /issue_requests/1.json
  def destroy
    @issue_request.destroy
    respond_to do |format|
      format.html { redirect_to issue_requests_url, notice: 'Issue request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  def is_confirm
    @issue_request = IssueRequest.find(params[:issue_request])
    IssueRequest.find(@issue_request.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_request_path
  end

  def download_screenshot
    # byebug
    @issue_request = IssueRequest.find(params[:id])
    send_file @issue_request.document1.path,
              filename: @issue_request.document1_file_name,
              type: @issue_request.document1_content_type,
              disposition: 'attachment'
  end

  def download_screenshot_image
    @issue_request = IssueRequest.find(params[:id])
    send_file @issue_request.document2.path,
              filename: @issue_request.document2_file_name,
              type: @issue_request.document2_content_type,
              disposition: 'attachment'
  end

  def lock_request_list
    @issue_tracker_member = IssueTrackerMember.where(employee_id: current_user.employee_id)
    @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: current_user.employee_id)
    @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_member_id.issue_tracker_group_id,status: nil)
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess"   
 end

   def modal
    @issue_request = IssueRequest.find(params[:format])
  end

  def lock_request
     @issue_request = IssueRequest.find(params[:id])
     @issue_tracker_member = params[:issue_request][:issue_tracker_member_id]
     IssueRequest.where(id: @issue_request.id).update_all(issue_tracker_member_id: @issue_tracker_member)
     @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: current_user.employee_id)
     @c1=IssueLocker.create(lock_time: params[:issue_request][:lock_time],lock_date: params[:issue_request][:lock_date],issue_request_id: @issue_request.id,status: true,issue_tracker_member_id: @issue_tracker_member)
     IssueLockerHistory.create(lock_time: params[:issue_request][:lock_time],lock_date: params[:issue_request][:lock_date],issue_tracker_member_id: @issue_tracker_member,issue_locker_id: @c1.id,issue_request_id: @issue_request.id,status: true)

     flash[:notice] = "Issue Request Locked Successfully"
     redirect_to lock_request_list_issue_requests_path
  end


  def coordinator_lock_request
    @issue_request = IssueRequest.find(params[:id])
    lock_date = params[:lock_date]
    lock_time = params[:lock_time]
    @issue_tracker_member = IssueTrackerMember.where(employee_id: current_user.employee_id).take
    IssueRequest.where(id: @issue_request.id).update_all(issue_tracker_member_id: @issue_tracker_member.id)
    @c1=IssueLocker.create(lock_date: lock_date,lock_time: lock_time,issue_request_id: @issue_request.id,status: true)
    IssueLockerHistory.create(lock_date: lock_date,lock_time: lock_time,issue_locker_id: @c1.id,issue_request_id: @issue_request.id,status: true)
    flash[:notice] = "Issue Request by Co-ordinator Locked Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def unlock_request
    @issue_request = IssueRequest.find(params[:format])
    @issue_request.update(issue_tracker_member_id: nil,status: nil)
    @issue_locker = IssueLocker.where(issue_request_id: @issue_request.id).take
    IssueLocker.where(issue_request_id: @issue_request.id).update_all(status: false)
    IssueLockerHistory.create(issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_locker_id: @issue_locker.id,issue_request_id: @issue_request.id,status: false)
    flash[:notice] = "Issue Request Unlocked Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def solved_request
    @issue_request = IssueRequest.find(params[:id])
    @issue_request.update(status: true,issue_root_cause_id: params[:issue_request][:issue_root_cause_id],comment: params[:issue_request][:comment],time: params[:issue_request][:time])
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: true)
    flash[:notice] = "Issue Request Solved Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def modal1
    @issue_request = IssueRequest.find(params[:format])
  end

  def solved_issues
    @issue_requests = IssueRequest.where(status: true, employee_id: current_user.employee_id)
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess"
  end

  def issue_history
     @issue_tracker_member = IssueTrackerMember.find_by_employee_id(current_user.employee_id)
  end
  
  def solved_confirm
    @issue_request = IssueRequest.find(params[:format])
    @issue_request.update(is_complete: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to solved_issues_issue_requests_path
  end

  def resend_request
    @issue_request = IssueRequest.find(params[:format])
    IssueRequest.where(id: @issue_request.id).update_all(status: nil,issue_tracker_member_id: nil) 
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: false)
    IssueRequestMailer.issue_resend(@issue_request).deliver_now
    flash[:notice] = "Resend Request Successfully"
    redirect_to solved_issues_issue_requests_path
  end

  def search_by_date
    reporter(IssueRequest.filter_records(current_user), template_class: PdfReportTemplate) do
    filter :date, type: :date
    column(:Request_ID, sortable: true) { |issue_request| issue_request.id }
    column(:ID, sortable: true) { |issue_request| issue_request.employee.try(:manual_employee_code) }
    column(:Employee_Name, sortable: true) { |issue_request| full_name(issue_request.employee) }
    column(:Date, sortable: true) { |issue_request| issue_request.date }
    column(:Group, sortable: true) { |issue_request| issue_request.try(:issue_tracker_group).try(:name) }
    end
  end

   def search_by_group
    reporter(IssueRequest.filter_records(current_user), template_class: PdfReportTemplate) do
    filter :issue_tracker_group_id, type: :integer
    column(:Request_ID, sortable: true) { |issue_request| issue_request.id }
    column(:ID, sortable: true) { |issue_request| issue_request.employee.try(:manual_employee_code) }
    column(:Employee_Name, sortable: true) { |issue_request| full_name(issue_request.employee) }
    column(:Date, sortable: true) { |issue_request| issue_request.date }
    column(:Group, sortable: true) { |issue_request| issue_request.try(:issue_tracker_group).try(:name) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_request
      @issue_request = IssueRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_request_params
      params.require(:issue_request).permit(:issue_root_cause_id,:effort_time,:is_complete,:issue_master_id, :issue_tracker_member_id, :issue_tracker_group_id, :description, :date, :time, :employee_id, :issue_priority, :status, :document1, :document2)
    end
end