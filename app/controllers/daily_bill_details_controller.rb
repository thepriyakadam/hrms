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
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
  
       ActiveRecord::Base.transaction do
        respond_to do |format|
          if @daily_bill_detail.save
            len = params['daily_bill_detail'].length - 7
          for i in 2..len
            DailyBillDetail.create(travel_request_id: params['daily_bill_detail']['travel_request_id'], expence_date: params['daily_bill_detail'][i.to_s]['expence_date'], e_place: params['daily_bill_detail'][i.to_s]['e_place'], travel_expence: params['daily_bill_detail'][i.to_s]['travel_expence'],local_travel_expence: params['daily_bill_detail'][i.to_s]['local_travel_expence'],lodging_expence: params['daily_bill_detail'][i.to_s]['lodging_expence'],boarding_expence: params['daily_bill_detail'][i.to_s]['boarding_expence'],other_expence: params['daily_bill_detail'][i.to_s]['other_expence'])
          end
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

 
  
  def daily_bill_history
    # @daily_bill_details = DailyBillDetail.all
    @c1 = ReportingMastersTravelRequest.find_by_travel_request_id(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where("travel_request_id = ?",@c1.travel_request_id)
  end

  def daily_bill_request_confirmation
    @daily_bill_details = DailyBillDetail.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:is_confirm, :travel_expence_type_id, :travel_request_id, :expence_date, :e_place, :travel_expence )
    end
end
