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
  end

  # GET /goal_perspectives/1/edit
  def edit
  end

  # POST /goal_perspectives
  # POST /goal_perspectives.json
  def create
    @goal_perspective = GoalPerspective.new(goal_perspective_params)

    respond_to do |format|
      if @goal_perspective.save
        format.html { redirect_to @goal_perspective, notice: 'Goal perspective was successfully created.' }
        format.json { render :show, status: :created, location: @goal_perspective }
      else
        format.html { render :new }
        format.json { render json: @goal_perspective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_perspectives/1
  # PATCH/PUT /goal_perspectives/1.json
  def update
    respond_to do |format|
      if @goal_perspective.update(goal_perspective_params)
        format.html { redirect_to @goal_perspective, notice: 'Goal perspective was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_perspective }
      else
        format.html { render :edit }
        format.json { render json: @goal_perspective.errors, status: :unprocessable_entity }
      end
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
