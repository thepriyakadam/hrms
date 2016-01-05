class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def find_employee_for_attendance
    p params
    @employee = Employee.find_by_manual_employee_code(params[:employee_code]) 
    p @employee
    respond_to do |format|
      if @employee.nil?
        format.js { @flag = true }
      else
        @employee_shift = EmployeeShift.find_by_employee_id(@employee.id)
        @company_shift = CompanyShift.find(@employee_shift.company_shift_id)
        @attendance = Attendance.new
        format.js { @flag = false }
      end
    end
  end

  def calculate_time
    start_time = params[:in_time].to_time
    end_time = params[:out_time].to_time

    seconds_diff = (start_time - end_time).to_i.abs

    @hours = seconds_diff / 3600
    seconds_diff -= @hours * 3600

    @minutes = seconds_diff / 60
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:employee_shift_id, :employee_id, :attendance_date, :check_in, :check_out, :company_hrs, :over_time_hrs, :total_hrs)
    end
end
