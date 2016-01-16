class AdvanceSalariesController < ApplicationController
  before_action :set_advance_salary, only: [:show, :edit, :update, :destroy]

  # GET /advance_salaries
  # GET /advance_salaries.json
  def index
    @advance_salaries = AdvanceSalary.all
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
    @employee = Employee.find_by_manual_employee_code(@advance_salary.employee_id)
    id = AdvanceSalary.create(employee_id: @employee.id, \
                         advance_amount: @advance_salary.advance_amount, \
                         no_of_instalment: @advance_salary.no_of_instalment, \
                         instalment_amount: @advance_salary.instalment_amount, \
                         advance_date:@advance_salary.advance_date ).id
    current_record = AdvanceSalary.find(id)
    for i in 1..current_record.no_of_instalment.to_i
      current_record.instalments.create(instalment_amount: current_record.instalment_amount)
    end
    redirect_to @advance_salary
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_salary
      @advance_salary = AdvanceSalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advance_salary_params
      params.require(:advance_salary).permit(:employee_id, :advance_amount, :no_of_instalment, :instalment_amount, :advance_date)
    end
end
