class LeaveCashablesController < ApplicationController
  before_action :set_leave_cashable, only: [:show, :edit, :update, :destroy]

  # GET /leave_cashables
  # GET /leave_cashables.json
  def index
  end

  # GET /leave_cashables/1
  # GET /leave_cashables/1.json
  def show
  end

  # GET /leave_cashables/new
  def new
    @leave_cashable = LeaveCashable.new
    @leave_cashables = LeaveCashable.all
  end

  # GET /leave_cashables/1/edit
  def edit
  end

  # POST /leave_cashables
  # POST /leave_cashables.json
  def create
    @leave_cashable = LeaveCashable.new(leave_cashable_params)
    @leave_cashables = LeaveCashable.all

    if @leave_cashable.cashable > @leave_cashable.no_of_leave
      flash[:alert] = "Check Balance"
    else
      @leave_cashable.save
      @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @leave_cashable.employee_id,leav_category_id: @leave_cashable.leav_category_id,is_active: true).take
      @employee_leav_balance.update(no_of_leave: @employee_leav_balance.no_of_leave.to_f - @leave_cashable.cashable.to_f)
    end
    @leave_cashable = LeaveCashable.new
    flash[:notice] = "Leave Cashable Created Successfully"
    redirect_to new_leave_cashable_path
  end

  # PATCH/PUT /leave_cashables/1
  # PATCH/PUT /leave_cashables/1.json
  def update
    
    # a = @leave_cashable
    # @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @leave_cashable.employee_id,leav_category_id: @leave_cashable.leav_category_id,is_active: true).take
    # @leave_cashable.update(leave_cashable_params)
    # if a.cashable.to_f == @leave_cashable.cashable.to_f
    # else
    #   if @leave_cashable.cashable.to_f > a.cashable.to_f
    #     @cash = @leave_cashable.cashable.to_f - a.cashable.to_f       
    #     @employee_leav_balance.update(no_of_leave: @employee_leav_balance.no_of_leave.to_f - @cash.to_f)
    #   elsif @leave_cashable.cashable.to_f < a.cashable.to_f
    #     @cash = a.cashable.to_f - @leave_cashable.cashable.to_f
    #     @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @leave_cashable.employee_id,leav_category_id: @leave_cashable.leav_category_id,is_active: true).take
    #     @employee_leav_balance.update(no_of_leave: @employee_leav_balance.no_of_leave.to_f + @cash.to_f)
    #   end
    # end
    # @leave_cashables = LeaveCashable.all
    # @leave_cashable = LeaveCashable.new
    # flash[:notice] = "Leave Cashable Updated Successfully"
    # redirect_to new_leave_cashable_path
  end

  # DELETE /leave_cashables/1
  # DELETE /leave_cashables/1.json
  def destroy
    @leave_cashable.destroy
    @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @leave_cashable.employee_id,leav_category_id: @leave_cashable.leav_category_id,is_active: true).take
    @employee_leav_balance.update(no_of_leave: @employee_leav_balance.no_of_leave.to_f + @leave_cashable.cashable.to_f)

    @leave_cashables = LeaveCashable.all
    flash[:notice] = "Leave Cashable Deleted Successfully"
    redirect_to new_leave_cashable_path
  end

  def collect_amount
    @employee = Employee.find(params[:emp_id])
    @leav_category = LeavCategory.find(params[:id])
    @emp_bal = EmployeeLeavBalance.where(employee_id: @employee.id,leav_category_id: @leav_category.id,is_active: true).take
    @amount = @emp_bal.no_of_leave
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_cashable
      @leave_cashable = LeaveCashable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_cashable_params
      params.require(:leave_cashable).permit(:employee_id, :leav_category_id, :date, :no_of_leave, :cashable, :amount, :is_confirm)
    end
end
