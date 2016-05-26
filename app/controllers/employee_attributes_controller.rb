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
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id, is_confirm: nil)
  end

  # GET /employee_attributes/1/edit
  def edit
    @employee = Employee.find(@employee_attribute.employee_id)
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id, is_confirm: nil)
  end

  # POST /employee_attributes
  # POST /employee_attributes.json
  def create
    @employee_attribute = EmployeeAttribute.new(employee_attribute_params)
    @employee = Employee.find(@employee_attribute.employee_id)
    attribute_weightage_sum = @employee_attribute.attribute_weightage_sum(@employee_attribute)
    if attribute_weightage_sum > 100
      @flag = false
    else
      @employee_attribute.save
      @employee_attribute = EmployeeAttribute.new
      @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id, is_confirm: nil)
      @flag = true
    end
  end

  # PATCH/PUT /employee_attributes/1
  # PATCH/PUT /employee_attributes/1.json
  def update
    @employee = Employee.find(@employee_attribute.employee_id)
    attribute_weightage_sum = @employee_attribute.attribute_weightage_sumdate(@employee_attribute, params[:employee_attribute][:weightage])
    if attribute_weightage_sum > 100
      @flag = false
    else
      @employee_attribute.update(employee_attribute_params)
      @employee_attribute = EmployeeAttribute.new
      @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id, is_confirm: nil)
      @flag = true
    end
  end

  # DELETE /employee_attributes/1
  # DELETE /employee_attributes/1.json
  def destroy
    @employee = Employee.find(@employee_attribute.employee_id)
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id, is_confirm: nil)
    @employee_attribute.destroy
    flash[:alert] = 'Deleted Successfully'
  end

  def show_list
    @employee_goal = EmployeeGoal.new
    @employee_goals = EmployeeGoal.where(employee_id: current_user.employee_id ,is_confirm: true) 
    @employee_attributes = EmployeeAttribute.where(employee_id: current_user.employee_id,is_confirm: true)
  end

  def is_confirm
    @employee = Employee.find(params[:id])
    @employee_attribute_ids = params[:employee_attribute_ids]
    if @employee_attribute_ids.nil?
      flash[:alert] = "Please Select the attribute"
    else
      confirm_employee_attribute      
    end
    redirect_to new_employee_attribute_path(@employee.id)
  end
  
  def single_attribute
    @employee_attribute = EmployeeAttribute.new
    @employee = Employee.all
    @employee_attributes = EmployeeAttribute.all 
  end

  def create_attribute
    @employee = Employee.all
    @employees.each do |e|
      @employee_attribute = EmployeeAttribute.new(employee_attribute_params)
      @employee_attribute.employee_id = e.id
      @employee_attribute.save
      gr = GoalRatingSheet.new
      gr.employee_attribute_id = @employee_attribute.id
      gr.save
      flash[:notice] = "Attributes set Successfully"
      #@employee_attribute.update(is_confirm: true)
    end
    redirect_to single_attribute_employee_attributes_path
  end

  def is_confirm_all
    @employee = Employee.all

    @employee_attribute_ids = params[:employee_attribute_ids]
    if @employee_attribute_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_employee_attribute_path
    else
      @employee_attribute_ids.each do |aid|
      @employee_attribute = EmployeeAttribute.find(aid)
      @employee_attribute.update(is_confirm: true)

      AttributeRatingSheet.create(employee_attribute_id: @employee_attribute.id)
      
      flash[:notice] = "Confirmed Successfully"
      end 
      redirect_to new_employee_attribute_path
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

  def confirm_employee_attribute
    employee_attribute = EmployeeAttribute.where(id: @employee_attribute_ids)
    period_array = employee_attribute.pluck(:performance_period_id)
    if period_array.uniq.length == 1
      sum = employee_attribute.sum(:weightage)
      if sum == 100
        @employee_attribute_ids.each do |eid|
          @employee_attribute = EmployeeAttribute.find(eid)
          @employee_attribute.update(is_confirm: true)
          AttributeRatingSheet.create(appraisee_id: @employee.id, employee_attribute_id: @employee_attribute.id)
        end
        flash[:notice] = "Confirmed Successfully."
      else
        flash[:alert] = "Total attribute weightage must be 100%."
      end
    else
      flash[:alert] = "Please select uniq period."
    end
  end
end
