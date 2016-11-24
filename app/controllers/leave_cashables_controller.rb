class LeaveCashablesController < ApplicationController
  before_action :set_leave_cashable, only: [:show, :edit, :update, :destroy]

  # GET /leave_cashables
  # GET /leave_cashables.json
  def index
    @leave_cashables = LeaveCashable.all
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
    respond_to do |format|
      if @leave_cashable.save
        @leave_cashable = LeaveCashable.new 
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Leave Cashable Created Successfully'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /leave_cashables/1
  # PATCH/PUT /leave_cashables/1.json
  def update
    @leave_cashable.update(leave_cashable_params)
    @leave_cashables = LeaveCashable.all
    @leave_cashable = LeaveCashable.new
  end

  # DELETE /leave_cashables/1
  # DELETE /leave_cashables/1.json
  def destroy
    @leave_cashable.destroy
    @leave_cashables = LeaveCashable.all
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
