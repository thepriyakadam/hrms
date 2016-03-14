class OvertimeMonthRecordsController < ApplicationController
  before_action :set_overtime_month_record, only: [:show, :edit, :update, :destroy]

  # GET /overtime_month_records
  # GET /overtime_month_records.json
  def index
    @overtime_month_records = OvertimeMonthRecord.all
  end

  # GET /overtime_month_records/1
  # GET /overtime_month_records/1.json
  def show
  end

  # GET /overtime_month_records/new
  def new
    @overtime_month_record = OvertimeMonthRecord.new
  end

  # GET /overtime_month_records/1/edit
  def edit
  end

  # POST /overtime_month_records
  # POST /overtime_month_records.json
  def create
    @overtime_month_record = OvertimeMonthRecord.new(overtime_month_record_params)

    respond_to do |format|
      if @overtime_month_record.save
        format.html { redirect_to @overtime_month_record, notice: 'Overtime month record was successfully created.' }
        format.json { render :show, status: :created, location: @overtime_month_record }
      else
        format.html { render :new }
        format.json { render json: @overtime_month_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overtime_month_records/1
  # PATCH/PUT /overtime_month_records/1.json
  def update
    respond_to do |format|
      if @overtime_month_record.update(overtime_month_record_params)
        format.html { redirect_to @overtime_month_record, notice: 'Overtime month record was successfully updated.' }
        format.json { render :show, status: :ok, location: @overtime_month_record }
      else
        format.html { render :edit }
        format.json { render json: @overtime_month_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overtime_month_records/1
  # DELETE /overtime_month_records/1.json
  def destroy
    @overtime_month_record.destroy
    respond_to do |format|
      format.html { redirect_to overtime_month_records_url, notice: 'Overtime month record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overtime_month_record
      @overtime_month_record = OvertimeMonthRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overtime_month_record_params
      params.require(:overtime_month_record).permit(:employee_id, :overtime_data, :attendance_bonus_amount, :paid_holiday_amount)
    end
end
