class GoalPerspectivesController < ApplicationController
  before_action :set_goal_perspective, only: [:show, :edit, :update, :destroy]

  # GET /goal_perspectives
  # GET /goal_perspectives.json
  def index
    @goal_perspectives = GoalPerspective.all
  end

  # GET /goal_perspectives/1
  # GET /goal_perspectives/1.json
  def show
  end

  # GET /goal_perspectives/new
  def new
    @goal_perspective = GoalPerspective.new
    @goal_perspectives = GoalPerspective.all
    session[:active_tab] ="master"
    session[:active_tab1] ="performancemaster"
  end

  # GET /goal_perspectives/1/edit
  def edit
  end

  # POST /goal_perspectives
  # POST /goal_perspectives.json
  def create
    @goal_perspective = GoalPerspective.new(goal_perspective_params)
    if @goal_perspective.save
      @flag = true
      @goal_perspectives = GoalPerspective.all
      @goal_perspective = GoalPerspective.new
    else
      @flag = false
    end
  end

  # PATCH/PUT /goal_perspectives/1
  # PATCH/PUT /goal_perspectives/1.json
  def update
    if @goal_perspective.update(goal_perspective_params)
      @flag = true
      @goal_perspectives = GoalPerspective.all
      @goal_perspective = GoalPerspective.new
    else
      @flag = false
    end
  end

  # DELETE /goal_perspectives/1
  # DELETE /goal_perspectives/1.json
  def destroy
    @goal_perspective.destroy
    respond_to do |format|
      format.html { redirect_to goal_perspectives_url, notice: 'Goal perspective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal_perspective
    @goal_perspective = GoalPerspective.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def goal_perspective_params
    params.require(:goal_perspective).permit(:name)
  end
end
