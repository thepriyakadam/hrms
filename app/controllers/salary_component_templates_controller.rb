class SalaryComponentTemplatesController < ApplicationController
  def index
    @salary_components = SalaryComponent.all
    @salary_template = SalaryTemplate.find(params[:format])
    @salary_component_templates = @salary_template.salary_component_templates
  end

  def new
    if params[:id] == ''
      @flag = false
    else
      @salary_component_template = SalaryComponentTemplate.new
      @salary_component = SalaryComponent.find(params[:id])
      @salary_template = SalaryTemplate.find(params[:s])
      @flag = true
    end
  end

  def edit
    @salary_component_template = SalaryComponentTemplate.find(params[:id])
    @salary_component = SalaryComponent.find(@salary_component_template.salary_component_id)
    @salary_template = @salary_component_template.salary_template
 end

  def create
    @salary_component_template = SalaryComponentTemplate.new(salary_component_template_params)
    @salary_component_template.is_deducted = nil if params[:salary_component_template][:is_deducted] == "CTC"
    parent = SalaryComponentTemplate.where(salary_template_id: @salary_component_template.salary_template_id, salary_component_id: @salary_component_template.parent_salary_component_id).take
    @salary_component_template.parent_id = parent.id unless parent.nil?
    @salary_component_templates = SalaryComponentTemplate.where(salary_template_id: @salary_component_template.salary_template_id)
    @flag = if @salary_component_template.save
              true
            else
              false
            end
  end

  def update
    @salary_component_template = SalaryComponentTemplate.find(params[:id])
    @salary_component_templates = SalaryComponentTemplate.where(salary_template_id: @salary_component_template.salary_template_id)
    respond_to do |format|
      if @salary_component_template.update(salary_component_template_params)
        format.js { @flag = true }
      else
        format.js { @flag = false }
      end
    end
  end

  def salary_template_page
    # byebug
    @salary_components = SalaryComponent.all
    @salary_template = SalaryTemplate.find(params[:format])
    @salary_component_templates = @salary_template.salary_component_templates
  end

  # def created_salary_component_template
  #   @employees = Employee.joins("inner join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id").uniq
  # end

  # def salary_component_template_slip
  #   @employee = Employee.find(params[:format])
  #   @items = @employee.employee_annual_salaries
  # end

  # def all_employee_monthly_salary
  #   @deducted_salary_components = SalaryComponent.deducted
  #   @addected_salary_components = SalaryComponent.addected
  #   @all_employee_annual_salaries = SalaryComponentTemplate.all
  #   @employees = Employee.joins("inner join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id").uniq
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_salary_component_template
    @salary_component_template = SalaryComponentTemplate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def salary_component_template_params
    params.require(:salary_component_template).permit(:manual_template_code, :salary_template_id, :salary_component_id, :is_deducted, :parent_salary_component_id, :percentage, :to_be_paid)
  end
end
