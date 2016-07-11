class DailyBillDetailsController < ApplicationController
  before_action :set_daily_bill_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /daily_bill_details
  # GET /daily_bill_details.json
  def index
    @daily_bill_details = DailyBillDetail.all
  end

  # GET /daily_bill_details/1
  # GET /daily_bill_details/1.json
  def show
  end

  # GET /daily_bill_details/new
  def new
    @daily_bill_detail = DailyBillDetail.new
    @travel_request = TravelRequest.find(params[:format])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    session[:active_tab] = "master"
    session[:active_tab1] ="daily_bill_master_setup"
  end

  # GET /daily_bill_details/1/edit
  def edit
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
  end

  # POST /daily_bill_details
  # POST /daily_bill_details.json

  def create
    @daily_bill_detail = DailyBillDetail.new(daily_bill_detail_params)
    # byebug
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)

       ActiveRecord::Base.transaction do
        respond_to do |format|
    if @daily_bill_detail.save
        @daily_bill_detail.update(reporting_master_id: @travel_request.reporting_master_id)
        @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
        format.html { redirect_to @daily_bill_detail, notice: 'Daily Bill was successfully created.' }
        format.json { render :show, status: :created, location: @daily_bill_detail }
        format.js { @flag = true }
      else
        format.html { render :new }
        format.json { render json: @daily_bill_detail.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end
end

  # PATCH/PUT /daily_bill_details/1
  # PATCH/PUT /daily_bill_details/1.json

  def update
    respond_to do |format|
      @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)

      if @daily_bill_detail.update(daily_bill_detail_params)
        
        @daily_bill_details =  @travel_request.daily_bill_details
         format.js { @flag = true }
      else
        format.js { @flag = false }
      end
    end
  end


  # DELETE /daily_bill_details/1
  # DELETE /daily_bill_details/1.json
  def destroy
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)

    @daily_bill_detail.destroy
    flash.now[:notice] = "Deleted successfully"
  end


  def is_confirm
    @travel_request = TravelRequest.find(params[:qwe])
    @daily_bill_detail_ids = params[:daily_bill_detail_ids]
    if @daily_bill_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_daily_bill_detail_path(@travel_request.id)
    else
      @daily_bill_detail_ids.each do |did|
      @daily_bill_detail = DailyBillDetail.find(did)
      @daily_bill_detail.update(is_confirm: true)
      
      flash[:notice] = "Confirmed Successfully"
    end 
      redirect_to new_daily_bill_detail_path(@travel_request.id)
    end
  end

  def print_daily_bill
    @travel_request = TravelRequest.find(params[:qwe])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_daily_bill',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 12,
                          :right  => 12},
               orientation: 'Landscape',
               template: 'daily_bill_details/print_daily_bill.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  # def daily_bill_history
  #   # @daily_bill_details = DailyBillDetail.all
  #   @c1 = ReportingMastersTravelRequest.find_by_travel_request_id(@daily_bill_detail.travel_request_id)
  #   @daily_bill_details = DailyBillDetail.where("travel_request_id = ?",@c1.travel_request_id)
  # end

  def daily_bill_history
    @daily_bill_details = DailyBillDetail.where(reporting_master_id: current_user.employee_id,is_confirm: true)
    session[:active_tab] ="travelmgmt" 
  end 

  def daily_bill_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(reporting_master_id: current_user.employee_id,travel_request_id: @travel_request.id)
    session[:active_tab] ="travelmgmt"
  end

  def approve_request
    @daily_bill_detail_ids = params[:daily_bill_detail_ids]
    if @daily_bill_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to travel_request_list_daily_bill_details_path
    else
      @daily_bill_detail_ids.each do |did|
      @daily_bill_detail = DailyBillDetail.find(did)
      @daily_bill_detail.update(request_status: "Approved") 
      flash[:notice] = "Approved Successfully"
    end 
     redirect_to travel_request_list_daily_bill_details_path
  end
  session[:active_tab] ="travelmgmt"
  end

  def approved_daily_bill_details
    @daily_bill_details = DailyBillDetail.where(request_status: "Approved")
    session[:active_tab] ="travelmgmt"
  end

  def download_doc
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.avatar_file.path,
              filename: @daily_bill_detail.avatar_file_file_name,
              type: @daily_bill_detail.avatar_file_content_type,
              disposition: 'attachment'
  end

  def download_pics
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.passport_photo.path,
              filename: @daily_bill_detail.passport_photo_file_name,
              type: @daily_bill_detail.passport_photo_content_type,
              disposition: 'attachment'
  end

   def travel_request_list
     @travel_requests = TravelRequest.where(reporting_master_id: current_user.employee_id)
  end

  def edit_and_send_next_modal
     @daily_bill_detail = DailyBillDetail.find(params[:format])
  end

  def edit_and_send_next
     puts "----------------------"
     @daily_bill_detail = DailyBillDetail.find(params[:id])
  end

  def edit_and_send_next
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    @daily_bill_detail.update(daily_bill_detail_params)
    flash[:notice] = "Updated successfully"
    redirect_to travel_request_list_daily_bill_details_path
  end

  # def edit_and_send_next_modal_submit
  #   @travel_request = TravelRequest.find(params[:id])
  #   @travel_request.update(travel_request_params)
  #   TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
  #   ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: @travel_request.reporting_master_id, travel_status: "Edit & Send Next")
  #   flash[:notice] = "Updated successfully"
  #   redirect_to travel_history_travel_requests_path
  # end

  def comment_modal
     @daily_bill_detail = DailyBillDetail.find(params[:format])
  end

  def update_comment
     # byebug
     @daily_bill_detail = DailyBillDetail.find(params[:id])
     @comment = params[:daily_bill_detail][:comment]
     @daily_bill_detail.update(comment: @comment)
     flash[:notice] = 'Comment Updated Successfully'
     redirect_to travel_request_list_daily_bill_details_path
  end


  # def reject_request
  #   @daily_bill_detail_ids = params[:daily_bill_detail_ids]
  #   if @daily_bill_detail_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #     redirect_to daily_bill_history_daily_bill_details_path
  #   else
  #     @daily_bill_detail_ids.each do |did|
  #     @daily_bill_detail = DailyBillDetail.find(did)
  #     @daily_bill_detail.update(request_status: "Rejected") 
  #     flash[:alert] = "Rejected Successfully"
  #   end 
  #    redirect_to travel_request_list_daily_bill_details_path
  # end
  # session[:active_tab] ="travelmgmt"
  # end

  def reject_request
    # byebug
    @daily_bill_detail = DailyBillDetail.find(params[:format])
    @daily_bill_detail.update(request_status: "Rejected")
    flash[:alert] = 'Daily Bill Request Rejected'
    redirect_to travel_request_list_daily_bill_details_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:is_confirm, :comment,:avatar_file,:reporting_master_id,:passport_photo,:currency_master_id,:request_status,:travel_expence_type_id, :travel_request_id, :expence_date, :e_place, :travel_expence )
    end
end
