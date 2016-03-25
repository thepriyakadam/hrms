class EmployeeGoalsController < ApplicationController
  before_action :set_employee_goal, only: [:show, :edit, :update, :destroy]

  # GET /employee_goals
  # GET /employee_goals.json
  def index
    @employee_goals = EmployeeGoal.all
  end

  # GET /employee_goals/1
  # GET /employee_goals/1.json
  def show
  end

  # GET /employee_goals/new
  def new
    @employee_goal = EmployeeGoal.new
    @employee_goals = EmployeeGoal.all
  end

  # GET /employee_goals/1/edit
  def edit

  end
  
  # POST /employee_goals
  # POST /employee_goals.json
  def create
    @employee_goal = EmployeeGoal.new(employee_goal_params)

      if @employee_goal.save
        @flag = true
        @employee_goal = EmployeeGoal.new
        @employee_goals = EmployeeGoal.all
        redirect_to new_employee_goal_path
      else
        @flag = false
      end
  end

  # PATCH/PUT /employee_goals/1
  # PATCH/PUT /employee_goals/1.json
  def update
      if @employee_goal.update(employee_goal_params)
         @flag = true
        @employee_goal = EmployeeGoal.new
        @employee_goals = EmployeeGoal.all
      else
        @flag = false
      end
  end

  # DELETE /employee_goals/1
  # DELETE /employee_goals/1.json
  def destroy
    @employee_goal.destroy
      flash[:notice]='Deleted'
      redirect_to new_employee_goal_path
  
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_goal
      @employee_goal = EmployeeGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_goal_params
      params.require(:employee_goal).permit(:period_id,:appraisee_id, :appraiser_id, :goal_perspective_id, :goal_measure, :target, :goal_weightage, :difficulty_level, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
