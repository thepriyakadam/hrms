class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.group("DATE_FORMAT(advance_date,'%Y')","DATE_FORMAT(advance_date,'%b')")
    #@loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    @emis = @loan.emis
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    start_date = @loan.advance_date

    for i in 1..@loan.no_of_instalment.to_i
      @loan.emis.build(instalment_amount: @loan.instalment_amount, istalment_date: start_date)
      start_date = start_date.next_month
    end
    if @loan.save
      flash[:notice] = 'Loan created successfully.'
      redirect_to @loan
    else
      flash.now[:alert] = 'Loan saved failed.'
      render :new
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        Emi.where(loan_id: @loan.id).destroy_all
        start_date = @loan.advance_date
        for i in 1..@loan.no_of_instalment.to_i
          #@loan.instalments.build(instalment_amount: @loan.instalment_amount, instalment_date: start_date)
          Emi.create(instalment_amount: @loan.instalment_amount,loan_id: @loan.id,istalment_date: start_date)
          start_date = start_date.next_month
        end
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    loan = @loan.id
    Emi.where(loan_id: loan).destroy_all
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def advances
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin' 
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Account'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
     end

      respond_to do |f|
        f.js
        f.xls {render template: 'loans/advance_loan.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'loan',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'loans/advance_loan.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
  end

  def advance_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="Loan"
    session[:active_tab2] ="Report"
   end

   def show_employee_detail
    @employee_id = params[:employee_id]
    @employee = Employee.find_by(id: @employee_id)
    @loans = Loan.where(employee_id: @employee_id)
    @loan = Loan.where(employee_id: @employee_id).pluck(:id)
    @loan_id = Loan.where(employee_id: @employee_id).take
    @emis = Emi.where(loan_id: @loan)
    
      respond_to do |f|
        f.js
        f.xls {render template: 'loans/employee_advance.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'show_employee_detail',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'loans/employee_advance.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
   end

   def loan_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="Loan"
    session[:active_tab2] ="Report"
  end

  def dynamic_report
    @month = params[:loan][:month]
    @year = params[:loan][:year]
    @company = params[:loan][:company_id]
    @location = params[:loan][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])

    if current_user.class == Group
      if @company == ""
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif @location == ""
        @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'loans/loan_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_employee_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'loans/loan_report.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
   end

   def yearly_report
   end

   def yearly_loan
    @year = params[:loan][:year]
    @company = params[:loan][:company_id]
    @location = params[:loan][:company_location_id]
    date = Date.new(@year.to_i)
    @compny = Company.find_by(id: @company)

    if current_user.class == Group
      if @company == ""
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
        @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'

        if @company == ""
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @loan_id = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?", @year).where(employee_id: @employees).take
          @loans = Loan.where("DATE_FORMAT(advance_date,'%Y') = ?",@year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee' 
      end #admin,branch
    end #group/member

      respond_to do |f|
        f.js
        f.xls {render template: 'loans/yearly_loan.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'yearly_loan',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'loans/yearly_loan.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
   end #def


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:types_of_loan_id,:employee_id, :advance_amount, :no_of_instalment, :instalment_amount, :advance_date, :interest)
    end
end
