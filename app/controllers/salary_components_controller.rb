class SalaryComponentsController < ApplicationController
  before_action :set_salary_component, only: [:show, :edit, :update, :destroy]

  def new
    @salary_component = SalaryComponent.new
    @salary_components = SalaryComponent.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="SalarySetup"
  end

  # GET /salary_components/1/edit
  def edit
    # @salary_components = SalaryComponent.all
    # @salary_component = SalaryComponent.new
  end

  # POST /salary_components
  # POST /salary_components.json
  def create
    @salary_component = SalaryComponent.new(salary_component_params)
    @salary_components = SalaryComponent.all
    respond_to do |format|
      if @salary_component.save
        @salary_component = SalaryComponent.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Salary Component is Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /salary_components/1
  # PATCH/PUT /salary_components/1.json
  def update
    @salary_component.update(salary_component_params)
    @salary_components = SalaryComponent.all
    @salary_component = SalaryComponent.new
  end

  # DELETE /salary_components/1
  # DELETE /salary_components/1.json
  def destroy
    @salary_component.destroy
    @salary_components = SalaryComponent.all
  end

  def create_employee_template
  end

  def is_confirm
    @salary_component = SalaryComponent.find(params[:salary_component])
    SalaryComponent.find(@salary_component.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_salary_component_path
  end

  def modal
    @salary_component = SalaryComponent.find(params[:format])
  end
  
  def salary_component_list
    @salary_components = SalaryComponent.all
    respond_to do |f|
    f.js
    f.xls {render template: 'salary_components/salary_component_list.xls.erb'}
    f.html
    f.pdf do
      render pdf: 'salary_component_list',
      layout: 'pdf.html',
      orientation: 'Landscape',
      template: 'salary_components/salary_component_list.pdf.erb',
      show_as_html: params[:debug].present?
      #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_xl_salary_components_path
    else
      SalaryComponent.import(params[:file])
      redirect_to new_salary_component_path, notice: "File imported."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_salary_component
    @salary_component = SalaryComponent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def salary_component_params
    params.require(:salary_component).permit(:is_confirm,:name, :is_base,:is_active,:is_deducted, :code, :parent_id, :description,:account_code)
  end
end
