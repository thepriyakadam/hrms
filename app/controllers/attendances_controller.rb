require 'query_report/helper' # need to require the helper
class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource
  # GET /attendances
  # GET /attendances.json
  include QueryReport::Helper # need to include it
  def index
    if current_user.class == Group
      @attendances = Attendance.all
    else
      if current_user.role.name == 'GroupAdmin'
        @attendances = Attendance.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
        @attendances = Attendance.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
        @attendances = Attendance.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
        @attendances = Attendance.where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @attendances = Attendance.where(employee_id: current_user.employee_id)
      end
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    session[:active_tab] ="timemgmt"
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    # @employee_shifts = params[:employee_shift_ids]
    @employees = params[:employee_ids]
    # @employee_and_employee_shift = Hash[@employees.zip(@employee_shifts)]

    @employees.each do |e|
      @attendance = Attendance.new(attendance_params)
      @attendance.employee_id = e
      # @attendance.employee_shift_id =
      @attendance.save
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
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_shift_date
    if params[:company_shift_id] == ''
      @flag = false
    else
      @flag = true
      @company_shift = CompanyShift.find(params[:company_shift_id])
      @shift_rotations = @company_shift.shift_rotations
    end
  end

  def collect_employee
    if params[:shift_rotation_id] == ''
      @flag = false
    else
      @flag = true
      @shift_rotation = ShiftRotation.find(params[:shift_rotation_id])
      @employees = @shift_rotation.employee_shifts
      @attendance = Attendance.new
    end
  end

  def search_by_date
    reporter(@attendances, template_class: PdfReportTemplate) do
      filter :attendance_date, type: :date
      column(:manual_employee_code, sortable: true) { |attendance| attendance.employee.try(:manual_employee_code) }
      column(:first_name, sortable: true) { |attendance| full_name(attendance.employee) }
      column :attendance_date, sortable: true
      column :check_in, sortable: true
      column :check_out, sortable: true
      column :over_time_hrs, sortable: true
      column :total_hrs, sortable: true
    end
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
