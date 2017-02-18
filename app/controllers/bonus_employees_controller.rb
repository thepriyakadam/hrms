class BonusEmployeesController < ApplicationController
  before_action :set_bonus_employee, only: [:show, :edit, :update, :destroy]

  # GET /bonus_employees
  # GET /bonus_employees.json
  def index
    @bonus_employees = BonusEmployee.all
  end

  # GET /bonus_employees/1
  # GET /bonus_employees/1.json
  def show
  end

  # GET /bonus_employees/new
  def new
    @bonus_employee = BonusEmployee.new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /bonus_employees/1/edit
  def edit
  end

  # POST /bonus_employees
  # POST /bonus_employees.json
  def create
    @bonus_employee = BonusEmployee.new(bonus_employee_params)

    respond_to do |format|
      if @bonus_employee.save
        format.html { redirect_to @bonus_employee, notice: 'Bonus employee was successfully created.' }
        format.json { render :show, status: :created, location: @bonus_employee }
      else
        format.html { render :new }
        format.json { render json: @bonus_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonus_employees/1
  # PATCH/PUT /bonus_employees/1.json
  def update
    respond_to do |format|
      if @bonus_employee.update(bonus_employee_params)
        format.html { redirect_to @bonus_employee, notice: 'Bonus employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @bonus_employee }
      else
        format.html { render :edit }
        format.json { render json: @bonus_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonus_employees/1
  # DELETE /bonus_employees/1.json
  def destroy
    @bonus_employee.destroy
    respond_to do |format|
      format.html { redirect_to bonus_employees_url, notice: 'Bonus employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_bonus
  end

  def collect_bonus
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id)
    @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date)
  end

  def particular_employee_bonus
    @employee = Employee.find(params[:format])
    @particular_bonuses = @employee.particular_bonuses
  end

  def bonus_employee_report
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def bonus_employee_xls
    # byebug
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @company = params[:company_id]
    @location = params[:company_location_id]
    # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id)
    # if current_user.class == Member
    # if current_user.role.name == 'Company'
    if @location == ""
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif @company == ""
      @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    # if @company == ""
    #   @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
    #   @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    #   @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif  @location.empty? == true && @company.empty? == true
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
     else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
  #   end
  # end

  end
    respond_to do |format|
      format.xls {render template: 'bonus_employees/bonus_employee_xls.xls.erb'}
    end
  end

  def bonus_employee_pdf
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @company = params[:company_id]
    @location = params[:company_location_id]
    # if current_user.class == Member
    # if current_user.role.name == 'Company'
    if @location == ""
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif @company == ""
      @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    # if @company == ""
    #   @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
    #   @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    #   @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif  @location.empty? == true && @company.empty? == true
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
     else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
  #   end
  # end
  end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'bonus_employee',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'bonus_employees/bonus_employees.pdf.erb',
                  show_as_html: params[:debug].present?
                end
             end
  end

  def particular_bonus_employee_xls
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @company = params[:company_id]
    @location = params[:company_location_id]
    # if current_user.class == Member
    # if current_user.role.name == 'Company'
    if @location == ""
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif @company == ""
      @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    # if @company == ""
    #   @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
    #   @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    #   @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif  @location.empty? == true && @company.empty? == true
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
     else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
  #   end
  # end
  end
    respond_to do |format|
      format.xls {render template: 'bonus_employees/particular_bonus_employee_xls.xls.erb'}
    end
  end

  def particular_bonus_employee_pdf
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @company = params[:company_id]
    @location = params[:company_location_id]

    # if current_user.class == Member
    # if current_user.role.name == 'Company'
      
    if @location == ""
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif @company == ""
      @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    # if @company == ""
    #   @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
    #   @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    #   @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif  @location.empty? == true && @company.empty? == true
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
     else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
  #   end
  # end

  end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'bonus_employee',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'bonus_employees/particular_bonus_employee_pdf.pdf.erb',
                  show_as_html: params[:debug].present?
                end
             end
  end


  def dynamic_report
    # byebug
    start_date = params[:bonus_employee][:start_date].to_date
    end_date = params[:bonus_employee][:end_date].to_date
    @company = params[:bonus_employee][:company_id]
    @location = params[:bonus_employee][:company_location_id]

    # @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id)
    # @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date)

    # if current_user.class == Member
    # if current_user.role.name == 'Company'

    if @location == ""
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    elsif @company == ""
      @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)

    # if @company == ""
    #   @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
    #   @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
    #   @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)

    elsif  @location.empty? == true && @company.empty? == true
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)
     else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
      @bonus_employees = BonusEmployee.where(bonus_date: start_date..end_date).group(:employee_id).where(employee_id: @employees)
      @particular_bonuses = BonusEmployee.where(bonus_date: start_date..end_date).where(employee_id: @employees)

  #   end
  # end

  end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bonus_employee
    @bonus_employee = BonusEmployee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bonus_employee_params
    params.require(:bonus_employee).permit(:employee_id, :bonus_date, :amount)
  end
end
