class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]

  # GET /holidays/new
  def new
    @holiday = Holiday.new
    @holidays = Holiday.all
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)
    @holidays = Holiday.all
    respond_to do |format|
      if @holiday.save
        @holiday = Holiday.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Holiday Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    @holiday.update(holiday_params)
    @holidays = Holiday.all
    @holiday = Holiday.new
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    @holidays = Holiday.all
  end

  def employee_list
    department_id = params[:department_id]
    @holiday_id = params[:holiday_id]
    @holiday = Holiday.find_by(id: @holiday_id)
    if department_id == [""]
      @emp = EmployeeAttendance.where(day: @holiday.holiday_date).pluck(:employee_id)
      @employees = Employee.where(status: "Active").where.not(id: @emp)
    else
      @emp = EmployeeAttendance.where(department_id: department_id,day: @holiday.holiday_date).pluck(:employee_id)
      @employees = Employee.where(department_id: department_id).where.not(id: @emp)
    end
  end

  def assign_to_employee
    @employee_ids = params[:employee_ids]
    holiday = Holiday.find(params[:holiday_id])
    #holiday.update(is_send: true)
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        @emp = Employee.find_by_id(eid)
        @emp_attendance = EmployeeAttendance.where(employee_id: eid,day: holiday.holiday_date).take
        if @emp_attendance.try(:present) == nil
          if holiday.holiday_type == "National"
            EmployeeAttendance.create(holiday_id: holiday.id,employee_id: eid, day: holiday.holiday_date, present: "H", department_id: @emp.department_id, is_confirm: false, count: 1)
          else
            EmployeeAttendance.create(holiday_id: holiday.id,employee_id: eid, day: holiday.holiday_date, present: "H", department_id: @emp.department_id, is_confirm: false, count: 1)
          end
        else
          @date = holiday.holiday_date
          @emp_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? AND present = ?", @date.strftime('%m/%Y'), "H")
          @emp_attendances.each do |e|
            date = e.day.to_datetime
            yd = (date-1).strftime('%Y-%m-%d')
            tmr = (date+1).strftime('%Y-%m-%d')
            yd_emp = EmployeeAttendance.where(day: yd,employee_id:e.employee_id).take
            tmr_emp = EmployeeAttendance.where(day: tmr,employee_id:e.employee_id).take
            if yd_emp.try(:present) == "A" && tmr_emp.try(:present) == "A"
              EmployeeAttendance.find_by(id: e.id).update(present: "A")
            else
            end
          end  
        end
      end#do
    end#if @employee_id.nil?
    @holidays = Holiday.all
    flash[:notice] = "Holiday Created Successfully!"
    redirect_to new_holiday_path
  end

  def modal
    @holiday = Holiday.find(params[:format])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def holiday_params
    params.require(:holiday).permit(:c_off,:holiday_type,:is_taken,:code, :name, :description, :holiday_date)
  end
end
