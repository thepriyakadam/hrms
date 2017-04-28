class PayrollPeriodsController < ApplicationController
  before_action :set_payroll_period, only: [:show, :edit, :update, :destroy]

  # GET /payroll_periods
  # GET /payroll_periods.json
  def index
    @payroll_periods = PayrollPeriod.all
  end

  # GET /payroll_periods/1
  # GET /payroll_periods/1.json
  def show
  end

  # GET /payroll_periods/new
  def new
    @payroll_period = PayrollPeriod.new
    @payroll_periods = PayrollPeriod.all
  end

  # GET /payroll_periods/1/edit
  def edit
  end

  # POST /payroll_periods
  # POST /payroll_periods.json
  def create
    @payroll_period = PayrollPeriod.new(payroll_period_params)
    @payroll_periods = PayrollPeriod.all
    respond_to do |format|
      if @payroll_period.save
        @payroll_period = PayrollPeriod.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Period Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /payroll_periods/1
  # PATCH/PUT /payroll_periods/1.json
  def update
    @payroll_period.update(payroll_period_params)
    @payroll_period = PayrollPeriod.new
    @payroll_periods = PayrollPeriod.all
  end

  # DELETE /payroll_periods/1
  # DELETE /payroll_periods/1.json
  def destroy
    @payroll_period.destroy
    @payroll_periods = PayrollPeriod.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_period
      @payroll_period = PayrollPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_period_params
      params.require(:payroll_period).permit(:from, :to, :status)
    end
end
