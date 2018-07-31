class AttendanceRegularizationsController < ApplicationController
  before_action :set_attendance_regularization, only: [:show, :edit, :update, :destroy]
   
  # GET /attendance_regularizations
  # GET /attendance_regularizations.json
  def index
    @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
    @attendance_regularization = AttendanceRegularization.new
    session[:active_tab] = "EmployeeSelfService"
  end

  # GET /attendance_regularizations/1
  # GET /attendance_regularizations/1.json
  def show
  end

  # # GET /attendance_regularizations/new
  def new
    @attendance_regularization = AttendanceRegularization.new
  end

  # GET /attendance_regularizations/1/edit
  def edit
  end

  def show_attendance_regularization
    attendance_regularizations_id = params[:format]
    @attendance_regularizations = AttendanceRegularization.find(attendance_regularizations_id)
    @date = @attendance_regularizations.date
    @employee_id = @attendance_regularizations.employee_id
    @status = @attendance_regularizations.status
    if @status == "Approved"
      @emp_atte = EmployeeAttendance.where(employee_id: @employee_id, day: @date)
    else
      puts "Attendance is not Approved"      
    end
  end

  def attendance_regularization_approve
    @att_approve_list = AttendanceRegularization.where(manager_id: current_user.employee_id).where(status: "Pending")
  end

  # def admin_attendance_regularization_approve
  #   @att_approve_list = AttendanceRegularization.where(status: "Pending")
  # end

  def approve_attendance #is_confirm
    att_approve_id = params[:format]
    @att_approve = AttendanceRegularization.find(att_approve_id)
    @employee_id = @att_approve.employee_id
    @date = @att_approve.date
    @emp_atte = EmployeeAttendance.where(employee_id: @employee_id, day: @date)
    if @emp_atte.present?
      @emp_is_confirm = @emp_atte.where(is_confirm: nil).present?
      if @emp_is_confirm.present?
        flash[:alert] = 'Attendance already Confirmed,Please contact to admin.'
      else
        @emp_atte.update_all(is_regularization: true, working_hrs: "09:00".to_i, present: "P", comment: "Attendance Regularized")
        @att_approve.update(status: "Approved")
      end
    else
      EmployeeAttendance.create(employee_id: @employee_id, day: @date, working_hrs: "09:00".to_i, present: "P", comment: "Attendance Regularized", is_regularization: true)
    end
    redirect_to attendance_regularization_approve_attendance_regularizations_path
  end


  def rejected_attendance
    att_rejected_id = params[:format]
    @att_rejected = AttendanceRegularization.find(att_rejected_id)
    @att_rejected.update(status: "Rejected")
    redirect_to attendance_regularization_approve_attendance_regularizations_path
  end

  def emp_attendance_details
    att_regula_id = params[:format]
    @att_rejected = AttendanceRegularization.find(att_regula_id)
    date = @att_rejected.date
    employee_id = @att_rejected.employee_id
    @emp_att = EmployeeAttendance.where(employee_id: employee_id, day: date.to_date)
  end

  def view_resaon
    reason_id = params[:format]
    @plan_reason = PlanReasonMaster.find(reason_id)
  end
  # POST
  # POST /attendance_regularizations
  # POST /attendance_regularizations.json
  def create
    @date = params[:attendance_regularization][:date]
    @employee_id = params[:attendance_regularization][:employee_id]
    @joining_detail = JoiningDetail.find_by(employee_id: @employee_id)
    if @joining_detail.is_regularization == true
      if @date == ""
        flash[:alert] = 'Please Select the Date'
      else
        if @date.to_date <= Time.now.to_date
          @emp_att = EmployeeAttendance.where(employee_id: @employee_id, day: @date)
          @emp_leav_request = @emp_att.where(employee_leav_request_id: nil).present?
          @emp_on_duty_request = @emp_att.where(on_duty_request_id: nil).present?
          @emp_holiday = @emp_att.where(holiday_id: nil).present?
          @emp_week_off = @emp_att.where(employee_week_off_id: nil).present?
          @emp_is_confirm = @emp_att.where(is_confirm: false).present?
          if @emp_att.present?
            if @emp_leav_request == true && @emp_on_duty_request == true && @emp_holiday == true && @emp_week_off == true && @emp_is_confirm == true
              @attendance_regularization = AttendanceRegularization.new(attendance_regularization_params)
              if @attendance_regularization.save
                attendance_regularization = AttendanceRegularization.new 
                @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
                @flag = true
                flash[:notice] = "Created Successfully !"
              else 
                @flag = false
                flash[:alert] = "You can't create request"
              end
            else
              flash[:alert] = 'You are not authorized to regularization attendance for this day please contact to admin.'
            end
          else#@emp_att.present?
             flash[:alert] = "Please Check Attendance"
          end#@emp_att.present?
        else#@date.to_date <= Time.now.to_date
          flash[:alert] = "You can't create pre-request"
        end#@date.to_date <= Time.now.to_date  
      end#@date
    else#is_regularization
      flash[:alert] = 'You are not authorized to regularization attendance please contact to admin.'
    end
    redirect_to attendance_regularizations_path
  end

  # PATCH/PUT /attendance_regularizations/1
  # PATCH/PUT /attendance_regularizations/1.json
  def update
    if @attendance_regularization.update(attendance_regularization_params)
      attendance_regularization = AttendanceRegularization.new 
      @attendance_regularizations = AttendanceRegularization.where(employee_id: current_user.employee_id)
      @flag = true
    else
      @flag = false
    end
    redirect_to attendance_regularizations_path
  end

  def date_wise_regularization
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end
  
  def att_regularization_report
    @from = params[:attendance_regularization] ? params[:attendance_regularization][:from_date] : params[:from_date]
    @to = params[:attendance_regularization] ? params[:attendance_regularization][:to_date] : params[:to_date]
    @status = params[:attendance_regularization] ? params[:attendance_regularization][:status] : params[:status]
    @from_date = @from.to_date
    @to_date = @to.to_date

    if @from.present? and @status == ""
      @regularization_report = AttendanceRegularization.where(date: @from.to_date..@to.to_date)
    else @from.present? and @status.present?
      @regularization_report = AttendanceRegularization.where(date: @from.to_date..@to.to_date, status: @status)
    end

    respond_to do |format|
    format.js
    format.xls {render template: 'attendance_regularizations/att_regularization_report_xls.xls.erb'}
    format.html
    format.pdf do
      render pdf: 'date_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'attendance_regularizations/att_regularization_report_pdf.pdf.erb',
            # show_as_html: params[:debug].present?,
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

  def employee_wise_regularization
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def employee_wise_regularization_report
    @from = params[:attendance_regularization] ? params[:attendance_regularization][:from_date] : params[:from_date]
    @to = params[:attendance_regularization] ? params[:attendance_regularization][:to_date] : params[:to_date]
    @employee_id = params[:attendance_regularization] ? params[:attendance_regularization][:employee_id] : params[:employee_id]
    @from_date = @from.to_date
    @to_date = @to.to_date

    if @from.present? and @employee_id == ""
      @regularization_report = AttendanceRegularization.where(date: @from.to_date..@to.to_date)
    else @from.present? and @employee_id.present?
      @regularization_report = AttendanceRegularization.where(date: @from.to_date..@to.to_date, employee_id: @employee_id)
    end

    respond_to do |format|
    format.js
    format.xls {render template: 'attendance_regularizations/employee_wise_regularization_report_xls.xls.erb'}
    format.html
    format.pdf do
      render pdf: 'date_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'attendance_regularizations/employee_wise_regularization_report_pdf.pdf.erb',
            # show_as_html: params[:debug].present?,
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
  # DELETE /attendance_regularizations/1
  # DELETE /attendance_regularizations/1.json
  def destroy
    @attendance_regularization.destroy
    redirect_to attendance_regularizations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_regularization
      @attendance_regularization = AttendanceRegularization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_regularization_params
      params.require(:attendance_regularization).permit(:employee_id, :date, :status, :regularization_reason_id, :justification, :manager_id)
    end
end
