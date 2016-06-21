class TravelRequestsController < ApplicationController
  before_action :set_travel_request, only: [:show, :edit, :update, :destroy]

  # GET /travel_requests
  # GET /travel_requests.json
  def index
    @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    session[:active_tab] ="travelmgmt"
  end

  # GET /travel_requests/1
  # GET /travel_requests/1.json
  def show
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
        # ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Pending")
        # TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
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
    if current_user.role.name == 'Company'
      @travel_requests = TravelRequest.all
    else
      @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    end
    session[:active_tab] ="travelmgmt"
  end

  def travel_history
    @travel_requests = TravelRequest.where("reporting_master_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Pending","Approved & Send Next")
    #@travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id)
    session[:active_tab] ="travelmgmt"
  end

  def travel_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    @travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id)
  end

  def approve_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Approved")
    ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Approved")
    TravelRequestMailer.approve_travel_request_email(@travel_request).deliver_now
    flash[:notice] = 'Travel Request Approved'
    redirect_to travel_history_travel_requests_path
  end

  def reject_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Reject")
    ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Reject")
    TravelRequestMailer.reject_travel_request_email(@travel_request).deliver_now
    flash[:alert] = 'Travel Request Rejected'
    redirect_to travel_history_travel_requests_path
  end

  def send_request_to_higher_authority
    @travel_request = TravelRequest.find(params[:id])
    # @travel_request.update(current_status: "Approved & Send Next")

    @travel_request.update(current_status: "Approved & Send Next",reporting_master_id: params[:travel_request][:reporting_master_id])
    TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request][:reporting_master_id] , travel_status: "Approved & Send Next")
    flash[:notice] = 'Travel Request Send to Higher Authority'
    redirect_to travel_history_travel_requests_path
  end

  # def send_request_to_higher_authority
  #   @vacancy_master = VacancyMaster.find(params[:id])
  #   @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
  #   # len = @vacancy_master.no_of_position
  #   #   for i in 1..len
  #   #    ParticularVacancyRequest.create(vacancy_master_id: @vacancy_master.id,employee_id: @vacancy_master.employee_id,employee_designation_id: @vacancy_master.employee_designation_id,vacancy_name: @vacancy_master.vacancy_name,fulfillment_date: @vacancy_master.vacancy_post_date,status: "Approved & Send Next")
  #   #   end
  #   @particular_vacancy_requests.each do |p|
  #     p.update(status: "Approved & Send Next")
  #   end 
  #   VacancyMasterMailer.approve_and_send_next_email(@vacancy_master).deliver_now
  #   @vacancy_master.update(current_status: "Approved & Send Next",reporting_master_id: params[:vacancy_master][:reporting_master_id])
  #   VacancyRequestHistory.create(vacancy_master_id: @vacancy_master.id, vacancy_name: @vacancy_master.vacancy_name,no_of_position: @vacancy_master.no_of_position,description: @vacancy_master.description,vacancy_post_date: @vacancy_master.vacancy_post_date,budget: @vacancy_master.budget,department_id: @vacancy_master.department_id,employee_designation_id: @vacancy_master.employee_designation_id,company_location_id: @vacancy_master.company_location_id,degree_id: @vacancy_master.degree_id,degree_1_id: @vacancy_master.degree_1_id,degree_2_id: @vacancy_master.degree_2_id,experience: @vacancy_master.experience,keyword: @vacancy_master.keyword,other_organization: @vacancy_master.other_organization,industry: @vacancy_master.industry,reporting_master_id: @vacancy_master.reporting_master_id,current_status: @vacancy_master.current_status,employee_id: @vacancy_master.employee_id,justification: @vacancy_master.justification)
  #   ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: params[:vacancy_master][:reporting_master_id], vacancy_status: "Approved & Send Next")
  #   flash[:notice] = 'Vacancy Send to Higher Authority'
  #   redirect_to vacancy_history_vacancy_masters_path
  # end

  def modal
     @travel_request = TravelRequest.find(params[:format])
  end

  def cancel_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Cancelled")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: current_user.employee_id, travel_status: "Cancelled")
    flash[:notice] = 'Travel Request Cancelled'
    redirect_to travel_requests_path
  end

  def travel_request_list
     if current_user.role.name == 'Company'
      @travel_requests = TravelRequest.all
    else
      @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    end
    session[:active_tab] ="travelmgmt"
  end

  def edit_and_send_next_modal
    @travel_request = TravelRequest.find(params[:format])
  end

  def edit_and_send_next_modal_submit
    @travel_request = TravelRequest.find(params[:id])
    @travel_request.update(travel_request_params)
    TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: @travel_request.reporting_master_id, travel_status: "Edit & Send Next")
    flash[:notice] = "Updated successfully"
    redirect_to travel_history_travel_requests_path
  end

  def edit_and_approve_modal
    @travel_request = TravelRequest.find(params[:format])
  end

  def edit_and_approve_modal_submit
    @travel_request = TravelRequest.find(params[:id])
    @travel_request.update(travel_request_params)
    TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
    ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Edit And Approved")
    flash[:notice] = 'Travel Request Approved'
    redirect_to travel_history_travel_requests_path
  end

  def is_confirm
    @travel_request = TravelRequest.find(params[:travel_id])
    @travel_request.update(is_confirm: true)
    flash[:notice] = "Confirmed !"
    redirect_to daily_bill_travel_requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_request
      @travel_request = TravelRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_request_params
      params.require(:travel_request).permit(:employee_id, :current_status,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :travel_option_id, :travel_mode_id, :total_advance)
    end
end