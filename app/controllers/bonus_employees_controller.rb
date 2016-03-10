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
  end

  def particular_employee_bonus
    @employee = Employee.find(params[:format])
    @particular_bonuses = @employee.bonus_employees
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
