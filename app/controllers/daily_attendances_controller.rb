class DailyAttendancesController < ApplicationController

  before_action :set_daily_attendance, only: [:show, :edit, :update, :destroy]
  # GET /daily_attendances
  # GET /daily_attendances.json
  def index
    @daily_attendances = DailyAttendance.all
  end

  # GET /daily_attendances/1
  # GET /daily_attendances/1.json
  def show
  end

  def attendance
    DailyAttendance.fetch_data
    redirect_to subordinate_attendance_manager_self_services_path
  end

  def calculate
    DailyAttendance.calculate_attendance
    redirect_to subordinate_attendance_manager_self_services_path
  end

  # GET /daily_attendances/new
  def new
    @daily_attendance = DailyAttendance.new
  end

  # GET /daily_attendances/1/edit
  def edit
  end

  # POST /daily_attendances
  # POST /daily_attendances.json
  def create
    @daily_attendance = DailyAttendance.new(daily_attendance_params)
    respond_to do |format|
      if @daily_attendance.save
        format.html { redirect_to @daily_attendance, notice: 'Daily attendance was successfully created.' }
        format.json { render :show, status: :created, location: @daily_attendance }
      else
        format.html { render :new }
        format.json { render json: @daily_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_attendances/1
  # PATCH/PUT /daily_attendances/1.json
  def update
    respond_to do |format|
      if @daily_attendance.update(daily_attendance_params)
        format.html { redirect_to @daily_attendance, notice: 'Daily attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_attendance }
      else
        format.html { render :edit }
        format.json { render json: @daily_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_attendances/1
  # DELETE /daily_attendances/1.json
  def destroy
    @daily_attendance.destroy
    respond_to do |format|
      format.html { redirect_to daily_attendances_url, notice: 'Daily attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_attendance
      @daily_attendance = DailyAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_attendance_params
      params.require(:daily_attendance).permit(:game, :score)
    end

end