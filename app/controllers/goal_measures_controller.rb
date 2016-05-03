class GoalMeasuresController < ApplicationController
  before_action :set_goal_measure, only: [:show, :edit, :update, :destroy]

  # GET /goal_measures
  # GET /goal_measures.json
  def index
    @goal_measures = GoalMeasure.all
  end

  # GET /goal_measures/1
  # GET /goal_measures/1.json
  def show
  end

  # GET /goal_measures/new
  def new
    @goal_measure = GoalMeasure.new
    @goal_measures = GoalMeasure.all
  end

  # GET /goal_measures/1/edit
  def edit
  end

  # POST /goal_measures
  # POST /goal_measures.json
  def create
    @goal_measure = GoalMeasure.new(goal_measure_params)

    if @goal_measure.save
      @flag = true
      @goal_measures = GoalMeasure.all
      @goal_measure = GoalMeasure.new
    else
      @flag = false
    end
  end

  # PATCH/PUT /goal_measures/1
  # PATCH/PUT /goal_measures/1.json
  def update
    if @goal_measure.update(goal_measure_params)
      @flag = true
      @goal_measures = GoalMeasure.all
      @goal_measure = GoalMeasure.new
    else
      @flag = false
    end
  end

  # DELETE /goal_measures/1
  # DELETE /goal_measures/1.json
  def destroy
    @goal_measure.destroy
    respond_to do |format|
      format.html { redirect_to goal_measures_url, notice: 'Goal measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal_measure
    @goal_measure = GoalMeasure.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def goal_measure_params
    params.require(:goal_measure).permit(:name)
  end
end
