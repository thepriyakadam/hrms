class GratuitiesController < ApplicationController
  before_action :set_gratuity, only: [:show, :edit, :update, :destroy]

  # GET /gratuities
  # GET /gratuities.json
  def index
    @gratuities = Gratuity.all
  end

  # GET /gratuities/1
  # GET /gratuities/1.json
  def show
  end

  # GET /gratuities/new
  def new
    @gratuity = Gratuity.new
  end

  # GET /gratuities/1/edit
  def edit
  end

  # POST /gratuities
  # POST /gratuities.json
  def create
    @gratuity = Gratuity.new(gratuity_params)
    @employee = Employee.find_by(id: @gratuity.employee_id)
    @joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
    @gratuity_master = GratuityMaster.where(is_active: true).take
    date = (@joining_date.leaving_date.to_date - @joining_detail.joining_date.to_date).to_i
    @year = (date/365).to_f
    if @year >= @gratuity_master.no_of_year.to_f
      @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee.id)
        @employee_salary_templates.try(:each) do |est|
          formula_string = @gratuity_master.base_component.split(',').map {|i| i.to_i}
          @employee_template = EmployeeTemplate.where(employee_id: @employee.id,is_active: true).take
          formula_item = EmployeeSalaryTemplate.where(salary_component_id: formula_string,employee_id: @employee.id,employee_template_id: @employee_template.id)  
          @total = formula_item.sum(:monthly_amount)
          @formula = @total.to_f * (@gratuity_master.payable_day.to_f/@gratuity_master.day_in_month.to_f) * @year
        end
      Gratuity.create(employee_id: @employee.id,no_of_year: @year,total_gratuity: @formula.round,gratuity_amount: @total,gratuity_master_id: @gratuity_master.id ,day: Date.today)
        flash[:notice] = "Gratuity Created successfully"
    else
      flash[:alert] = "Employee is not elligible for Gratuity"
    end
    redirect_to gratuities_path
  end

  # PATCH/PUT /gratuities/1
  # PATCH/PUT /gratuities/1.json
  def update
    respond_to do |format|
      if @gratuity.update(gratuity_params)
        format.html { redirect_to @gratuity, notice: 'Gratuity was successfully updated.' }
        format.json { render :show, status: :ok, location: @gratuity }
      else
        format.html { render :edit }
        format.json { render json: @gratuity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gratuities/1
  # DELETE /gratuities/1.json
  def destroy
    @gratuity.destroy
    respond_to do |format|
      format.html { redirect_to gratuities_url, notice: 'Gratuity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gratuity
      @gratuity = Gratuity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gratuity_params
      params.require(:gratuity).permit(:is_confirm,:employee_id, :no_of_year, :base_component, :total_gratuity)
    end
end
