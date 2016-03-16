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
  end

  # GET /employee_goals/1/edit
  def edit
  end
  
  # POST /employee_goals
  # POST /employee_goals.json
  def create
    @employee_goal = EmployeeGoal.new(employee_goal_params)

      if @employee_goal.save
        flash[:notice] = "Employee goal was successfully created"
        redirect_to employee_goals_path
      else
        flash[:alert] = "Employee goal was not successfully created"
        render :new
      end
  end

  # PATCH/PUT /employee_goals/1
  # PATCH/PUT /employee_goals/1.json
  def update
    respond_to do |format|
      if @employee_goal.update(employee_goal_params)
        format.html { redirect_to @employee_goal, notice: 'Employee goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_goal }
      else
        format.html { render :edit }
        format.json { render json: @employee_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_goals/1
  # DELETE /employee_goals/1.json
  def destroy
    @employee_goal.destroy
    respond_to do |format|
      format.html { redirect_to employee_goals_url, notice: 'Employee goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def appraisee
    @employee_goals = EmployeeGoal.all
  end

  def appraisee_create
    employee_goal_ids = params[:employee_goal_id]
    aligns = params[:allign_to_supervisor]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
    final = employee_goal_ids.zip(comments,ratings)

    final.each do |e,c,r|
      emp = EmployeeGoal.find(e)
      emp.update( appraisee_comment: c, appraisee_rating: r, appraisee_id: params[:appraisee_id])
    end
    redirect_to appraisee_employee_goals_path
  end

  def appraiser
    @employee_goals = EmployeeGoal.all
  end

  def appraiser_create
    employee_goal_ids = params[:employee_goal_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating]
    final = employee_goal_ids.zip(comments,ratings)
    final.each do |e,c,r|
      emp = EmployeeGoal.find(e)
      emp.update(appraiser_comment: c, appraiser_rating: r, appraiser_id: params[:appraiser_id])
    end
    redirect_to appraiser_employee_goals_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_goal
      @employee_goal = EmployeeGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_goal_params
      params.require(:employee_goal).permit(:appraisee_id, :appraiser_id, :goal_perspective_id, :goal_measure_id, :target, :goal_weightage, :difficulty_level, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
