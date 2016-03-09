class OvertimeSalariesController < ApplicationController
  before_action :set_overtime_salary, only: [:show, :edit, :update, :destroy]

  # GET /overtime_salaries
  # GET /overtime_salaries.json
  def index
    @overtime_salaries = OvertimeSalary.all
  end

  # GET /overtime_salaries/1
  # GET /overtime_salaries/1.json
  def show
  end

  # GET /overtime_salaries/new
  def new
    @overtime_master = OvertimeMaster.find_by_status(true)
    @overtime_salary = OvertimeSalary.new
    if @overtime_master.nil?
      flash[:alert] = "Overtime Master not set. First set the master."
    else
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
        format.html { redirect_to @overtime_salary, notice: 'Overtime salary was successfully created.' }
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
    if @employee_id == ""
      @employee_nil = true
    else
      @employee_nil = false
      @employee = Employee.find(@employee_id)
      @employee_template = @employee.employee_templates.where(is_active: true).take
      if @employee_template.nil?
        @employee_template_nil = true
      else
        @employee_template_nil = false
        @salary_component = SalaryComponent.find_by_name('Basic')
        if @salary_component.nil?
          @salary_component_nil = true
        else
          @salary_component_nil = false
          @basic_record = @employee_template.employee_salary_templates.where(salary_component_id: @salary_component.id).take
          if @basic_record.nil?
            @basic_record_nil = true
          else
            @basic_record_nil = false
            @basic_amount = @basic_record.monthly_amount
          end
        end
      end
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
