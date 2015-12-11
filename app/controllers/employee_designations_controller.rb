class EmployeeDesignationsController < ApplicationController
  before_action :set_employee_designation, only: [:show, :edit, :update, :destroy]

  def new
    @employee_designation = EmployeeDesignation.new
    @employee_designations = EmployeeDesignation.all
  end

  # GET /employee_designations/1/edit
  def edit
  end

  # POST /employee_designations
  # POST /employee_designations.json
  def create
    @employee_designation = EmployeeDesignation.new(employee_designation_params)
    @employee_designation.save
    @employee_designations = EmployeeDesignation.all
    @employee_designation = EmployeeDesignation.new
  end    

  # PATCH/PUT /employee_designations/1
  # PATCH/PUT /employee_designations/1.json
  def update
   @employee_designation.update(employee_designation_params)
   @employee_designations = EmployeeDesignation.all
   @employee_designation = EmployeeDesignation.new    
  end

  # DELETE /employee_designations/1
  # DELETE /employee_designations/1.json
  def destroy
    @employee_designation.destroy
    @employee_designations = EmployeeDesignation.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_designation
      @employee_designation = EmployeeDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_designation_params
      params.require(:employee_designation).permit(:name)
    end
end
