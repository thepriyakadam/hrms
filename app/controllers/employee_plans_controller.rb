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
    @employee_plan = EmployeePlan.all
    @employee_plan = @employee_plan.check_availability(current_user, params[:employee_plan][:from_date], params[:employee_plan][:to_date], params[:employee_plan][:from_time], params[:employee_plan][:to_time])
    if @employee_plan == true
      flash[:alert] = 'Sorry..!! This Time was already reserved...'
      redirect_to employee_plans_url
    else
      @employee_plan = EmployeePlan.new(employee_plan_params)
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
  end

  def arrange_meeting
    @employee_plan = EmployeePlan.new
    session[:active_tab] ="ManagerSelfService"
  end

def ajax_employee_plan_details
    @employee_plans = EmployeePlan.find(params[:id])
  end

  # PATCH/PUT /employee_plans/1
  # PATCH/PUT /employee_plans/1.json
  def update
    @employee_plan = EmployeePlan.all
    @employee_plan = @employee_plan.check_availability(current_user, params[:employee_plan][:from_date], params[:employee_plan][:to_date], params[:employee_plan][:from_time], params[:employee_plan][:to_time])
    if @employee_plan == true
      flash[:alert] = 'Sorry..!! This Time was already reserved...'
      redirect_to employee_plans_url
    else
      @employee_plan = EmployeePlan.new(employee_plan_params)
      respond_to do |format|
        if @employee_plan.update(employee_plan_params)
          format.html { redirect_to employee_plans_url, notice: 'Employee plan was successfully created.' }
          format.json { render :show, status: :created, location: @employee_plan }
        else
          format.html { render :new }
          format.json { render json: @employee_plan.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  def meeting_plan_approval
    @employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: current_user.employee_id)
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end

  def view_plan
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
  end  
  
  def plan_approve
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: "Approved", status: "true", conform: "true")
    redirect_to meeting_plan_approval_employee_plans_path
  end

  def plan_reject
    plan_id = params[:format]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: "Rejected", status: "false", conform: "false")
    redirect_to meeting_plan_approval_employee_plans_path
  end

  # DELETE /employee_plans/1
  # DELETE /employee_plans/1.json
  def destroy
    @employee_plan.update(current_status: "Cancelled", status: "false", conform: "false")
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
