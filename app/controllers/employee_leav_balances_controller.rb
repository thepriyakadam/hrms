class EmployeeLeavBalancesController < ApplicationController
  before_action :set_employee_leav_balance, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /employee_leav_balances
  # GET /employee_leav_balances.json
  def index
    @employee_leav_balances = EmployeeLeavBalance.all
  end

  # GET /employee_leav_balances/1
  # GET /employee_leav_balances/1.json
  def show
  end

  # GET /employee_leav_balances/new
  def new
    @employee_leav_balance = EmployeeLeavBalance.new
    #@employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.employee_id is null")
    @employees = Employee.all
  end

  # GET /employee_leav_balances/1/edit
  def edit
  end

  # POST /employee_leav_balances
  # POST /employee_leav_balances.json
  def create
    @employee_ids = params[:employee_ids]
    if @employee_ids.nil?
      flash[:alert] = "Leave not assigned. Please select employee."
      redirect_to new_employee_leav_balance_path
    else
      ActiveRecord::Base.transaction do
        @employee_ids.each do |e|
          EmployeeLeavBalance.create(employee_id: e, leav_category_id: params[:employee_leav_balance][:leav_category_id], no_of_leave: params[:employee_leav_balance][:no_of_leave], total_leave: params[:employee_leav_balance][:total_leave], expiry_date: params[:employee_leav_balance][:expiry_date])
        end
      end
      flash[:notice] = "Leave assigned successfully."
      redirect_to new_employee_leav_balance_path
    end
  end

  # PATCH/PUT /employee_leav_balances/1
  # PATCH/PUT /employee_leav_balances/1.json
  def update
    respond_to do |format|
      if @employee_leav_balance.update(employee_leav_balance_params)
        format.html { redirect_to @employee_leav_balance, notice: 'Employee leav balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_leav_balance }
      else
        format.html { render :edit }
        format.json { render json: @employee_leav_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_leav_balances/1
  # DELETE /employee_leav_balances/1.json
  def destroy
    @employee_leav_balance.destroy
    respond_to do |format|
      format.html { redirect_to employee_leav_balances_url, notice: 'Employee leav balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_employee_for_leave
    if params[:leav_category_id] == ""
      flash.now[:alert] = "Please specify Leave Category."
      render :new
    else
      leav_category_id = params[:leav_category_id]
      @leav_category = LeavCategory.find(params[:leav_category_id])
      @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id}")
      @employee_leav_balance = EmployeeLeavBalance.new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_leav_balance
      @employee_leav_balance = EmployeeLeavBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_leav_balance_params
      params.require(:employee_leav_balance).permit(:employee_id, :leav_category_id, :no_of_leave, :total_leave, :expiry_date)
    end
end
