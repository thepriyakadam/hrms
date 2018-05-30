class EmployeeShiftsController < ApplicationController
  before_action :set_employee_shift, only: [:show, :edit, :update, :destroy]

  # GET /employee_shifts
  # GET /employee_shifts.json
  def index
    # @employee_shifts = EmployeeShift.all
    @company_shifts = CompanyShift.all
  end

  # GET /employee_shifts/1
  # GET /employee_shifts/1.json
  def show
  end

  # GET /employee_shifts/new
  def new
    @employee_shift = EmployeeShift.new
    @employees = Employee.all
    @rotations = ShiftRotation.all
    session[:active_tab] ="timemgmt"
    # @employees = Employee.joins("LEFT JOIN employee_shifts on employees.id = employee_shifts.employee_id where employee_shifts.employee_id is null")
  end

  # GET /employee_shifts/1/edit
  def edit
  end

  # POST /employee_shifts
  # POST /employee_shifts.json
  def create
    @employees = params[:employee_ids]
    if @employees.nil?
      flash[:notice] = 'Select Employees.'
      render :new
    else
      @employees.each do |e|
        id = EmployeeShift.create(employee_id: e).id
        EmployeeShiftsShiftRotation.create(shift_rotation_id: params[:employee_shift][:id], employee_shift_id: id)
      end
      flash[:notice] = 'Employee assign successfully.'
      redirect_to new_employee_shift_path
    end
  end

  # PATCH/PUT /employee_shifts/1
  # PATCH/PUT /employee_shifts/1.json
  def update
    respond_to do |format|
      if @employee_shift.update(employee_shift_params)
        format.html { redirect_to @employee_shift, notice: 'Employee shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_shift }
      else
        format.html { render :edit }
        format.json { render json: @employee_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_shifts/1
  # DELETE /employee_shifts/1.json
  def destroy
    @employee_shift.destroy
    respond_to do |format|
      format.html { redirect_to employee_shifts_url, notice: 'Employee shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_of_shift
    @company_shift = CompanyShift.find(params[:format])
    @employee_shifts = @company_shift.employee_shifts
  end

  def shift_date
    @employee_shifts = EmployeeShift.where(company_shift_id: params[:format])
  end

  def shift_rotation
    @shift_rotations = ShiftRotation.where(company_shift_id: params[:format])
  end

  def employee_shift_list
    @shift_rotation = ShiftRotation.find(params[:format])
    @employee_shifts = @shift_rotation.employee_shifts
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_shift
    @employee_shift = EmployeeShift.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_shift_params
    params.require(:employee_shift).permit(:company_shift_id, :employee_id, :from_date, :to_date)
  end
end
