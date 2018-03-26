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
    @performance_calendars = PerformanceCalendar.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Performance"
  end

  # GET /performance_calendars/1/edit
  def edit
  end

  # POST /performance_calendars
  # POST /performance_calendars.json
  def create
    @performance_calendar = PerformanceCalendar.new(performance_calendar_params)
    @performance_calendars = PerformanceCalendar.all
    respond_to do |format|
      if @performance_calendar.save
        @performance_calendar = PerformanceCalendar.new
        format.js { @flag = true }
      else
         flash.now[:alert] = 'Performance Calendar Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /performance_calendars/1
  # PATCH/PUT /performance_calendars/1.json
  def update
    @performance_calendar.update(performance_calendar_params)
    @performance_calendar = PerformanceCalendar.new
    @performance_calendars = PerformanceCalendar.all
  end

  # DELETE /performance_calendars/1
  # DELETE /performance_calendars/1.json
  def destroy
    @performance_calendar.destroy
    @performance_calendars = PerformanceCalendar.all
  end

  def is_confirm
    @performance_calendar = PerformanceCalendar.find(params[:performance_calendar])
    PerformanceCalendar.find(@performance_calendar.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_performance_calendar_path
  end

      def performance_calendar
      @performance_calendars = PerformanceCalendar.all
      respond_to do |f|
      f.js
      f.xls {render template: 'performance_calendars/performance_calendar.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'performance_calendar',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'performance_calendars/performance_calendar.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
     end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_performance_calendars_path
      else
     PerformanceCalendar.import(params[:file])
     redirect_to new_performance_calendar_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_calendar
      @performance_calendar = PerformanceCalendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_calendar_params
      params.require(:performance_calendar).permit(:is_confirm,:period_id, :performance_activity_id, :start_date, :end_date)
    end
end
