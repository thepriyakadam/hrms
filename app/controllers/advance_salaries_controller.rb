
# require 'query_report/helper' # need to require the helper
class AdvanceSalariesController < ApplicationController
  before_action :set_advance_salary, only: [:show, :edit, :update, :destroy]
  before_filter only: [:index]
  # ##load_and_authorize_resource
  # GET /advance_salaries
  # GET /advance_salaries.json
  # include QueryReport::Helper # need to include it
  def index
    @advance_salaries = AdvanceSalary.group("DATE_FORMAT(advance_date,'%Y')","DATE_FORMAT(advance_date,'%b')")
    # @advance_salaries = AdvanceSalary.group("strftime('%Y',advance_date)")
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
      column :id, sortable: true
      column(:advance_type, sortable: true) { |advance_salary| advance_salary.advance_type.try(:name) }
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
      @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin' 
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Account'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
     end

      respond_to do |f|
        f.js
        f.xls {render template: 'advance_salaries/advance_salary_xls.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'advance_salary',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'advance_salaries/advance_salary.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
  end

  def advance_salary_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Instalment"
  end

  def dynamic_report
    @month = params[:advance_salary][:month]
    @year = params[:advance_salary][:year]
    @company = params[:advance_salary][:company_id]
    @location = params[:advance_salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])

    if current_user.class == Group
      if @company == ""
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif @location == ""
        @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'advance_salaries/advance_salary_xls.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_employee_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'advance_salaries/advance_salary_pdf.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
   end

   def advance_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Instalment"
   end

   def show_employee_detail
    @employee_id = params[:employee_id]
    @employee = Employee.find_by(id: @employee_id)
    @advance_salaries = AdvanceSalary.where(employee_id: @employee_id)
    @advance_salary = AdvanceSalary.where(employee_id: @employee_id).pluck(:id)
    @advance_salary_id = AdvanceSalary.where(employee_id: @employee_id).take
    @instalments = Instalment.where(advance_salary_id: @advance_salary)
    
    respond_to do |f|
      f.js
      f.xls {render template: 'advance_salaries/employee_advance.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_employee_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'advance_salaries/employee_advance.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
   end

   def advance_detailed_report 
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Instalment"
   end

   def advance_detail
    @month = params[:advance_salary][:month]
    @year = params[:advance_salary][:year]
    @company = params[:advance_salary][:company_id]
    @location = params[:advance_salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    @compny = Company.find_by(id: @company)

    if current_user.class == Group
      if @company == ""
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #admin,branch
    end #group/member

      respond_to do |f|
      f.js
      f.xls {render template: 'advance_salaries/advance_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'advance_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'advance_salaries/advance_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
   end #def

   def  yearly_advance_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Instalment"
   end

   def yearly_advance
    @year = params[:advance_salary][:year]
    @company = params[:advance_salary][:company_id]
    @location = params[:advance_salary][:company_location_id]
    date = Date.new(@year.to_i)
    @compny = Company.find_by(id: @company)

    if current_user.class == Group
      if @company == ""
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
        @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @advance_salary_id = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @advance_salaries = AdvanceSalary.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee' 
      end #admin,branch
    end #group/member

      respond_to do |f|
        f.js
        f.xls {render template: 'advance_salaries/yearly_advance.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'yearly_advance',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'advance_salaries/yearly_advance.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
   end #def

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
