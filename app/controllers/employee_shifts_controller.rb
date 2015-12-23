class EmployeeShiftsController < ApplicationController
  before_action :set_employee_shift, only: [:show, :edit, :update, :destroy]

  # GET /employee_shifts
  # GET /employee_shifts.json
  def index
    @employee_shifts = EmployeeShift.all
  end

  # GET /employee_shifts/1
  # GET /employee_shifts/1.json
  def show
  end

  # GET /employee_shifts/new
  def new
    @employee_shift = EmployeeShift.new
    @employees = Employee.all
  end

  # GET /employee_shifts/1/edit
  def edit
  end

  # POST /employee_shifts
  # POST /employee_shifts.json
  def create
    @employee_shift = params["employee_shift"]["company_shift_id"]
    @employee_ids = params["employee_ids"]
    @employee_shifts = EmployeeShift.all

    @employee_ids.try(:each) do |e|
      EmployeeShift.new do |es|
        es.employee_id = e
        es.company_shift_id = @employee_shift
        es.save
      end
    end

    flash[:notice] = "Employee shift allowed successfully."
    redirect_to employee_shifts_path
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_shift
      @employee_shift = EmployeeShift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_shift_params
      params.require(:employee_shift).permit(:company_shift_id, :employee_id)
    end
end
