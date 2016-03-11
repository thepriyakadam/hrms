class OvertimeDailyRecordsController < ApplicationController
  before_action :set_overtime_daily_record, only: [:show, :edit, :update, :destroy]

  # GET /overtime_daily_records
  # GET /overtime_daily_records.json
  def index
    @overtime_daily_records = OvertimeDailyRecord.all
  end

  # GET /overtime_daily_records/1
  # GET /overtime_daily_records/1.json
  def show
  end

  # GET /overtime_daily_records/new
  def new
    @overtime_daily_record = OvertimeDailyRecord.new
    @overtime_master = OvertimeMaster.find_by_status(true)
    @esic_master = EsicMaster.first
    if @overtime_master.nil? or @esic_master.nil?
      flash[:alert] = "Over time master or esic master not set."
    end
  end

  # GET /overtime_daily_records/1/edit
  def edit
  end

  # POST /overtime_daily_records
  # POST /overtime_daily_records.json
  def create
    @overtime_daily_record = OvertimeDailyRecord.new(overtime_daily_record_params)

    respond_to do |format|
      if @overtime_daily_record.save
        format.html { redirect_to overtime_daily_records_path, notice: 'Overtime daily record was successfully created.' }
        format.json { render :show, status: :created, location: @overtime_daily_record }
      else
        format.html { render :new }
        format.json { render json: @overtime_daily_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overtime_daily_records/1
  # PATCH/PUT /overtime_daily_records/1.json
  def update
    respond_to do |format|
      if @overtime_daily_record.update(overtime_daily_record_params)
        format.html { redirect_to @overtime_daily_record, notice: 'Overtime daily record was successfully updated.' }
        format.json { render :show, status: :ok, location: @overtime_daily_record }
      else
        format.html { render :edit }
        format.json { render json: @overtime_daily_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overtime_daily_records/1
  # DELETE /overtime_daily_records/1.json
  def destroy
    @overtime_daily_record.destroy
    respond_to do |format|
      format.html { redirect_to overtime_daily_records_url, notice: 'Overtime daily record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overtime_daily_record
      @overtime_daily_record = OvertimeDailyRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overtime_daily_record_params
      params.require(:overtime_daily_record).permit(:employee_id, :ot_daily_date, :ot_daily_hrs, :ot_rate, :ot_daily_amount)
    end
end
