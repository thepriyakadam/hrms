class EmployeeWeekOffsController < ApplicationController
  before_action :set_employee_week_off, only: [:show, :edit, :update, :destroy]

  # GET /employee_week_offs
  # GET /employee_week_offs.json
  def index
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="AttendanceSetup"
  end

  # GET /employee_week_offs/1
  # GET /employee_week_offs/1.json
  def show
  end

  # GET /employee_week_offs/new
  def new
    @employee_week_off = EmployeeWeekOff.new
  end

  # GET /employee_week_offs/1/edit
  def edit
  end

  # POST /employee_week_offs
  # POST /employee_week_offs.json
  def create
    @employee_week_off = EmployeeWeekOff.new(employee_week_off_params)

    respond_to do |format|
      if @employee_week_off.save
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully created.' }
        format.json { render :show, status: :created, location: @employee_week_off }
      else
        format.html { render :new }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_week_offs/1
  # PATCH/PUT /employee_week_offs/1.json
  def update
    respond_to do |format|
      if @employee_week_off.update(employee_week_off_params)
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_week_off }
      else
        format.html { render :edit }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_week_offs/1
  # DELETE /employee_week_offs/1.json
  def destroy
    @employee_week_off.destroy
    respond_to do |format|
      format.html { redirect_to employee_week_offs_url, notice: 'Employee week off was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_week_off_list
    from_date = params[:employee_week_off][:from_date]
    to_date = params[:employee_week_off][:to_date]
    employee = params[:employee_week_off][:employee_id]
    @employee_week_offs = EmployeeWeekOff.where(date: from_date.to_date..to_date.to_date,employee_id: employee)
  end

  def revert_week_off
    @employee_week_off = EmployeeWeekOff.find(params[:format])
    EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @employee_week_off.date).destroy_all
    @employee_week_off.destroy
    flash[:notice] = "Revert successfully"
    redirect_to employee_week_offs_path
  end

  def edit_week_off_modal
    @employee_week_off = EmployeeWeekOff.find(params[:format])
  end

  def edit_week_off
    date = params[:employee_week_off][:date]
    @date = date.to_date
    day = @date.strftime('%a')
    employee_week_off_id = params[:employee_week_off_id]
    @employee_week_off = EmployeeWeekOff.find_by(id: employee_week_off_id)
    @employee_attendance = EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @employee_week_off.date).take
    
    if @employee_week_off.is_present(@date,@employee_week_off.employee_id)
      @emp_atten = EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @date).take
      if @emp_atten.employee_leav_request_id == nil && @emp_atten.on_duty_request_id == nil
        @emp_atten.update(present: "W")
        @employee_week_off.update(day: day,date: @date)
        @employee_attendance.destroy
      else
        flash[:alert] = "Attendance Available!"
      end
    else
      EmployeeAttendance.create(employee_id: @employee_week_off.employee_id,day: @date,present: "W",department_id: @employee_week_off.try(:employee).try(:department_id)) 
      @employee_week_off.update(day: day,date: @date)
      @employee_attendance.destroy
    end
    flash[:notice] = "Updated successfully"
    redirect_to employee_week_offs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_week_off
      @employee_week_off = EmployeeWeekOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_week_off_params
      params.require(:employee_week_off).permit(:week_off_master_id, :employee_id, :day, :date, :status, :is_confirm)
    end
end
