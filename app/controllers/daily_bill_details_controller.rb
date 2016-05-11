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
    @daily_bill_details = @travel_request.daily_bill_details

  end

  # GET /daily_bill_details/1/edit
  def edit
    # @travel_request = TravelRequest.find(params[:format])
    # @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
  end

  # POST /daily_bill_details
  # POST /daily_bill_details.json

  def create
    @daily_bill_detail = DailyBillDetail.new(daily_bill_detail_params)
    @travel_request = TravelRequest.find(params[:daily_bill_detail][:travel_request_id])


    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    respond_to do |format|
      if @daily_bill_detail.save
        len = params['daily_bill_detail'].length - 7
      for i in 2..len
        DailyBillDetail.create(travel_request_id: params['daily_bill_detail']['travel_request_id'], expence_date: params['daily_bill_detail'][i.to_s]['expence_date'], e_place: params['daily_bill_detail'][i.to_s]['e_place'], travel_expence: params['daily_bill_detail'][i.to_s]['travel_expence'],local_travel_expence: params['daily_bill_detail'][i.to_s]['local_travel_expence'],lodging_expence: params['daily_bill_detail'][i.to_s]['lodging_expence'],boarding_expence: params['daily_bill_detail'][i.to_s]['boarding_expence'],other_expence: params['daily_bill_detail'][i.to_s]['other_expence'])
      end     
        @daily_bill_detail = DailyBillDetail.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Saved Successfully.'
        format.js { @flag = false }
      end
    end
  end


  # PATCH/PUT /daily_bill_details/1
  # PATCH/PUT /daily_bill_details/1.json
  def update
      @daily_bill_detail.update(daily_bill_detail_params)
      @daily_bill_detail = DailyBillDetail.new
      @daily_bill_details = DailyBillDetail.all
      flash.now[:notice] = "Updated successfully"
  end

  # DELETE /daily_bill_details/1
  # DELETE /daily_bill_details/1.json
  def destroy
    @daily_bill_detail.destroy
    @daily_bill_details = DailyBillDetail.all
    flash.now[:notice] = "Destroy successfully"
    
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:is_confirm,:travel_request_id, :expence_date, :e_place, :travel_expence, :local_travel_expence, :lodging_expence, :boarding_expence, :other_expence)
    end
end
