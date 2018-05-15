class MonthlyExpencesController < ApplicationController
  before_action :set_monthly_expence, only: [:show, :edit, :update, :destroy]

  # GET /monthly_expences
  # GET /monthly_expences.json
  def index
    @monthly_expences = MonthlyExpence.group("DATE_FORMAT(expence_date,'%Y')","DATE_FORMAT(expence_date,'%b')")

    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PeriodicComponents"
  end

  # GET /monthly_expences/1
  # GET /monthly_expences/1.json
  def show
  end

  # GET /monthly_expences/new
  def new
    @monthly_expence = MonthlyExpence.new
    
  end

  # GET /monthly_expences/1/edit
  def edit
  end

  # POST /monthly_expences
  # POST /monthly_expences.json
  def create
    # byebug
    @monthly_expence = MonthlyExpence.new(monthly_expence_params)
    @employee = Employee.find(@monthly_expence.employee_id)
    len = params['monthly_expence'].length - 4
    for i in 3..len
      @employee.monthly_expences.build(expence_date: params['monthly_expence'][i.to_s]['expence_date'], expencess_type_id: params['monthly_expence'][i.to_s]['expencess_type_id'],amount: params['monthly_expence'][i.to_s]['amount'],description: params['monthly_expence']['description'])
    end
    @employee.monthly_expences.build(monthly_expence_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to monthly_expences_path, notice: 'Monthly expence was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_expence }
      else
        flash.now[:alert] = 'Monthly Expences Not Save please try again'
        format.html { render 'monthly_expences/new' }
        format.json { render json: @monthly_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_expences/1
  # PATCH/PUT /monthly_expences/1.json
  def update
    respond_to do |format|
      if @monthly_expence.update(monthly_expence_params)
        format.html { redirect_to monthly_expences_path, notice: 'Monthly expence was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_expence }
      else
        format.html { render :edit }
        format.json { render json: @monthly_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_expences/1
  # DELETE /monthly_expences/1.json
  def destroy
    @monthly_expence.destroy
    respond_to do |format|
      format.html { redirect_to monthly_expences_url, notice: 'Monthly expence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal
    @m = MonthlyExpence.find(params[:format])
  end

  def employees
    @year = params[:year]
    @month = params[:month]
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).group(:employee_id)
    else
      if current_user.role.name == 'GroupAdmin' 
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT( expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT( expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
       elsif current_user.role.name == 'Account'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Employee'
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
  end

  def employee_expences
    @month = params[:month]
    @year = params[:year]
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin' 
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
       elsif current_user.role.name == 'Account'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Employee'
        @monthly_expences = MonthlyExpence.where("DATE_FORMAT(expence_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'monthly_expences/monthly_expences.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'monthly_expences/monthly_expences.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def monthly_expence_report
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def dynamic_report
    from = params[:employee][:from]
    to = params[:employee][:to]
    @company_id = params[:employee][:company_id]
    @location = params[:employee][:company_location_id]
    @from = from.to_date
    @to = to.to_date
    if current_user.class == Group
      if @company_id == ""
        @monthly_expences = MonthlyExpence.where(expence_date: @from..@to)
      elsif @location == "" || @location == nil
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i).pluck(:id)
        @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to)
        elsif @location == "" || @location == nil
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        elsif @location == "" || @location == nil
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == "" || @location == nil
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @location == nil
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i).pluck(:id)
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Superviser'
        if @company_id == "" || @location == "" || @location == nil
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @monthly_expences = MonthlyExpence.where(expence_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
      respond_to do |f|
      f.js
      f.xls {render template: 'monthly_expences/monthly_expences.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'monthly_expences/monthly_expences.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import_monthly_expence
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_monthly_expence_monthly_expences_path
    else
    MonthlyExpence.import(params[:file])
    redirect_to monthly_expences_path, notice: "File imported."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monthly_expence
    @monthly_expence = MonthlyExpence.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monthly_expence_params
    params.require(:monthly_expence).permit(:is_paid,:expence_date, :amount, :employee_id, :expencess_type_id,:description)
  end
end
# MonthlyExpence.where("strftime('%m/%Y', created_at) = ?", '12/02/2016'.to_date.strftime('%m/%Y'))
# select *, strftime('%Y',expence_date) as month from monthly_expences;
