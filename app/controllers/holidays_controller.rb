class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]

  # GET /holidays/new
  def new
    @holiday = Holiday.new
    @holidays = Holiday.all
    session[:active_tab] ="timemgmt"
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)
    @holidays = Holiday.all
    respond_to do |format|
      if @holiday.save
        @holiday = Holiday.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Holiday Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    @holiday.update(holiday_params)
    @holidays = Holiday.all
    @holiday = Holiday.new
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    @holidays = Holiday.all
  end

  def assign_to_employee
    holiday = Holiday.find(params[:format])
    holiday.update(is_send: true)
    Employee.where(status: 'Active').each do |e|
      EmployeeAttendance.create(employee_id: e.id, day: holiday.holiday_date, present: "HD", department_id: e.department_id, is_confirm: false, count: 1)
    end
    @holidays = Holiday.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def holiday_params
    params.require(:holiday).permit(:is_taken,:code, :name, :description, :holiday_date)
  end
end
