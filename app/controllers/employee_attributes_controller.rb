class EmployeeAttributesController < ApplicationController
  before_action :set_employee_attribute, only: [:show, :edit, :update, :destroy]

  # GET /employee_attributes
  # GET /employee_attributes.json
  def index
    @employee_attributes = EmployeeAttribute.all
  end

  # GET /employee_attributes/1
  # GET /employee_attributes/1.json
  def show
  end

  # GET /employee_attributes/new
  def new

    @employee_attribute = EmployeeAttribute.new
    @employee = Employee.find(params[:format])
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
  end

  # GET /employee_attributes/1/edit
  def edit
    @employee = Employee.find(@employee_attribute.employee_id)
     @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
  end

  # POST /employee_attributes
  # POST /employee_attributes.json
  def create
    @employee_attribute = EmployeeAttribute.new(employee_attribute_params)
    @employee = Employee.find(@employee_attribute.employee_id)
      if @employee_attribute.save
        @flag = true
        @employee_attribute = EmployeeAttribute.new
        @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
        else
        @flag = false
      end
  end

  # PATCH/PUT /employee_attributes/1
  # PATCH/PUT /employee_attributes/1.json
  def update

    @employee = Employee.find(@employee_attribute.employee_id)
    if @employee_attribute.update(employee_attribute_params)
         @flag = true
        @employee_attribute = EmployeeAttribute.new
        @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
      else
        @flag = false
      end
  end

  # DELETE /employee_attributes/1
  # DELETE /employee_attributes/1.json
  def destroy
    @employee = Employee.find(@employee_attribute.employee_id)
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
    @employee_attribute.destroy
    flash[:alert] = 'Deleted Successfully'
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_attribute
      @employee_attribute = EmployeeAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_attribute_params
      params.require(:employee_attribute).permit(:employee_id,:performance_period_id,:appraisee_id, :appraiser_id, :attribute_master_id, :definition_id, :weightage, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
