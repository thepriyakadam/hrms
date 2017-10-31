class EmployeePlansController < ApplicationController
  before_action :set_employee_plan, only: [:show, :edit, :update, :destroy]

  # GET /employee_plans
  # GET /employee_plans.json
  def index
    # @employee_plan = EmployeePlan.new
    @employee_plans = EmployeePlan.where(employee_id: current_user.employee_id)
  end

  # GET /employee_plans/1
  # GET /employee_plans/1.json
  def show
  end

  # GET /employee_plans/new
  def new
    @employee_plan = EmployeePlan.new
  end

  # GET /employee_plans/1/edit
  def edit
  end

  def create
    @employee_plan = EmployeePlan.new(employee_plan_params)
    # @employee_plans = EmployeePlan.all
    respond_to do |format|
      if @employee_plan.save
        format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully created.' }
        format.json { render :show, status: :created, location: @employee_plan }
      else
        format.html { render :new }
        format.json { render json: @employee_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def ajax_employee_plan_details
    @employee_plans = EmployeePlan.find(params[:id])
  end

  # PATCH/PUT /employee_plans/1
  # PATCH/PUT /employee_plans/1.json
  def update
    respond_to do |format|
      if @employee_plan.update(employee_plan_params)
        format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_plan }
      else
        format.html { render :edit }
        format.json { render json: @employee_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_plans/1
  # DELETE /employee_plans/1.json
  def destroy
    @employee_plan.destroy
    respond_to do |format|
      format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal_employee_plan_detail
    @employee_plan = EmployeePlan.find(params[:format])
  end

  def employee_plan_detail_list
    @employee_plans = EmployeePlan.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_plan
      @employee_plan = EmployeePlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_plan_params
      params.require(:employee_plan).permit(:employee_id, :from_date, :to_date, :from_time, :to_time, :meeting_with, :location, :meeting_agenda, :lat, :lng, :conform, :status, :current_status, :manager_id)
    end
end
