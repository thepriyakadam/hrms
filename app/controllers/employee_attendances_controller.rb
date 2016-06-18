class EmployeeAttendancesController < ApplicationController
  before_action :set_employee_attendance, only: [:show, :edit, :update, :destroy]

  # GET /employee_attendances
  # GET /employee_attendances.json
  def index
    @employee_attendances = EmployeeAttendance.all
  end

  # GET /employee_attendances/1
  # GET /employee_attendances/1.json
  def show
  end

  # GET /employee_attendances/new
  def new
    @employee_attendance = EmployeeAttendance.new
  end

  # GET /employee_attendances/1/edit
  def edit
  end

  # POST /employee_attendances
  # POST /employee_attendances.json
  def create
    @employee_attendance = EmployeeAttendance.new(employee_attendance_params)

    respond_to do |format|
      if @employee_attendance.save
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully created.' }
        format.json { render :show, status: :created, location: @employee_attendance }
      else
        format.html { render :new }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_attendances/1
  # PATCH/PUT /employee_attendances/1.json
  def update
    respond_to do |format|
      if @employee_attendance.update(employee_attendance_params)
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_attendance }
      else
        format.html { render :edit }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_attendances/1
  # DELETE /employee_attendances/1.json
  def destroy
    @employee_attendance.destroy
    respond_to do |format|
      format.html { redirect_to employee_attendances_url, notice: 'Employee attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_attendance
      @employee_attendance = EmployeeAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_attendance_params
      params.require(:employee_attendance).permit(:employee_id, :day, :present, :in, :out)
    end
end