class TravelRequestsController < ApplicationController
  before_action :set_travel_request, only: [:show, :edit, :update, :destroy]

  # GET /travel_requests
  # GET /travel_requests.json
  def index
    @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
   session[:active_tab] = "TravelManagement"
    session[:active_tab1] = "TravelRequestProcess" 
  end

  # GET /travel_requests/1
  # GET /travel_requests/1.json
  def show
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
  end

  # GET /travel_requests/new
  def new
    @travel_request = TravelRequest.new
  end

  # GET /travel_requests/1/edit
  def edit
  end

  # POST /travel_requests
  # POST /travel_requests.json
  def create
    @travel_request = TravelRequest.new(travel_request_params)
    @travel_request.current_status = "Pending"

    respond_to do |format|
      if @travel_request.save
       # @reporting_master = params[:travel_request][:reporting_master_id]
       # @rep_master = ReportingMaster.find(@reporting_master)
       # TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @rep_master.employee_id)
        @c1 = (@travel_request.to - @travel_request.traveling_date).to_i
        ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id)
        TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
        TravelRequest.where(id: @travel_request.id).update_all(day: @c1)
        TravelRequestMailer.travel_request(@travel_request).deliver_now
        format.html { redirect_to @travel_request, notice: 'Travel request was successfully created.' }
        format.json { render :show, status: :created, location: @travel_request }
      else
        format.html { render :new }
        format.json { render json: @travel_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_requests/1
  # PATCH/PUT /travel_requests/1.json
  def update
    respond_to do |format|
      if @travel_request.update(travel_request_params)
        @c1 = (@travel_request.to - @travel_request.traveling_date).to_i
        TravelRequest.where(id: @travel_request.id).update_all(day: @c1)
        TravelRequestMailer.travel_request(@travel_request).deliver_now
        format.html { redirect_to @travel_request, notice: 'Travel request was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_request }
      else
        format.html { render :edit }
        format.json { render json: @travel_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_requests/1
  # DELETE /travel_requests/1.json
  def destroy
    @travel_request.destroy
    respond_to do |format|
      format.html { redirect_to travel_requests_url, notice: 'Travel request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def daily_bill
     # @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
      @travel_requests = TravelRequest.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"Approved")
    session[:active_tab] = "TravelManagement"
    session[:active_tab1] = "ExpensesClaimProcess"  
  end

  def travel_history
    # @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    # @travel_requests = TravelRequest.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",@reporting_masters,"Pending","Approved & Send Next","Edit & Send Next")
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @travel_requests = TravelRequest.where(reporting_master_id: @reporting_masters)
    #@travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id)
     session[:active_tab] = "TravelManagement"
    session[:active_tab1] = "TravelRequestProcess" 
  end

  def travel_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @travel_requests = TravelRequest.where(reporting_master_id: reporting_masters)
  end

  def approve_travel_request
      @travel_request = TravelRequest.find(params[:format])
      @travel_request.update(current_status: "Approved")
      TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Approved")
      # ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id)
      # @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
      @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Approved")
      TravelExpence.create(travel_request_id: @travel_request.id,total_advance_amount: @travel_request.total_advance)
      # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,reporting_master_id: @reporting_masters)
      # @reporting_masters_travel_requests.update(travel_status: "Approved")
      # ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters).update_all(travel_status: "Approved")
      TravelRequestMailer.approve_travel_request_email(@travel_request).deliver_now
      flash[:notice] = 'Travel Request Approved'
      redirect_to travel_history_travel_requests_path
  end

  def reject_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Reject")
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,employee_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Reject")
    # ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Reject")
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Reject")
    TravelRequestMailer.reject_travel_request_email(@travel_request).deliver_now
    flash[:alert] = 'Travel Request Rejected'
    redirect_to travel_history_travel_requests_path
  end

  def send_request_to_higher_authority
    @travel_request = TravelRequest.find(params[:id])
    # @travel_request.update(current_status: "Approved & Send Next")

    @travel_request.update(current_status: "Approved & Send Next",reporting_master_id: params[:travel_request][:reporting_master_id])
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Approved & Send Next")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request][:reporting_master_id])
    # @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Approved & Send Next")
    TravelRequestMailer.approve_and_send_next(@travel_request).deliver_now
    flash[:notice] = 'Travel Request Send to Higher Authority for Approval'
    redirect_to travel_history_travel_requests_path
  end

  def modal
     @travel_request = TravelRequest.find(params[:format])
  end

  def cancel_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Cancelled")
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Cancelled")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: @travel_request.reporting_master_id, travel_status: "Cancelled")
    flash[:notice] = 'Travel Request Cancelled'
    redirect_to travel_requests_path
  end

  def travel_request_list
    # if current_user.role.name= 'Company'
    #   @travel_requests = TravelRequest.all
    # else
      @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    # end
   session[:active_tab] = "TravelManagement"
    session[:active_tab1] = "TravelRequestProcess" 
  end

  def edit_and_send_next_modal
    @travel_request = TravelRequest.find(params[:format])
  end

  def edit_and_send_next_modal_submit

    @travel_request = TravelRequest.find(params[:abc])
    @travel_request_history = TravelRequestHistory.new
    # @travel_request_history = TravelRequestHistory.find(@travel_request.id)
    @travel_request = TravelRequest.find(params[:travel_request_history][:travel_request_id])
    
    @travel_request_history.application_date = @travel_request.application_date
    @travel_request_history.traveling_date = @travel_request.traveling_date
    @travel_request_history.tour_purpose = @travel_request.tour_purpose
    @travel_request_history.place = @travel_request.place
    @travel_request_history.total_advance = @travel_request.total_advance
    @travel_request_history.reporting_master_id = @travel_request.reporting_master_id
    @travel_request_history.current_status = @travel_request.current_status
    @travel_request_history.travel_option_id = @travel_request.travel_option_id
    @travel_request_history.travel_request_id = @travel_request.id

    # @travel_request_history.save
    @travel_request.update(reporting_master_id: params[:travel_request_history][:reporting_master_id],application_date: params[:travel_request_history][:application_date], traveling_date: params[:travel_request_history][:traveling_date],tour_purpose: params[:travel_request_history][:tour_purpose],place: params[:travel_request_history][:place],total_advance: params[:travel_request_history][:total_advance],current_status: params[:travel_request_history][:current_status],travel_option_id: params[:travel_request_history][:travel_option_id],current_status: "Edit & Send Next")
    # @travel_request_history = TravelRequestHistory.new(travel_request_history_params)
    # @travel_request.update(travel_request_params)
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
    TravelRequestHistory.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(current_status: "Edit & Send Next")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request_history][:reporting_master_id])
    ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Edit & Send Next")
    # TravelRequestMailer.edit_and_send_next(@travel_request).deliver_now
    flash[:notice] = 'Travel Request Edited & Send to Higher Authority For Approval.'
    redirect_to travel_history_travel_requests_path
  end

  def edit_and_approve_modal
    @travel_request = TravelRequest.find(params[:format])
  end

  # def edit_and_approve_modal_submit
  #   # byebug
  #   @travel_request = TravelRequest.find(params[:abc])
  #   @travel_request_history = TravelRequestHistory.new
  #   # @travel_request_history = TravelRequestHistory.find(@travel_request.id)
  #   # byebug
  #   @travel_request = TravelRequest.find(params[:travel_request_history][:travel_request_id])
    
  #   @travel_request_history.application_date = @travel_request.application_date
  #   @travel_request_history.traveling_date = @travel_request.traveling_date
  #   @travel_request_history.tour_purpose = @travel_request.tour_purpose
  #   @travel_request_history.place = @travel_request.place
  #   @travel_request_history.total_advance = @travel_request.total_advance
  #   @travel_request_history.reporting_master_id = @travel_request.reporting_master_id
  #   @travel_request_history.current_status = @travel_request.current_status
  #   @travel_request_history.travel_option_id = @travel_request.travel_option_id
  #   @travel_request_history.travel_request_id = @travel_request.id

  #   # @travel_request_history.save
  #   @travel_request.update(application_date: params[:travel_request_history][:application_date], traveling_date: params[:travel_request_history][:traveling_date],tour_purpose: params[:travel_request_history][:tour_purpose],place: params[:travel_request_history][:place],total_advance: params[:travel_request_history][:total_advance],reporting_master_id: params[:travel_request_history][:reporting_master_id],current_status: params[:travel_request_history][:current_status],travel_option_id: params[:travel_request_history][:travel_option_id],current_status: "Edit & Send Next")
  #   # @travel_request_history = TravelRequestHistory.new(travel_request_history_params)
  #   # @travel_request.update(travel_request_params)
  #   TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Edit & Send Next")
  #   ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request_history][:reporting_master_id])
  #   flash[:notice] = 'Travel Request Edited & Approved Successfully'
  #   redirect_to travel_history_travel_requests_path
  # end

  def edit_and_approve_modal_submit

    @travel_request = TravelRequest.find(params[:abc])
    @travel_request_history = TravelRequestHistory.new
    # @travel_request_history = TravelRequestHistory.find(@travel_request.id)
    @travel_request = TravelRequest.find(params[:travel_request_history][:travel_request_id])
    
    @travel_request_history.application_date = @travel_request.application_date
    @travel_request_history.traveling_date = @travel_request.traveling_date
    @travel_request_history.tour_purpose = @travel_request.tour_purpose
    @travel_request_history.place = @travel_request.place
    @travel_request_history.total_advance = @travel_request.total_advance
    @travel_request_history.reporting_master_id = @travel_request.reporting_master_id
    @travel_request_history.current_status = @travel_request.current_status
    @travel_request_history.travel_option_id = @travel_request.travel_option_id
    @travel_request_history.reporting_master_id = @travel_request.reporting_master_id
    @travel_request_history.travel_request_id = @travel_request.id

    # @travel_request_history.save
    @travel_request.update(application_date: params[:travel_request_history][:application_date], traveling_date: params[:travel_request_history][:traveling_date],tour_purpose: params[:travel_request_history][:tour_purpose],place: params[:travel_request_history][:place],total_advance: params[:travel_request_history][:total_advance],current_status: params[:travel_request_history][:current_status],travel_option_id: params[:travel_request_history][:travel_option_id],current_status: "Edit & Send Next")
    # @travel_request_history = TravelRequestHistory.new(travel_request_history_params)
    # @travel_request.update(travel_request_params)
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance, travel_option_id: @travel_request.travel_option_id)
    TravelRequestHistory.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(current_status: "Edit & Approved")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request_history][:reporting_master_id])
    ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Edit & Approved")
    # TravelRequestMailer.edit_and_approve(@travel_request).deliver_now
    flash[:notice] = 'Travel Request Edited & Approved Successfully.'
    redirect_to travel_history_travel_requests_path
  end


  
  def is_confirm
    @travel_request = TravelRequest.find(params[:travel_id])
    @travel_request.update(is_confirm: true)
    flash[:notice] = "Confirmed !"
    redirect_to daily_bill_travel_requests_path
  end

  # def travel_request_list
  #    @travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id)
  # end

  def print_application_report
    # byebug
      @from = params[:salary][:from_date]
      @to = params[:salary][:to_date]
      @company = params[:employee][:company_id] 
      @company_location = params[:employee][:company_location_id] 
      @department = params[:employee][:department_id] 
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      respond_to do |format|
      format.js
      format.xls {render template: 'travel_requests/application_datewise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'application_datewise_report_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'travel_requests/application_datewise_report_pdf.pdf.erb',
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

  def print_travelling_datewise_report
    # byebug
      @start = params[:salary][:from_date]
      @end = params[:salary][:to_date]
      @company = params[:employee][:company_id]
      @company_location = params[:employee][:company_location_id]
      @department = params[:employee][:department_id]
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @travel_requests = TravelRequest.where(traveling_date:  @start.to_date..@end.to_date,employee_id: @employees) 
    end

#     def application_datewise_report_xls
#       @start = params[:from_date]
#       @end = params[:to_date]
#       @company = params[:company_id]
#       @company_location = params[:company_location_id]
#       @department = params[:department_id]
#       @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
#       @travel_requests = TravelRequest.where(application_date:  @start.to_date..@end.to_date,employee_id: @employees) 

#      respond_to do |format|
#      format.xls {render template: 'travel_requests/application_datewise_report_xls.xls.erb'}
#    end
# end
#   def application_datewise_report_pdf
#       @start = params[:from_date]
#       @end = params[:to_date]
#       @company = params[:company_id]
#       @company_location = params[:company_location_id]
#       @department = params[:department_id]
#       @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
#       @travel_requests = TravelRequest.where(application_date:  @start.to_date..@end.to_date,employee_id: @employees) 

#     respond_to do |format|
#     format.json
#     format.pdf do
#       render pdf: 'application_datewise_report_pdf',
#             layout: 'pdf.html',
#             orientation: 'Landscape',
#             template: 'travel_requests/application_datewise_report_pdf.pdf.erb',
#             # show_as_html: params[:debug].present?,
#             :page_height      => 1000,
#             :dpi              => '300',
#             :margin           => {:top    => 10, # default 10 (mm)
#                           :bottom => 10,
#                           :left   => 20,
#                           :right  => 20},
#             :show_as_html => params[:debug].present?
#         end
#       end
     
#   end

  def travelling_datewise_report_xls
      @start = params[:from_date]
      @end = params[:to_date]
      @company = params[:company_id]
      @company_location = params[:company_location_id]
      @department = params[:department_id]
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @travel_requests = TravelRequest.where(traveling_date:  @start.to_date..@end.to_date,employee_id: @employees) 

     respond_to do |format|
     format.xls {render template: 'travel_requests/travelling_datewise_report_xls.xls.erb'}
   end
 end

  def travelling_datewise_report_pdf
      @start = params[:from_date]
      @end = params[:to_date]
      @company = params[:company_id]
      @company_location = params[:company_location_id]
      @department = params[:department_id]
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @travel_requests = TravelRequest.where(traveling_date:  @start.to_date..@end.to_date,employee_id: @employees) 
    
    respond_to do |format|
    format.json
    format.pdf do
      render pdf: 'travelling_datewise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'travel_requests/travelling_datewise_report_pdf.pdf.erb',
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
    def set_travel_request
      @travel_request = TravelRequest.find(params[:id])
    end

    def travel_request_history_params
      params.require(:travel_request_history).permit(:status, :travel_request_id, :employee_id, :current_status,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :travel_option_id, :travel_mode_id, :total_advance)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_request_params
      params.require(:travel_request).permit(:employee_id, :to, :day,:current_status, :expense,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :travel_option_id, :travel_mode_id, :total_advance)
    end
end