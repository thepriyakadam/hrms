class PerformanceCalendarsController < ApplicationController
  before_action :set_performance_calendar, only: [:show, :edit, :update, :destroy]

  # GET /performance_calendars
  # GET /performance_calendars.json
  def index
    @performance_calendars = PerformanceCalendar.all
  end

  # GET /performance_calendars/1
  # GET /performance_calendars/1.json
  def show
  end

  # GET /performance_calendars/new
  def new
    @performance_calendar = PerformanceCalendar.new
  end

  # GET /performance_calendars/1/edit
  def edit
  end

  # POST /performance_calendars
  # POST /performance_calendars.json
  def create
    @performance_calendar = PerformanceCalendar.new(performance_calendar_params)

    respond_to do |format|
      if @performance_calendar.save
        format.html { redirect_to @performance_calendar, notice: 'Performance calendar was successfully created.' }
        format.json { render :show, status: :created, location: @performance_calendar }
      else
        format.html { render :new }
        format.json { render json: @performance_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_calendars/1
  # PATCH/PUT /performance_calendars/1.json
  def update
    respond_to do |format|
      if @performance_calendar.update(performance_calendar_params)
        format.html { redirect_to @performance_calendar, notice: 'Performance calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance_calendar }
      else
        format.html { render :edit }
        format.json { render json: @performance_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_calendars/1
  # DELETE /performance_calendars/1.json
  def destroy
    @performance_calendar.destroy
    respond_to do |format|
      format.html { redirect_to performance_calendars_url, notice: 'Performance calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_calendar
      @performance_calendar = PerformanceCalendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_calendar_params
      params.require(:performance_calendar).permit(:period_id, :performance_activity_id, :start_date, :end_date)
    end
end
