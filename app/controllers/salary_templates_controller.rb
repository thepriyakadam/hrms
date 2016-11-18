class SalaryTemplatesController < ApplicationController
  before_action :set_salary_template, only: [:show, :edit, :update, :destroy]

  # GET /salary_templates
  # GET /salary_templates.json
  def index
  end

  # GET /salary_templates/1
  # GET /salary_templates/1.json
  def show
  end

  # GET /salary_templates/new
  def new
    @salary_template = SalaryTemplate.new
    @salary_templates = SalaryTemplate.all
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salarymaster"
  end

  # GET /salary_templates/1/edit
  def edit
  end

  # POST /salary_templates
  # POST /salary_templates.json
  def create
    @salary_template = SalaryTemplate.new(salary_template_params)
    @salary_templates = SalaryTemplate.all
    respond_to do |format|
      if @salary_template.save
        @salary_template = SalaryTemplate.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'SalaryTemplate Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /salary_templates/1
  # PATCH/PUT /salary_templates/1.json
  def update
    @salary_template.update(salary_template_params)
    @salary_templates = SalaryTemplate.all
    @salary_template = SalaryTemplate.new
  end

  # DELETE /salary_templates/1
  # DELETE /salary_templates/1.json
  def destroy
    @salary_template.destroy
    @salary_templates = SalaryTemplate.all
  end

  def is_confirm
    @salary_template = SalaryTemplate.find(params[:salary_template])
    SalaryTemplate.find(@salary_template.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_salary_template_path
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_salary_template
    @salary_template = SalaryTemplate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def salary_template_params
    params.require(:salary_template).permit(:code, :description, :validity_date,:is_active,:is_confirm)
  end
end
