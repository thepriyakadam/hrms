class InstalmentsController < ApplicationController
  before_action :set_instalment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /instalments
  # GET /instalments.json
  def index
    @instalments = Instalment.where.not(instalment_date: nil).group("strftime('%Y',instalment_date)")
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="AdvanceSalary"
    session[:active_tab2] ="Instalment"
  end

  # GET /instalments/1
  # GET /instalments/1.json
  def show
    @advance_salary = @instalment.advance_salary
  end

  # GET /instalments/new
  def new
    @advance_salary = AdvanceSalary.find(params[:format])
    @instalment = Instalment.new
  end

  # GET /instalments/1/edit
  def edit
    @advance_salary = @instalment.advance_salary
  end

  # POST /instalments
  # POST /instalments.json
  def create
    @instalment = Instalment.new(instalment_params)
    @advance_salary = AdvanceSalary.find(params[:instalment][:advance_salary_id])
    amount = @advance_salary.instalments.where(is_complete: false).sum('instalment_amount')
    if @instalment.instalment_amount > amount
      flash[:alert] = 'Amount exceed the limit.'
      render :new
    else
      respond_to do |format|
        if @instalment.save
          format.html { redirect_to @advance_salary, notice: 'Instalment was successfully created.' }
          format.json { render :show, status: :created, location: @instalment }
        else
          format.html { render :new }
          format.json { render json: @instalment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /instalments/1
  # PATCH/PUT /instalments/1.json
  def update
    @advance_salary = @instalment.advance_salary
    respond_to do |format|
      if @instalment.update(instalment_params)
        format.html { redirect_to @advance_salary, notice: 'Instalment was successfully updated.' }
        format.json { render :show, status: :ok, location: @instalment }
      else
        format.html { render :edit }
        format.json { render json: @instalment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instalments/1
  # DELETE /instalments/1.json
  def destroy
    @instalment.destroy
    respond_to do |format|
      format.html { redirect_to instalments_url, notice: 'Instalment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display_installment
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'Company' || current_user.role.name == 'SalaryAccount'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'CompanyLocation' || current_user.role.name == 'SalaryAccount'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advance_salaries)
      elsif current_user.role.name == 'Employee'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
  end

  # def employees
  #   date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
  #   if current_user.class == Group
  #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
  #   else
  #     if current_user.role.name == 'Company' || current_user.role.name == 'Account'
  #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
  #     elsif current_user.role.name == 'CompanyLocation'
  #       @employees = Employee.where(company_location_id: current_user.company_location_id)
  #       @advance_salaries = AdvanceSalary.where(employee_id: @employees)
  #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advance_salaries)
  #     elsif current_user.role.name == 'Employee'
  #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
  #     end
  #   end
  # end

  def instalment_xls
    # byebug
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'Company' || current_user.role.name == 'Account'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'CompanyLocation' || current_user.role.name == 'SalaryAccount'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advance_salaries)
      elsif current_user.role.name == 'Employee'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
    respond_to do |format|
      format.xls {render template: 'instalments/instalment.xls.erb'}
    end
  end

  def installment_pdf
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'Company' || current_user.role.name == 'Account'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'CompanyLocation' || current_user.role.name == 'SalaryAccount'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advance_salaries)
      elsif current_user.role.name == 'Employee'
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
        respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'instalment',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'instalments/installment.pdf.erb',
                  # show_as_html: params[:debug].present?,
                  :page_height      => 1000,
                  :dpi              => '300',
                  :margin           => {:top    => 10, # default 10 (mm)
                                :bottom => 10,
                                :left   => 20,
                                :right  => 20},
                  :show_as_html => params[:debug].present?
                end
             end
     end

     def dynamic_report
        # byebug
        @month = params[:instalment][:month]
        @year = params[:instalment][:year]
        @company = params[:instalment][:company_id]
        @location = params[:instalment][:company_location_id]
        date = Date.new(@year.to_i, Workingday.months[@month])
        # if current_user.class == Group
        #   if params[:instalment][:company_location_id] == '' || params[:instalment][:company_id] == ''
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
        #   else
        #     @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #     @advances = AdvanceSalary.where(employee_id: @employees)
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #   end
        # elsif current_user.class == Member
        #   if current_user.role.name == 'Company'
            
            if @location == ""
              @employees = Employee.where(company_id: @company.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            elsif @company == ""
              @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            else 
              @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            end

        #   elsif current_user.role.name == 'CompanyLocation'
            
        #     if @location == ""
        #       @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     elsif @company == ""
        #       @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     else 
        #       @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     end
        #   elsif current_user.role.name == 'SalaryAccount'
           
        #   elsif current_user.role.name == 'Department'
        #     @salaryslips = Salaryslip.where(department_id: current_user.department_id)
        #   elsif current_user.role.name == 'Superviser'
        #   elsif current_user.role.name == 'Employee'
        #   end
        # end
      end

    def installment_xls_1
        @month = params[:month]
        @year = params[:year]
        @company = params[:company_id]
        @location = params[:company_location_id]
        date = Date.new(@year.to_i, Workingday.months[@month])
        # if current_user.class == Group
        #   if params[:instalment][:company_location_id] == '' || params[:instalment][:company_id] == ''
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
        #   else
        #     @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #     @advances = AdvanceSalary.where(employee_id: @employees)
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #   end
        # elsif current_user.class == Member
        #   if current_user.role.name == 'Company'
            
            if @location == ""
              @employees = Employee.where(company_id: @company.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            elsif @company == ""
              @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            else 
              @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            end

        #   elsif current_user.role.name == 'CompanyLocation'
            
        #     if @location == ""
        #       @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     elsif @company == ""
        #       @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     else 
        #       @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     end
        #   elsif current_user.role.name == 'SalaryAccount'
           
        #   elsif current_user.role.name == 'Department'
        #     @salaryslips = Salaryslip.where(department_id: current_user.department_id)
        #   elsif current_user.role.name == 'Superviser'
        #   elsif current_user.role.name == 'Employee'
        #   end
        # end
        respond_to do |format|
        format.xls {render template: 'instalments/instalment.xls.erb'}
      end
    end

    def installment_pdf_1
      @month = params[:month]
      @year = params[:year]
      @company = params[:company_id]
      @location = params[:company_location_id]
      date = Date.new(@year.to_i, Workingday.months[@month])
      # if current_user.class == Group
        #   if params[:instalment][:company_location_id] == '' || params[:instalment][:company_id] == ''
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
        #   else
        #     @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        #     @advances = AdvanceSalary.where(employee_id: @employees)
        #     @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #   end
        # elsif current_user.class == Member
        #   if current_user.role.name == 'Company'
            
            if @location == ""
              @employees = Employee.where(company_id: @company.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            elsif @company == ""
              @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            else 
              @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
              @advances = AdvanceSalary.where(employee_id: @employees)
              @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
            end

        #   elsif current_user.role.name == 'CompanyLocation'
            
        #     if @location == ""
        #       @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     elsif @company == ""
        #       @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     else 
        #       @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        #       @advances = AdvanceSalary.where(employee_id: @employees)
        #       @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        #     end
        #   elsif current_user.role.name == 'SalaryAccount'
           
        #   elsif current_user.role.name == 'Department'
        #     @salaryslips = Salaryslip.where(department_id: current_user.department_id)
        #   elsif current_user.role.name == 'Superviser'
        #   elsif current_user.role.name == 'Employee'
        #   end
        # end
      respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'instalment',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'instalments/installment.pdf.erb',
                  # show_as_html: params[:debug].present?,
                  :page_height      => 1000,
                  :dpi              => '300',
                  :margin           => {:top    => 10, # default 10 (mm)
                                :bottom => 10,
                                :left   => 20,
                                :right  => 20},
                  :show_as_html => params[:debug].present?
                end
             end
    end

  # def employee_slip_xls
  #   @year, @month = params[:year], params[:month]
  #   @date = Date.new(@year.to_i, Workingday.months[@month])
  #   @day = @date.end_of_month.day
  #   @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
  #   respond_to do |format|
  #     format.xls {render template: 'employee_attendances/employee_attendance.xls.erb'}
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instalment
    @instalment = Instalment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instalment_params
    params.require(:instalment).permit(:advance_salary_id, :instalment_date, :instalment_amount)
  end
end
