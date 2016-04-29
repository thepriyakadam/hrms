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

  def show_list
    @employee_goal = EmployeeGoal.new
    @employee = Employee.find(params[:format])
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id) 
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
  end

  def is_confirm
    @employee = Employee.find(params[:id])

    @employee_attribute_ids = params[:employee_attribute_ids]
    if @employee_attribute_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_employee_attribute_path(@employee.id)
    else
      @employee_attribute_ids.each do |aid|
      @employee_attribute = EmployeeAttribute.find(aid)
      @employee_attribute.update(is_confirm: true)

      AttributeRatingSheet.create(appraisee_id: @employee.id, employee_attribute_id: @employee_attribute.id)
      
      flash[:notice] = "Confirmed Successfully"
    end  
     redirect_to new_employee_attribute_path(@employee_attribute.employee_id) 
  end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_attribute
    @employee_attribute = EmployeeAttribute.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_attribute_params
    params.require(:employee_attribute).permit(:emp_head,:is_confirm,:employee_id, :performance_period_id, :attribute_master_id, :definition_id, :weightage, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
  end
end
