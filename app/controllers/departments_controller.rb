class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def new
    @department = Department.new
    @departments = Department.all
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)
    @department.save
    @departments = Department.all
    @department = Department.new
    
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
     @department.update(department_params)
     @departments = Department.all
     @department = Department.new   
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    @departments = Department.all
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:company_location_id, :name, :department_type_id, :contact_no, :description)
    end
end
