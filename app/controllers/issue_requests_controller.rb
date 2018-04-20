
# require 'query_report/helper'  # need to require the helper
class IssueRequestsController < ApplicationController
  before_action :set_issue_request, only: [:show, :edit, :update, :destroy]
   # include QueryReport::Helper  # need to include it

  # GET /issue_requests
  # GET /issue_requests.json
  def index
    @issue_requests = IssueRequest.where(employee_id: current_user.employee_id)
     session[:active_tab] = "HelpDesk"
     session[:active_tab1] = "Process"
  end

  # GET /issue_requests/1
  # GET /issue_requests/1.json
  def show
     @issue_request = IssueRequest.find(params[:id])
  end

  # GET /issue_requests/new
  def new
    @issue_request = IssueRequest.new
    @issue_requests = IssueRequest.where(employee_id: current_user.employee_id)
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "Process"
  end

  # GET /issue_requests/1/edit
  def edit
  end


  # POST /issue_requests
  # POST /issue_requests.json


  def create
     # byebug
   @issue_request = IssueRequest.new(issue_request_params)

    respond_to do |format|
      if @issue_request.save
        # byebug
        IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,status: @issue_request.status,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority)
        @c1 = IssueTrackerGroup.where(id: @issue_request.issue_tracker_group_id).pluck(:id)
        @c2 = IssueTrackerMember.where(issue_tracker_group_id: @c1).pluck(:employee_id)
        @emp = Employee.where(id: @c2)
        @emp.each do |s|
        # IssueRequestMailer.issue_tracker_group_email(s.email).deliver_now
        IssueRequestMailer.issue_tracker_group_email(s.email, @issue_request, @c1, @c2).deliver_now
        end
        format.html { redirect_to new_issue_request_path, notice: 'Support request was successfully saved Successfully.' }
        format.json { render :show, status: :created, location: @issue_request }
      else
        format.html { render :new }
        format.json { render json: @issue_request.errors, status: :unprocessable_entity }  
      end
    end
  end


  def select_description
    @issue_master_id = IssueMaster.find(params[:issue_master_id])
    @issue_master = IssueMaster.find_by(id: @issue_master_id)
    @des = @issue_master.description
  end

  # PATCH/PUT /issue_requests/1
  # PATCH/PUT /issue_requests/1.json
  def update
    respond_to do |format|
      if @issue_request.update(issue_request_params)
         # IssueHistory.create(issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,status: @issue_request.status,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority)
        format.html { redirect_to @issue_request, notice: 'Support request was successfully updated.' }
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
      format.html { redirect_to issue_requests_url, notice: 'Support request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_detail_modal
    @issue_request = IssueRequest.find(params[:issue_request_id])
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
    # path = params[:to]
    # render path
    # render 'show'
  end

  def download_screenshot_image
    @issue_request = IssueRequest.find(params[:id])
    send_file @issue_request.document2.path,
              filename: @issue_request.document2_file_name,
              type: @issue_request.document2_content_type,
              disposition: 'attachment'
    # path = params[:to]
    # render path
    # render 'show'
  end

  def lock_request_list 
    # byebug
    if @issue_tracker_member = IssueTrackerMember.where(employee_id: current_user.employee_id)
    if @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: current_user.employee_id)
    @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_member_id.issue_tracker_group_id,status: nil)   
    
    else
      flash[:alert] = "You are not member of any group"
      redirect_to root_url
    end
    end
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "Process"
  end

  def solved_issue_list
    if @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: current_user.employee_id)
      @solved_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_member_id.issue_tracker_group_id,status: true)
      #redirect_to solved_issue_list_issue_requests_path
    else
      flash[:alert] = "You are not member of any group"
      redirect_to root_url
      #redirect_to solved_issue_list_issue_requests_path
    end
  end

  def modal
    @issue_request = IssueRequest.find(params[:format])
  end

  def lock_request
    # byebug
     @issue_request = IssueRequest.find(params[:id])
     @issue_tracker_member = params[:issue_request][:issue_tracker_member_id]
     IssueRequest.where(id: @issue_request.id).update_all(issue_tracker_member_id: @issue_tracker_member)
     @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: current_user.employee_id)
     @c1=IssueLocker.create(lock_time: params[:issue_request][:lock_time],lock_date: params[:issue_request][:lock_date],issue_request_id: @issue_request.id,status: true,issue_tracker_member_id: @issue_tracker_member)
     IssueLockerHistory.create(lock_time: params[:issue_request][:lock_time],lock_date: params[:issue_request][:lock_date],issue_tracker_member_id: @issue_tracker_member,issue_locker_id: @c1.id,issue_request_id: @issue_request.id,status: true)

     flash[:notice] = "Support Request Locked Successfully"
     redirect_to lock_request_list_issue_requests_path
  end


  def coordinator_lock_request
    # byebug
    @issue_request = IssueRequest.find(params[:id])
    lock_date = params[:lock_date]
    lock_time = params[:lock_time]
    @issue_tracker_member = IssueTrackerMember.where(employee_id: current_user.employee_id).take
    IssueRequest.where(id: @issue_request.id).update_all(issue_tracker_member_id: @issue_tracker_member.id)
    @c1=IssueLocker.create(lock_date: lock_date,lock_time: lock_time,issue_request_id: @issue_request.id,status: true)
    IssueLockerHistory.create(lock_date: lock_date,lock_time: lock_time,issue_locker_id: @c1.id,issue_request_id: @issue_request.id,status: true)
    flash[:notice] = "Support Request by Co-ordinator Locked Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def unlock_request
    @issue_request = IssueRequest.find(params[:format])
    @issue_request.update(issue_tracker_member_id: nil,status: nil)
    @issue_locker = IssueLocker.where(issue_request_id: @issue_request.id).take
    IssueLocker.where(issue_request_id: @issue_request.id).update_all(status: nil)
    IssueLockerHistory.create(issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_locker_id: @issue_locker.id,issue_request_id: @issue_request.id,status: nil)
    flash[:notice] = "Support Request Unlocked Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def solved_request
    @issue_request = IssueRequest.find(params[:id])
    @issue_request.update(status: true,issue_root_cause_id: params[:issue_request][:issue_root_cause_id],comment: params[:issue_request][:comment],time: params[:issue_request][:time],effort_time: params[:issue_request][:effort_time])
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: true)
    flash[:notice] = "Support Request Solved Successfully"
    redirect_to lock_request_list_issue_requests_path
  end

  def modal1
    @issue_request = IssueRequest.find(params[:format])
  end

  def solved_issues
    @issue_requests = IssueRequest.where(status: true, employee_id: current_user.employee_id)
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "Process" 
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
    IssueRequest.where(id: @issue_request.id).update_all(status: nil,issue_tracker_member_id: nil,issue_root_cause_id: nil,effort_time: nil,comment: nil) 
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: nil)
    # IssueRequestMailer.issue_resend(@issue_request).deliver_now
    flash[:notice] = "Resend Request Successfully"
    redirect_to solved_issues_issue_requests_path
  end

  def issue_tracker_reports_xls
    # byebug
    @start = params[:date].to_date unless params[:date].nil?
    @en = params[:to_date].to_date unless params[:to_date].nil?
    @issue_tracker_group = IssueTrackerGroup.where(params[:id]).take
    unless @start.nil? or @en.nil?
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group,date: @start..@en)
    else
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group)
    end
    #  respond_to do |format|
    #  format.xls {render template: 'issue_requests/issue_tracker_reports_xls.xls.erb'}
    # end
  end

#   def group_report_list
#     # byebug
#     @start = params[:date].to_date
#     @en = params[:to_date].to_date
#     @issue_tracker_group = IssueTrackerGroup.find(params[:id])
#     @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group.id,date: @start..@en)

#   if @start == "" || @en == ""
#     @issue_tracker_group = IssueTrackerGroup.find(params[:id])
#     @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group.id)
#   else @issue_tracker_group == ""
#     @issue_tracker_group = IssueTrackerGroup.find(params[:id])
#     @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group.id,date: @start..@en)
#   end
# end

def group_report_list
    @start = params[:date].to_date unless params[:date].nil?
    @en = params[:to_date].to_date unless params[:to_date].nil?
    @issue_tracker_group = IssueTrackerGroup.find(params[:id])
    unless @start.nil? or @en.nil?
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group.id,date: @start..@en)
    else
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group.id)
    end
end

  def issue_tracker_pdf
    @start = params[:date].to_date unless params[:date].nil?
    @en = params[:to_date].to_date unless params[:to_date].nil?
    @issue_tracker_group = IssueTrackerGroup.where(params[:id]).take 
    unless @start.nil? or @en.nil?
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group,date: @start..@en)
    else
      @issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_group)
    end
      respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'issue_tracker_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'issue_requests/issue_tracker_pdf.pdf.erb',
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

   def groupwise_report
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "SupportReport" 
  end

  def datewise_report
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "SupportReport" 
  end

  def datewise_report_list
    @from = params[:issue_request][:from].to_date
    @to = params[:issue_request][:to].to_date
    @issue_requests = IssueRequest.where(date: @from..@to)
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "SupportReport" 
  end

  def datewise_report_xls
    @from = params[:from].to_date
    @to = params[:to].to_date
    @issue_requests = IssueRequest.where(date: @from..@to)
  end

  def datewise_report_pdf
    session[:active_tab] = "HelpDesk"
    session[:active_tab1] = "SupportReport" 
    @from = params[:from].to_date
    @to = params[:to].to_date
    @issue_requests = IssueRequest.where(date: @from..@to)
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'datewise_report_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'issue_requests/datewise_report_pdf.pdf.erb',
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

  def request_id_wise_list
    # byebug
    # @id = params[:issue_request_id][:id]
    @issue_request = IssueRequest.find(params[:id])
    @issue_requests = IssueRequest.where(id: @issue_request.id)
    @issue_locker_histories = IssueLockerHistory.where(issue_request_id: @issue_request.id)
  end

  def id_wise_report_xls
    @issue_request = IssueRequest.find(params[:issue_request_id])
    @issue_requests = IssueRequest.where(id: @issue_request.id)
    @issue_locker_histories = IssueLockerHistory.where(issue_request_id: @issue_request.id)
  end

  def id_wise_report_pdf
    @issue_request = IssueRequest.find(params[:issue_request_id])
    @issue_requests = IssueRequest.where(id: @issue_request.id)
    @issue_locker_histories = IssueLockerHistory.where(issue_request_id: @issue_request.id)
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'id_wise_report_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'issue_requests/id_wise_report_pdf.pdf.erb',
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

 def memberwise_report
  session[:active_tab] = "HelpDesk"
  session[:active_tab1] = "SupportReport" 
   
 end

def memberwise_report_list
      # byebug
     @from = params[:issue_request][:from]
     @to = params[:issue_request][:to]
     @group_id = params[:issue_request][:issue_tracker_group_id]
     @member_id = params[:issue_requests][:issue_tracker_member_id]
     @issue_requests = IssueRequest.where(issue_tracker_group_id: @group_id, issue_tracker_member_id: @member_id, date: @from.to_date..@to.to_date) 
    #  respond_to do |format|
    #  format.xls {render template: 'issue_requests/memberwise_report_list_xls.xls.erb'}
    # end
  end

  def memberwise_report_list_xls
    # byebug
     @from = params[:from]
     @to = params[:to]
     @group_id = params[:issue_tracker_group_id]
     @member_id = params[:issue_tracker_member_id]
     @issue_requests = IssueRequest.where(issue_tracker_group_id: @group_id, issue_tracker_member_id: @member_id, date: @from.to_date..@to.to_date)    
     respond_to do |format|
     format.xls {render template: 'issue_requests/memberwise_report_list_xls.xls.erb'}
    end
  end

  def memberwise_report_list_pdf
    # byebug
     @from = params[:from]
     @to = params[:to]
     @group_id = params[:issue_tracker_group_id]
     @member_id = params[:issue_tracker_member_id]
     @issue_requests = IssueRequest.where(issue_tracker_group_id: @group_id, issue_tracker_member_id: @member_id, date: @from.to_date..@to.to_date)   
      respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'memberwise_report_list_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'issue_requests/memberwise_report_list_pdf.pdf.erb',
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_request
      @issue_request = IssueRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_request_params
      params.require(:issue_request).permit(:comment,:issue_root_cause_id, :effort_time,:is_complete,:issue_master_id, :issue_tracker_member_id, :issue_tracker_group_id, :description, :date, :time, :employee_id, :issue_priority, :status, :document1, :document2)
    end
end