class DailyBillDetailsController < ApplicationController
  before_action :set_daily_bill_detail, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /daily_bill_details/1/edit
  def edit
  end

  # POST /daily_bill_details
  # POST /daily_bill_details.json
  def create
    @daily_bill_detail = DailyBillDetail.new(daily_bill_detail_params)

    respond_to do |format|
      if @daily_bill_detail.save
        format.html { redirect_to @daily_bill_detail, notice: 'Daily bill detail was successfully created.' }
        format.json { render :show, status: :created, location: @daily_bill_detail }
      else
        format.html { render :new }
        format.json { render json: @daily_bill_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_bill_details/1
  # PATCH/PUT /daily_bill_details/1.json
  def update
    respond_to do |format|
      if @daily_bill_detail.update(daily_bill_detail_params)
        format.html { redirect_to @daily_bill_detail, notice: 'Daily bill detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_bill_detail }
      else
        format.html { render :edit }
        format.json { render json: @daily_bill_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_bill_details/1
  # DELETE /daily_bill_details/1.json
  def destroy
    @daily_bill_detail.destroy
    respond_to do |format|
      format.html { redirect_to daily_bill_details_url, notice: 'Daily bill detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:travel_request_id, :expence_date, :e_place, :travel_expence, :local_travel_expence, :lodging_expence, :boarding_expence, :other_expence)
    end
end
