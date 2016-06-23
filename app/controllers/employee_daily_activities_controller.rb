class EmployeeDailyActivitiesController < ApplicationController
  before_action :set_employee_daily_activity, only: [:show, :edit, :update, :destroy]

  # GET /employee_daily_activities
  # GET /employee_daily_activities.json
  def index
    @employee_daily_activities = EmployeeDailyActivity.all
  end

  # GET /employee_daily_activities/1
  # GET /employee_daily_activities/1.json
  def show
  end

  # GET /employee_daily_activities/new
  def new
    @employee_daily_activity = EmployeeDailyActivity.new
    @employee_daily_activities = EmployeeDailyActivity.all
    
  end

  # GET /employee_daily_activities/1/edit
  def edit
  end

  # POST /employee_daily_activities
  # POST /employee_daily_activities.json
  def create
   @employee_daily_activity = EmployeeDailyActivity.new(employee_daily_activity_params)
    @employee_daily_activities = EmployeeDailyActivity.all
    respond_to do |format|
      if @employee_daily_activity.save
        @employee_daily_activity = EmployeeDailyActivity.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Employee Activity Already Exist.'
        format.js { @flag = false }
      end
    end
  end
 

  # PATCH/PUT /employee_daily_activities/1
  # PATCH/PUT /employee_daily_activities/1.json
  
   def update
    @employee_daily_activity.update(employee_daily_activity_params)
    @employee_daily_activities = EmployeeDailyActivity.all
    @employee_daily_activity = EmployeeDailyActivity.new
  end

  # DELETE /employee_daily_activities/1
  # DELETE /employee_daily_activities/1.json
  def destroy
    @employee_daily_activity.destroy
    @employee_daily_activities = EmployeeDailyActivity.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_daily_activity
      @employee_daily_activity = EmployeeDailyActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_daily_activity_params
      params.require(:employee_daily_activity).permit(:employee_id, :project_master_id, :today_activity, :tomorrow_plan, :day)
    end
end
