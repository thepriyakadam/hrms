class OvertimeMonthRecordsController < ApplicationController
  before_action :set_overtime_month_record, only: [:show, :edit, :update, :destroy]

  # GET /overtime_month_records
  # GET /overtime_month_records.json
  def index
  end

  # GET /overtime_month_records/1
  # GET /overtime_month_records/1.json
  def show
  end

  # GET /overtime_month_records/new
  def new
    @overtime_month_record = OvertimeMonthRecord.new
    @overtime_month_records = OvertimeMonthRecord.all
  end

  # GET /overtime_month_records/1/edit
  def edit
  end

  # POST /overtime_month_records
  # POST /overtime_month_records.json
  def create
    @overtime_month_record = OvertimeMonthRecord.new(overtime_month_record_params)
    @overtime_month_records = OvertimeMonthRecord.all
    @overtime_month_record.save
    @overtime_month_record = OvertimeMonthRecord.new
  end

  # PATCH/PUT /overtime_month_records/1
  # PATCH/PUT /overtime_month_records/1.json
  def update
    @overtime_month_record.update(overtime_month_record_params)
    @overtime_month_records = OvertimeMonthRecord.all
    @overtime_month_record = OvertimeMonthRecord.new
  end

  # DELETE /overtime_month_records/1
  # DELETE /overtime_month_records/1.json
  def destroy
    @overtime_month_record.destroy
    @overtime_month_records = OvertimeMonthRecord.all
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
