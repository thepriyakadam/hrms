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

  def show_employee_list
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,late_mark: nil).where.not(in_time: nil)
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") > @company_time
        LatemarkTotal.create(employee_id: att.employee_id,latemark_date: att.day,in_time: att.in_time)
        att.update(late_mark: 0)
        @emp_att << att
      end
    end
  end
  
  # def calculate_latemark
  #   @employee_attendance_ids = params[:employee_attendance_ids]
  #   if @employee_attendance_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #   else
  #     @employee_attendance_ids.each do |eid|
  #       @employee_attendance = EmployeeAttendance.find_by_id(eid)
  #       LatemarkTotal.create(employee_id: @employee_attendance.employee_id,latemark_date: @employee_attendance.day,in_time: @employee_attendance.in_time)
  #       @employee_attendance.update(late_mark: 0)
  #       flash[:notice] = "Created successfully"
  #     end
  #   end
  #     redirect_to latemark_calculation_latemark_masters_path
  # end

  def latemark_total
    @latemark_totals = LatemarkTotal.where(confirm: nil).group(:employee_id)
    @latemark_master = LatemarkMaster.last
    company_count = @latemark_master.allow_latemark
    company_amount = @latemark_master.amount
    @latemark_totals.each do |lt|
      @employee_count = LatemarkTotal.where(employee_id: lt.employee_id).count
      if @employee_count.to_f > company_count.to_f
        count = @employee_count.to_f - company_count.to_f
        total_count = count
        amount = total_count.to_f * company_amount.to_f
        LatemarkDeduction.create(employee_id: lt.employee_id,latemark_day: lt.latemark_date,
          latemark_count: @employee_count,latemark_amount: amount)
        @latemark_total = LatemarkTotal.find_by(id: lt.id).update(confirm: true)
      else
        LatemarkDeduction.create(employee_id: lt.employee_id,latemark_day: lt.latemark_date,
          latemark_count: @employee_count,latemark_amount: 0)
        @latemark_total = LatemarkTotal.find_by(id: lt.id).update(confirm: true)
      end
    end
    flash[:notice] = "Created successfully"
    redirect_to latemark_calculation_latemark_masters_path
  end

  def latemark_report
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="latemark"
  end

  def show_datewise_report
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,late_mark: 0).where.not(in_time: nil)
  
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") > @company_time
        # LatemarkTotal.create(employee_id: att.employee_id,latemark_date: att.day,in_time: att.in_time)
        # att.update(late_mark: 0)
        @emp_att << att
      end
    end
  end

  def datewise_report
    @from_date = params[:latemark_master][:from_date]
    @to_date = params[:latemark_master][:to_date]
    @latemark_master = LatemarkMaster.last
    @latemark_master_time = @latemark_master.company_time
    @company_time = @latemark_master_time.strftime("%I:%M")
    @emp_att = []
    @employee_attendances = EmployeeAttendance.where(day: @from_date.to_date..@to_date.to_date,late_mark: nil).where.not(in_time: nil)
    @employee_attendances.each do |att|
      if att.in_time.strftime("%I:%M") > @company_time
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latemark_master
      @latemark_master = LatemarkMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latemark_master_params
      params.require(:latemark_master).permit(:company_time, :allow_latemark, :amount)
    end
end
