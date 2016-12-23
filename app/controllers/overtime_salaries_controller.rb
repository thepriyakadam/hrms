class OvertimeSalariesController < ApplicationController
  before_action :set_overtime_salary, only: [:show, :edit, :update, :destroy]

  # GET /overtime_salaries
  # GET /overtime_salaries.json
  def index
    @overtime_salaries = OvertimeSalary.group("strftime('%Y',ot_date)")
  end

  # GET /overtime_salaries/1
  # GET /overtime_salaries/1.json
  def show
  end

  # GET /overtime_salaries/new
  def new
    @overtime_salary = OvertimeSalary.new
    @overtime_master = OvertimeMaster.find_by_status(true)
    @esic_master = EsicMaster.first
    if @overtime_master.nil? || @esic_master.nil?
      flash[:alert] = 'Over time master or esic master not set.'
    end
  end

  # GET /overtime_salaries/1/edit
  def edit
  end

  # POST /overtime_salaries
  # POST /overtime_salaries.json
  def create
    @overtime_salary = OvertimeSalary.new(overtime_salary_params)
    respond_to do |format|
      if @overtime_salary.save
        format.html { redirect_to overtime_salaries_path, notice: 'Overtime salary was successfully created.' }
        format.json { render :show, status: :created, location: @overtime_salary }
      else
        format.html { render :new }
        format.json { render json: @overtime_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overtime_salaries/1
  # PATCH/PUT /overtime_salaries/1.json
  def update
    respond_to do |format|
      if @overtime_salary.update(overtime_salary_params)
        format.html { redirect_to @overtime_salary, notice: 'Overtime salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @overtime_salary }
      else
        format.html { render :edit }
        format.json { render json: @overtime_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overtime_salaries/1
  # DELETE /overtime_salaries/1.json
  def destroy
    @overtime_salary.destroy
    respond_to do |format|
      format.html { redirect_to overtime_salaries_url, notice: 'Overtime salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_basic
    @employee_id = params[:employee_id]
    if @employee_id == ''
      @employee_nil = true
    else
      @employee_nil = false
      @employee = Employee.find(@employee_id)
      @employee_template = @employee.employee_templates.where(is_active: true).take
      if @employee_template.nil?
        @employee_template_nil = true
      else
        @employee_template_nil = false
        #@salary_component = SalaryComponent.find_by_name('Basic')
        # if @salary_component.nil?
        #   @salary_component_nil = true
        # else
          #@salary_component_nil = false
          #@basic_record = @employee_template.employee_salary_templates.where(salary_component_id: @salary_component.id).take
          #@basic_record = @employee_template.employee_salary_templates.sum(:monthly_amount)
          # if @basic_record.nil?
          #   @basic_record_nil = true
          # else
          #   @basic_record_nil = false
            #@basic_amount = @basic_record.monthly_amount
            @basic_amount = @employee_template.employee_salary_templates.sum(:monthly_amount)
          # end
        # end
      end
    end
  end

  def select_month_year_form
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="Overtime"
  end

  def collect_employee
    @month = params[:month]
    @year = params[:year]
    date = Date.new(@year.to_i, Workingday.months[@month])
    @employees = OvertimeDailyRecord.where("strftime('%m/%Y', ot_daily_date) = ?", date.strftime('%m/%Y')).group(:employee_id)
  end

  def calculate_amount
    @overtime_master = OvertimeMaster.find_by_status(true)
    @esic_master = EsicMaster.first

    basic_amount = self.basic_amount
    paid_holiday_amount = self.paid_holiday_amount
    attendence_bouns_amount = self.attendence_bouns_amount
    ot_hrs = self.ot_hrs

    day = @overtime_master.day
    company_hrs = @overtime_master.company_hrs
    ot_rate = @overtime_master.ot_rate
    percentage = @esic_master.percentage

    basic_amount_by_day = basic_amount / day
    basic_amount_by_day_by_company_hrs = basic_amount_by_day / company_hrs
    temp = basic_amount_by_day_by_company_hrs * ot_rate
    ot_amount = temp * self.ot_hrs
    ot_esic_amount = (ot_amount / 100 * percentage).ceil
    if @esic_master.esic # and addable_total_calculated_amount <= @esic_master.max_limit and @employee.joining_detail.have_esic
      total_amount = ot_amount - ot_esic_amount
    else
      total_amount = ot_amount
    end
    net_payble = total_amount + attendence_bouns_amount + paid_holiday_amount
    self.ot_amount = ot_amount.round
    self.ot_esic_amount = ot_esic_amount.round
    self.total_amount = total_amount.round
    self.net_payble_amount = net_payble.round
  end

  def create_overtime_salary
    month = params[:month]
    year = params[:year]
    date = Date.new(year.to_i, Workingday.months[month])
    employee_ids = params[:employee_ids]
    ot_amount = params[:ot_amount]
    ot_hrs = params[:ot_hrs]
    attendence_bonus_amount = params[:attendance_bonus_amount]
    paid_holiday_amount = params[:paid_holiday_amount]
    ot_daily_amount = params[:ot_daily_amount]

    @esic_master = EsicMaster.first
    percentage = @esic_master.percentage
    if employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to select_month_year_form_overtime_salaries_path
    else
    final = employee_ids.zip(ot_amount, ot_hrs, attendence_bonus_amount, paid_holiday_amount, ot_daily_amount)

    final.each do |i, a, h, bonus, holiday, ot_amount|
      ot_esic_amount = (a.to_i / 100 * percentage).ceil
      total_amount = a.to_i - ot_esic_amount
      net_payble = total_amount + bonus.to_f + holiday.to_f
      OvertimeSalary.new do |o|
        o.employee_id = i
        o.ot_esic_amount = ot_esic_amount
        o.total_amount = total_amount
        o.ot_hrs = h.to_i
        o.attendence_bouns_amount = bonus.to_f
        o.paid_holiday_amount = holiday.to_f
        o.net_payble_amount = net_payble
        o.ot_date = date
        o.ot_amount = ot_amount
        o.save
      end
    end
    flash[:alert] = "Employee Saved Successfully"
  end
  end

  def overtimes
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
   if current_user.class == Group
       @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == "GroupAdmin" 
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_id).pluck(:id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(d_id: current_user.d_id).pluck(:id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == "AccountAdmin"
        @employees = Employee.where(company_id: current_user.company_id).pluck(:id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
         @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
  end

  def revert_salary
  end

  def show_employee
   
    @month = params[:month]
    @year = params[:year]
    date = Date.new(@year.to_i,Workingday.months[@month])
    @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y' , ot_date) = ? ", date.strftime('%m/%Y'))
   
  end

  def destroy_overtime_salary
    @month = params[:month]
    @year = params[:year]
    date = Date.new(@year.to_i,Workingday.months[@month])
    @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y' , ot_date) = ? ", date.strftime('%m/%Y'))
    
    @overtime_salaries_id = params[:overtime_salaries_id]

    if @overtime_salaries_id.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to revert_overtime_overtime_salaries_path
    else

    @overtime_salaries_id.each do |oid|
     @overtime_salary = OvertimeSalary.find(oid)
    end
    @overtime_salary.destroy
    flash[:notice] = "Revert successfully"

    redirect_to revert_overtime_overtime_salaries_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_overtime_salary
    @overtime_salary = OvertimeSalary.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def overtime_salary_params
    params.require(:overtime_salary).permit(:employee_id, :ot_date, :basic_amount, :ot_hrs, :ot_amount, :ot_esic_amount, :total_amount, :attendence_bouns_amount, :paid_holiday_amount, :net_payble_amount)
  end
end
