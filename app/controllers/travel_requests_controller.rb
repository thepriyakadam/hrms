class TravelRequestsController < ApplicationController
  before_action :set_travel_request, only: [:show, :edit, :update, :destroy]

  # GET /travel_requests
  # GET /travel_requests.json
  def index
    @travel_requests = TravelRequest.all
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
        ReportingMastersTravelRequest.create(reporting_master_id: @travel_request.reporting_master_id, travel_request_id: @travel_request.id, travel_status: "Pending")
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
    @travel_requests = TravelRequest.all
  end

  def travel_history
     @travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id, current_status: "Pending")  
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
    @travel_request.update(current_status: "Approved & Send Next")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: current_user.employee_id, travel_status: "Approved & Send Next")
    flash[:notice] = 'Vacancy Send to Higher Authority'
    redirect_to travel_history_travel_requests_path
  end

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
     @travel_requests = TravelRequest.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_request
      @travel_request = TravelRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_request_params
      params.require(:travel_request).permit(:employee_id, :current_status,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :total_advance)
    end
end
