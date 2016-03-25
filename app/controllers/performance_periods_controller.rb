class PerformancePeriodsController < ApplicationController
  before_action :set_performance_period, only: [:show, :edit, :update, :destroy]

  # GET /performance_periods
  # GET /performance_periods.json
  def index
    @performance_periods = PerformancePeriod.all
  end

  # GET /performance_periods/1
  # GET /performance_periods/1.json
  def show
  end

  # GET /performance_periods/new
  def new
    @performance_period = PerformancePeriod.new
  end

  # GET /performance_periods/1/edit
  def edit
  end

  # POST /performance_periods
  # POST /performance_periods.json
  def create
    @performance_period = PerformancePeriod.new(performance_period_params)
    if @performance_period.save
      flash[:notice] = "saved."
      redirect_to performance_periods_path
    else
      flash[:alert] = "not saved"
      render :new
    end
  end

  # PATCH/PUT /performance_periods/1
  # PATCH/PUT /performance_periods/1.json
  def update
    respond_to do |format|
      if @performance_period.update(performance_period_params)
        format.html { redirect_to @performance_period, notice: 'Performance period was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance_period }
      else
        format.html { render :edit }
        format.json { render json: @performance_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_periods/1
  # DELETE /performance_periods/1.json
  def destroy
    @performance_period.destroy
    respond_to do |format|
      format.html { redirect_to performance_periods_url, notice: 'Performance period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_period
      @performance_period = PerformancePeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_period_params
      params.require(:performance_period).permit(:performance_period_id,:title, :start_date, :end_date, :description, :is_open)
    end
end
