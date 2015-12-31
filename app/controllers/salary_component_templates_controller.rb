class SalaryComponentTemplatesController < ApplicationController
  def index
    @salary_components = SalaryComponent.all   
    @salary_template = SalaryTemplate.find(params[:format])
    @salary_component_templates = @salary_template.salary_component_templates
  end

  def new
    @salary_component_template = SalaryComponentTemplate.new
    @salary_component = SalaryComponent.find(params[:id]) 
    @salary_template = SalaryTemplate.find(params[:s])
  end

   def edit
    @salary_component_template = SalaryComponentTemplate.find(params[:id])
    @form = 'salary_component_template'
    @salary_template = @salary_component_template.salary_template
  end

  def create
    @salary_component_template = SalaryComponentTemplate.new(salary_component_template_params) 
    if @salary_component_template.save
      @salary_component_templates = SalaryComponentTemplate.where(salary_template_id: @salary_component_template.salary_template_id)
      flash[:notice] = "Salary Data Added Successfully."
      @flag = true
    else
      flash[:alert] = "Salary Data Not Added Successfully."
      @flag = false
    end
  end

  def update
    @salary_component_template = SalaryComponentTemplate.find(params[:id])
    @salary_component_templates = SalaryComponentTemplate.where(salary_template_id: @salary_component_template.salary_template_id)
    respond_to do |format|
      if @salary_component_template.update(salary_component_template_params)
        #format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        #format.json { render :show, status: :ok, location: @family }
        # @salary_component_templates = @salary_template.salary_component_templates
        format.js { @flag = true }
      else
        #format.html { render :edit }
        #format.json { render json: @family.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
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
      params.require(:salary_component_template).permit(:manual_template_code, :auto_template_code, :salary_template_id, :salary_component_id, :is_deducted, :parent_salary_component_id, :percentage, :is_taxable, :tax, :base, :to_be_paid, :max_amount, :monthly_amount, :annual_amount)
    end
end
