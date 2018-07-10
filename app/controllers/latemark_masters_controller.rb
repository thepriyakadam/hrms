class LatemarkMastersController < ApplicationController
  before_action :set_latemark_master, only: [:show, :edit, :update, :destroy]

  # GET /latemark_masters
  # GET /latemark_masters.json
  def index
    @latemark_masters = LatemarkMaster.all
  end

  # GET /latemark_masters/1
  # GET /latemark_masters/1.json
  def show
  end

  # GET /latemark_masters/new
  def new
    @latemark_master = LatemarkMaster.new
    @latemark_masters = LatemarkMaster.all
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  # GET /latemark_masters/1/edit
  def edit
  end

  # POST /latemark_masters
  # POST /latemark_masters.json
  def create
    @latemark_master = LatemarkMaster.new(latemark_master_params)
    @latemark_masters = LatemarkMaster.all
    @latemark_master.save
    @latemark_master = LatemarkMaster.new
    redirect_to new_latemark_master_path
    flash[:notice] = "Saved Successfully"
  end

  # PATCH/PUT /latemark_masters/1
  # PATCH/PUT /latemark_masters/1.json
  def update
    @latemark_master.update(latemark_master_params)
    @latemark_masters = LatemarkMaster.all
    @latemark_master = LatemarkMaster.new
    redirect_to new_latemark_master_path
    flash[:notice] = "Updated Successfully"
  end

  # DELETE /latemark_masters/1
  # DELETE /latemark_masters/1.json
  def destroy
    @latemark_master.destroy
    @latemark_masters = LatemarkMaster.all
  end

  def latemark_calculation
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  def import_xl
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to latemark_calculation_latemark_masters_path
    else
    LatemarkMaster.import(params[:file])
    redirect_to latemark_calculation_latemark_masters_path, notice: "File imported."
    end
  end

  def show_employee_list
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time #from_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @latemark_master_late_time = @latemark_master.late_limit #to_time
    @late_limit = @latemark_master_late_time.strftime("%I:%M")
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,employee_leav_request_id: nil,on_duty_request_id: nil,employee_week_off_id: nil,holiday_id: nil,late_mark: nil,is_confirm: true).where.not(in_time: nil)
    
    @time = 0 
    @employee_attendances.each do |att|
      # if att.is_confirm != true
      #   #flash[:alert] = "First confirm the Attendance"
      # else
        if att.in_time.strftime("%I:%M") > @company_time && att.in_time.strftime("%I:%M") < @late_limit
          @emp_att << att
        end
      # end
    end

    # respond_to do |f|
    #   f.js
    #   f.xls {render template: 'latemark_masters/latemark_report.xls.erb'}
    #   f.html
    #   f.pdf do
    #     render pdf: 'employee_attendance',
    #     layout: 'pdf.html',
    #     orientation: 'Landscape',
    #     template: 'latemark_masters/latemark_report.pdf.erb',
    #     show_as_html: params[:debug].present?
    #   end
    # end
  end

  def latemark_total
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @latemark_master_late_time = @latemark_master.late_limit
    @late_limit = @latemark_master_late_time.strftime("%I:%M")
    
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,employee_leav_request_id: nil,on_duty_request_id: nil,employee_week_off_id: nil,holiday_id: nil,late_mark: nil,is_confirm: true).where.not(in_time: nil)
    
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") >= @company_time && att.in_time.strftime("%I:%M") <= @late_limit
        LatemarkTotal.create(employee_id: att.employee_id,latemark_date: att.day,in_time: att.in_time)
        att.update(late_mark: 0)
      end
    end

    @latemark_totals = LatemarkTotal.where(latemark_date: @from_date.to_date..@to_date.to_date).group(:employee_id)
    company_count = @latemark_master.allow_latemark
    company_amount = @latemark_master.amount
    @latemark_totals.each do |lt|
      @employee_count = LatemarkTotal.where(employee_id: lt.employee_id, latemark_date: @from_date.to_date..@to_date.to_date).count
      if @employee_count.to_f > company_count.to_f
        count = @employee_count.to_f - company_count.to_f
        total_count = count
        amount = total_count.to_f * company_amount.to_f
        if total_count > 0
        LatemarkDeduction.create(employee_id: lt.employee_id,latemark_day:  @to_date.to_date,
          latemark_count: @employee_count,latemark_amount: amount)
        end
        #@latemark_total = LatemarkTotal.find_by(id: lt.id).update(confirm: "confirm")
      else
        # LatemarkDeduction.create(employee_id: lt.employee_id,latemark_day:  @to_date.to_date,
        #   latemark_count: @employee_count,latemark_amount: 0)
        #@latemark_total = LatemarkTotal.find_by(id: lt.id).update(confirm: "confirm")
      end
    end
    flash[:notice] = "Created successfully"
    redirect_to latemark_calculation_latemark_masters_path
  end

  def latemark_report
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  # def show_employee_list
  #   @from_date = params[:latemark_master][:from_date]
  #   @to_date = params[:latemark_master][:to_date]
  #   @latemark_master = LatemarkMaster.last
  #   @latemark_master_time = @latemark_master.company_time #from_time
  #   @company_time = @latemark_master_time.strftime("%I:%M")
  #   @latemark_master_late_time = @latemark_master.late_limit #to_time
  #   @late_limit = @latemark_master_late_time.strftime("%I:%M")
  #   @emp_att = []
  #   @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,employee_leav_request_id: nil,on_duty_request_id: nil,employee_week_off_id: nil,holiday_id: nil).where.not(in_time: nil)
    
  #   @time = 0 
  #   @employee_attendances.each do |att|
  #     if att.in_time.strftime("%I:%M") >= @company_time && att.in_time.strftime("%I:%M") <= @late_limit
        
  #       @emp_att << att
  #     end
  #   end#do
  # end

  def show_datewise_report
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M") #from_time
    @latemark_master_late_time = @latemark_master.late_limit
    @late_limit = @latemark_master_late_time.strftime("%I:%M") #to_time
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,employee_leav_request_id: nil,on_duty_request_id: nil,employee_week_off_id: nil,holiday_id: nil,is_confirm: true).where.not(in_time: nil)
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") >= @company_time && att.in_time.strftime("%I:%M") <= @late_limit
        # LatemarkTotal.create(employee_id: att.employee_id,latemark_date: att.day,in_time: att.in_time)
        # att.update(late_mark: 0)
        @emp_att << att
      end
    end

      respond_to do |f|
      f.js
      f.xls {render template: 'latemark_masters/latemark_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'latemark_masters/latemark_report.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def datewise_report
   
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @latemark_master_late_time = @latemark_master.late_limit
    @late_limit = @latemark_master_late_time.strftime("%I:%M")
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,employee_leav_request_id: nil,on_duty_request_id: nil,employee_week_off_id: nil,holiday_id: nil,is_confirm: true).where.not(in_time: nil)
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") >= @company_time && att.in_time.strftime("%I:%M") <= @late_limit
        @emp_att << att

      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'latemark_masters/latemark_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'latemark_masters/latemark_report.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def deduction_report
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  def show_deduction_report
    from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @from = from_date.to_date
    @to = @to_date.to_date
    @latemark_deductions = LatemarkDeduction.where(latemark_day: @from..@to)

    respond_to do |f|
      f.js
      f.xls {render template: 'latemark_masters/deduction_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'deduction_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'latemark_masters/deduction_report.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def revert_latemark
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  def show_list_for_latemark
    @from = params[:latemark_master][:from_date]
   @to = params[:latemark_master][:to_date]
   
    @latemark_deductions = LatemarkDeduction.where(latemark_day: @from.to_date..@to.to_date).where(paid: nil)
  end

  def revert_latemark_value
    @from = params[:from_date]
    @to = params[:to_date]
    
    @latemark_deduction = LatemarkDeduction.where(latemark_day: @from.to_date..@to.to_date).where(paid: nil)
    @latemark_deduction.each do |l|
      EmployeeAttendance.where(day: @from.to_date..@to.to_date).update_all(late_mark: nil)
      LatemarkTotal.where(employee_id: l.employee_id,latemark_date: @from.to_date..@to.to_date).destroy_all
    end

    # @employee_attendances = EmployeeAttendance.where(day: @from..@to).where.not(late_mark: nil) 
    # @employee_attendances.each do |att|
    #   att.update(late_mark: nil)
    # end
    @latemark_deduction.destroy_all
    flash[:notice] = "Latemark reverted successfully!!"
    redirect_to revert_latemark_latemark_masters_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latemark_master
      @latemark_master = LatemarkMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latemark_master_params
      params.require(:latemark_master).permit(:halfday_working_hrs,:fullday_working_hrs,:halfday_allow,:late_limit,:company_time, :allow_latemark, :amount)
    end
end
