class EmployeeMonthlyDaysController < ApplicationController
  before_action :set_employee_monthly_day, only: [:show, :edit, :update, :destroy]

  # GET /employee_monthly_days
  # GET /employee_monthly_days.json
  def index
    @employee_monthly_days = EmployeeMonthlyDay.all
  end

  # GET /employee_monthly_days/1
  # GET /employee_monthly_days/1.json
  def show
  end

  # GET /employee_monthly_days/new
  def new
    @employee_monthly_day = EmployeeMonthlyDay.new
  end

  # GET /employee_monthly_days/1/edit
  def edit
  end

  # POST /employee_monthly_days
  # POST /employee_monthly_days.json
  def create
    @employee_monthly_day = EmployeeMonthlyDay.new(employee_monthly_day_params)

    respond_to do |format|
      if @employee_monthly_day.save
        format.html { redirect_to @employee_monthly_day, notice: 'Employee monthly day was successfully created.' }
        format.json { render :show, status: :created, location: @employee_monthly_day }
      else
        format.html { render :new }
        format.json { render json: @employee_monthly_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_monthly_days/1
  # PATCH/PUT /employee_monthly_days/1.json
  def update
    respond_to do |format|
      if @employee_monthly_day.update(employee_monthly_day_params)
        format.html { redirect_to @employee_monthly_day, notice: 'Employee monthly day was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_monthly_day }
      else
        format.html { render :edit }
        format.json { render json: @employee_monthly_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_monthly_days/1
  # DELETE /employee_monthly_days/1.json
  def destroy
    @employee_monthly_day.destroy
    respond_to do |format|
      format.html { redirect_to employee_monthly_days_url, notice: 'Employee monthly day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_employee_for_employee_monthly_day
    @employee = Employee.find_by_manual_employee_code(params[:employee_id])
    respond_to do |format|
      if @employee.nil?
        format.js { @flag = true }
      else
        @employee_monthly_day = EmployeeMonthlyDay.new
        format.js { @flag = false }
      end
    end
 end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_monthly_day
    @employee_monthly_day = EmployeeMonthlyDay.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_monthly_day_params
    params.require(:employee_monthly_day).permit(:employee_id, :month, :year_id, :no_of_working_day, :overtime)
  end
end
