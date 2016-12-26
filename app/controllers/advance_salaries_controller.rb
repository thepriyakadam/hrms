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
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Advance"
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
      if current_user.role.name == 'GroupAdmin' 
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Account'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
     end
  end

  def dynamic_report
    # byebug
    @month = params[:advance_salary][:month]
    @year = params[:advance_salary][:year]
    @company = params[:advance_salary][:company_id]
    @location = params[:advance_salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])

    # if current_user.class == Group
      # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      # else
      #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      # end

      if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end

    # elsif current_user.class == Member
    #   if current_user.role.name == 'Company'
        # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
        # else
        #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        # end
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else 
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'CompanyLocation'
        # params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        # @employees = Employee.where(company_location_id: current_user.company_location_id,company_id: @company.to_i)
        # @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'SalaryAccount'
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else 
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'Department'
      #   @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      # elsif current_user.role.name == 'Superviser'
      # elsif current_user.role.name == 'Employee'
    #   # end
    # end

   end

   def advance_salary_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    # if current_user.class == Group
      # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      # else
      #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      # end

      if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end

    # elsif current_user.class == Member
    #   if current_user.role.name == 'Company'
        # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
        # else
        #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        # end
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else 
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'CompanyLocation'
        # params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        # @employees = Employee.where(company_location_id: current_user.company_location_id,company_id: @company.to_i)
        # @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'SalaryAccount'
      #   if @location == ""
      #     @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   elsif @company == ""
      #     @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   else 
      #     @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
      #     @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      #   end
      # elsif current_user.role.name == 'Department'
      #   @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      # elsif current_user.role.name == 'Superviser'
      # elsif current_user.role.name == 'Employee'
    #   # end
    # end
    respond_to do |format|
      format.xls {render template: 'advance_salaries/advance_salary_xls.xls.erb'}
    end
   end

   def advance_salary_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      # else
      #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
      #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      # end
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        # if params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
        # else
        #   @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #   @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        # end
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        # params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        # @employees = Employee.where(company_location_id: current_user.company_location_id,company_id: @company.to_i)
        # @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: current_user.company_location.company_id,company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
       elsif current_user.role.name == 'Branch'
        # params[:advance_salary][:company_location_id] == '' || params[:advance_salary][:company_id] == ''
        # @employees = Employee.where(company_location_id: current_user.company_location_id,company_id: @company.to_i)
        # @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: current_user.company_location.company_id,company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'AccountAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id) 
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'advance_salary',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'advance_salaries/advance_salary_pdf.pdf.erb',
                  :show_as_html => params[:debug].present?
                end
             end
   end
  # def dynamic_report
  #   # byebug
  #   @month = params[:food_deduction][:month]
  #   @year = params[:food_deduction][:year]
  #   @company = params[:food_deduction][:company_id]
  #   @location = params[:food_deduction][:company_location_id]
  #   date = Date.new(@year.to_i, Workingday.months[@month])
  #   if current_user.class == Group
  #     if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
  #       @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
  #     else
  #       @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
  #       @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
  #     end
  #   elsif current_user.class == Member
  #     if current_user.role.name == 'Company'
  #       if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
  #         @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
  #       else
  #         @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
  #         @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
  #       end
  #     elsif current_user.role.name == 'CompanyLocation'
  #       params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
  #       @employees = Employee.where(company_location_id: current_user.company_location_id)
  #       @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)

  #     elsif current_user.role.name == 'Department'
  #       @salaryslips = Salaryslip.where(department_id: current_user.department_id)
  #     elsif current_user.role.name == 'Superviser'
  #     elsif current_user.role.name == 'Employee'
  #     end
  #   end
  #  end

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
