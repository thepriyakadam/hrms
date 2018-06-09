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

  def third_attendance_uttam
    DailyAttendance.third_fetch_data
    redirect_to subordinate_attendance_manager_self_services_path
  end

  def third_calculate
    DailyAttendance.third_calculate_attendance
    redirect_to subordinate_attendance_manager_self_services_path
  end


  # GET /daily_attendances/new
  def new
    @daily_attendance = DailyAttendance.new
  end

  # GET /daily_attendances/1/edit
  def edit
  end

  def daily_attendance
    session[:active_tab] = "MeetingPlan"
  end

  def daily_attendances_report
    from_date = params[:daily_attendance] ? params[:daily_attendance][:from_date] : params[:from_date]
    to_date = params[:daily_attendance] ? params[:daily_attendance][:to_date] : params[:to_date]
    manual_employee_code = params[:daily_attendance] ? params[:daily_attendance][:employee_id] : params[:employee_id]
    emp = Employee.find(manual_employee_code)
    @employee = Employee.find(manual_employee_code)
    emp_id = emp.manual_employee_code
    if from_date.present? && !to_date.present?
      @daily_atten_report = DailyAttendance.where("date >= ? and employee_code =?", from_date.to_date, emp_id).order("date DESC")
    end
    if !from_date.present? && to_date.present?
      @daily_atten_report = DailyAttendance.where("date <= ? and employee_code =?", to_date.to_date, emp_id).order("date DESC")
    end
    if from_date.present? && to_date.present?
      @daily_atten_report = DailyAttendance.where(date: from_date.to_date..to_date.to_date, employee_code: emp_id).order("date DESC")
    end
    if !from_date.present? && !to_date.present? && emp_id.present?
      @daily_atten_report = DailyAttendance.where("employee_code =?", emp_id).order("date DESC")
    end

    respond_to do |format|
      format.js
      format.xls {render template: 'daily_attendances/daily_attendances_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'print_employee_wise_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'daily_attendances/daily_attendances_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
      end
    end
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
