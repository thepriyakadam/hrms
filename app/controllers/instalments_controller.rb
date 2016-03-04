class InstalmentsController < ApplicationController
  before_action :set_instalment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /instalments
  # GET /instalments.json
  def index
    @instalments = Instalment.where.not(instalment_date: nil).group("strftime('%Y',instalment_date)")
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
      flash[:alert] = "Amount exceed the limit."
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

  def employees
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    if current_user.class == Group
      @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == "Company" or current_user.role.name == "Account"
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advance_salaries)
      elsif current_user.role.name == "Employee"
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      end
    end
  end

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
