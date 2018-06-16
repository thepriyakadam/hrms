class AttendanceRegularizationsController < ApplicationController
  before_action :set_attendance_regularization, only: [:show, :edit, :update, :destroy]
   
  # GET /attendance_regularizations
  # GET /attendance_regularizations.json
  def index
    @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
    @attendance_regularization = AttendanceRegularization.new
  end

  # GET /attendance_regularizations/1
  # GET /attendance_regularizations/1.json
  def show
  end

  # # GET /attendance_regularizations/new
  def new
    @attendance_regularization = AttendanceRegularization.new
  end

  # GET /attendance_regularizations/1/edit
  def edit
  end

  def show_attendance_regularization
    attendance_regularizations_id = params[:format]
    @attendance_regularizations = AttendanceRegularization.find(attendance_regularizations_id)
  end

  def attendance_regularization_approve
    @att_approve_list = AttendanceRegularization.where(manager_id: current_user.employee_id)
  end

  def approve_attendance
    att_approve_id = params[:format]
    @att_approve = AttendanceRegularization.find(att_approve_id)
    @att_approve.update(status: "Approved")
    redirect_to attendance_regularization_approve_attendance_regularizations_path
  end

  def rejected_attendance
    att_rejected_id = params[:format]
    @att_rejected = AttendanceRegularization.find(att_rejected_id)
    @att_rejected.update(status: "Rejected")
    redirect_to attendance_regularization_approve_attendance_regularizations_path
  end

  def emp_attendance_details
    att_regula_id = params[:format]
    @att_rejected = AttendanceRegularization.find(att_regula_id)
    date = @att_rejected.date
    employee_id = @att_rejected.employee_id
    @emp_att = EmployeeAttendance.where(employee_id: employee_id, day: date.to_date)
  end

  def view_resaon
    reason_id = params[:format]
    @plan_reason = PlanReasonMaster.find(reason_id)
  end
  # POST
  # POST /attendance_regularizations
  # POST /attendance_regularizations.json
  def create
    @attendance_regularization = AttendanceRegularization.new(attendance_regularization_params)
    if @attendance_regularization.save
      attendance_regularization = AttendanceRegularization.new 
      @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
      @flag = true
    else 
      @flag = false
    end
    redirect_to attendance_regularizations_path
  end

  # PATCH/PUT /attendance_regularizations/1
  # PATCH/PUT /attendance_regularizations/1.json
  def update
    if @attendance_regularization.update(attendance_regularization_params)
      attendance_regularization = AttendanceRegularization.new 
      @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /attendance_regularizations/1
  # DELETE /attendance_regularizations/1.json
  def destroy
    @attendance_regularization.destroy
    redirect_to attendance_regularizations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_regularization
      @attendance_regularization = AttendanceRegularization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_regularization_params
      params.require(:attendance_regularization).permit(:employee_id, :date, :status, :regularization_reason_id, :justification, :manager_id)
    end
end
