class PerformanceActivitiesController < ApplicationController
  before_action :set_performance_activity, only: [:show, :edit, :update, :destroy]

  def new
    @performance_activity = PerformanceActivity.new
    @performance_activities = PerformanceActivity.all
  end

  # GET /performance_activities/1/edit
  def edit
  end

  # POST /performance_activities
  # POST /performance_activities.json
  def create
    @performance_activity = PerformanceActivity.new(performance_activity_params)
    @performance_activities = PerformanceActivity.all
    respond_to do |format|
      if @performance_activity.save
        @performance_activity = PerformanceActivity.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Performance Activity Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /performance_activities/1
  # PATCH/PUT /performance_activities/1.json
  def update
    respond_to do |format|
      if @performance_activity.update(performance_activity_params)
        format.html { redirect_to @performance_activity, notice: 'Performance activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance_activity }
      else
        format.html { render :edit }
        format.json { render json: @performance_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_activities/1
  # DELETE /performance_activities/1.json
  def destroy
    @performance_activity.destroy
    respond_to do |format|
      format.html { redirect_to performance_activities_url, notice: 'Performance activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_activity
      @performance_activity = PerformanceActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_activity_params
      params.require(:performance_activity).permit(:code, :name, :description)
    end
end
