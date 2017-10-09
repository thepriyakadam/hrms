class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html

  # GET /events
  # GET /events.json
  def index
     @events = Event.all
     # @employee_attendances = EmployeeAttendance.group("strftime('%Y',day)")
    # @employee_attendances = EmployeeAttendance.all
    @employee_attendances = EmployeeAttendance.where(employee_id: current_user.try(:id))
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
     # @employee_attendance = EmployeeAttendance.new

  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    # @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    # respond_to do |format|
    #   if @employee_attendance.save
    #     format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully created.' }
    #     format.json { render :show, status: :created, location: @employee_attendance }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def user_events
  #   @events = current_user.events
  #   render json: @events
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time)
    end

    def set_employee_attendance
    @employee_attendance = EmployeeAttendance.find(params[:id])
  end

    def employee_attendance_params
    params.require(:employee_attendance).permit(:id, :present, :day, :in_time, :out_time)
  end


end
