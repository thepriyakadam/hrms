class ShiftRotationsController < ApplicationController
  before_action :set_shift_rotation, only: [:show, :edit, :update, :destroy]
  # GET /shift_rotations/new
  def new
    @shift_rotation = ShiftRotation.new
    @shift_rotations = ShiftRotation.all
    session[:active_tab] ="timemgmt"
  end

  # GET /shift_rotations/1/edit
  def edit
  end

  # POST /shift_rotations
  # POST /shift_rotations.json
  def create
    @shift_rotation = ShiftRotation.new(shift_rotation_params)
    @shift_rotations = ShiftRotation.all
    respond_to do |format|
      if @shift_rotation.save
        @shift_rotations = ShiftRotation.all
        @shift_rotation = ShiftRotation.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'ShiftRotation Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /shift_rotations/1
  # PATCH/PUT /shift_rotations/1.json
  def update
    @shift_rotation.update(shift_rotation_params)
    @shift_rotations = ShiftRotation.all
    @shift_rotation = ShiftRotation.new
  end

  # DELETE /shift_rotations/1
  # DELETE /shift_rotations/1.json
  def destroy
    @shift_rotation.destroy
    @shift_rotations = ShiftRotation.all
  end

  def collect_employee
    
    @shift_rotation = ShiftRotation.find(params[:id])
    @employees_array = ShiftRotation.collect_array(@shift_rotation)
    @employees = Employee.where(employee_id: @employees_array)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shift_rotation
    @shift_rotation = ShiftRotation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shift_rotation_params
    params.require(:shift_rotation).permit(:company_shift_id, :department_id, :start_date, :end_date)
  end
end
