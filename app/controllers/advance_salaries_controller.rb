require 'query_report/helper' # need to require the helper
class AdvanceSalariesController < ApplicationController
  before_action :set_advance_salary, only: [:show, :edit, :update, :destroy]
  before_filter only: [:index]
  load_and_authorize_resource
  # GET /advance_salaries
  # GET /advance_salaries.json
  include QueryReport::Helper # need to include it
  def index
    @advance_salaries = AdvanceSalary.group("strftime('%Y',advance_date)")
    session[:active_tab] ="payroll"
    session[:active_tab1] ="montlyamount"
  end

  # GET /advance_salaries/1
  # GET /advance_salaries/1.json
  def show
    @instalments = @advance_salary.instalments
  end

  # GET /advance_salaries/new
  def new
    @advance_salary = AdvanceSalary.new
  end

  # GET /advance_salaries/1/edit
  def edit
  end

  # POST /advance_salaries
  # POST /advance_salaries.json
  def create
    @advance_salary = AdvanceSalary.new(advance_salary_params)
    start_date = @advance_salary.advance_date
    #end_date = start_date + @advance_salary.no_of_instalment.to_i
    for i in 1..@advance_salary.no_of_instalment.to_i
      @advance_salary.instalments.build(instalment_amount: @advance_salary.instalment_amount, instalment_date: start_date)
      start_date = start_date.next_month
    end

    if @advance_salary.save
      flash[:notice] = 'Advance Salary created successfully.'
      redirect_to @advance_salary
    else
      flash.now[:alert] = 'Advance Salary saved failed.'
      render :new
    end
  end

  # PATCH/PUT /advance_salaries/1
  # PATCH/PUT /advance_salaries/1.json
  def update
    respond_to do |format|
      if @advance_salary.update(advance_salary_params)
        format.html { redirect_to @advance_salary, notice: 'Advance salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @advance_salary }
      else
        format.html { render :edit }
        format.json { render json: @advance_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_salaries/1
  # DELETE /advance_salaries/1.json
  def destroy
    @advance_salary.destroy
    respond_to do |format|
      format.html { redirect_to advance_salaries_url, notice: 'Advance salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_by_advance_date
    reporter(@advance_salaries, template_class: PdfReportTemplate) do
      filter :advance_date, type: :date
      column(:manual_employee_code, sortable: true) { |advance_salary| advance_salary.employee.try(:manual_employee_code) }
      column(:first_name, sortable: true) { |advance_salary| full_name(advance_salary.employee) }
      column :advance_date, sortable: true, pdf: { width: 65 }
      column :advance_amount, sortable: true
      column :no_of_instalment, sortable: true
      column :instalment_amount, sortable: true
    end
  end

  def advances
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'Company' || current_user.role.name == 'Account'
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
       elsif current_user.role.name == 'SalaryAccount'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
     end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_advance_salary
    @advance_salary = AdvanceSalary.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advance_salary_params
    params.require(:advance_salary).permit(:employee_id, :advance_amount, :no_of_instalment, :instalment_amount, :advance_date, :advance_type_id, :interest)
  end
end
