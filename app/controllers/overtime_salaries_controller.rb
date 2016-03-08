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
    @overtime_salary = OvertimeSalary.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overtime_salary
      @overtime_salary = OvertimeSalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overtime_salary_params
      params.require(:overtime_salary).permit(:employee_id, :date, :ot_hrs, :ot_esic_amount, :total_amount, :attendence_bouns_amount, :paid_holiday_amount, :net_payble_amount)
    end
end
