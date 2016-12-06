class WeekOffMastersController < ApplicationController
  before_action :set_week_off_master, only: [:show, :edit, :update, :destroy]

  # GET /week_off_masters
  # GET /week_off_masters.json
  def index
    @week_off_masters = WeekOffMaster.all
  end

  # GET /week_off_masters/1
  # GET /week_off_masters/1.json
  def show
  end

  # GET /week_off_masters/new
  def new
    @week_off_master = WeekOffMaster.new
    @week_off_masters = WeekOffMaster.all
    session[:active_tab] ="timemgmt"
  end

  # GET /week_off_masters/1/edit
  def edit
  end

  # POST /week_off_masters
  # POST /week_off_masters.json
  def create
    @week_off_master = WeekOffMaster.new(week_off_master_params)
    @week_off_masters = WeekOffMaster.all
    respond_to do |format|
      if @week_off_master.save
        @week_off_master = WeekOffMaster.new 
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Week Off Created Successfully'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /week_off_masters/1
  # PATCH/PUT /week_off_masters/1.json
  def update
     @week_off_master.update(week_off_master_params)
     @week_off_masters = WeekOffMaster.all
     @week_off_master = WeekOffMaster.new
  end

  # DELETE /week_off_masters/1  # DELETE /week_off_masters/1.json
  def destroy
    @week_off_master.destroy
    @week_off_masters = WeekOffMaster.all
    redirect_to week_off_list_path
  end
  
  def week_off_list
    if current_user.role.name == 'Company' 
      @week_off_masters = WeekOffMaster.all
    elsif current_user.role.name == 'CompanyLocation'
      @employees = Employee.where(company_location_id: current_user.company_location_id)
      @week_off_masters = WeekOffMaster.where(employee_id: @employees)
    end
  end

  def employee_list
    @day = params[:week_off_master][:day]
    @from = params[:week_off_master][:from]
    @to = params[:week_off_master][:to]
    @is_active = params[:week_off_master][:is_active]
    @is_prefix = params[:week_off_master][:is_prefix]

    if current_user.class == Member
      if current_user.role.name == 'Company'
      @employees = Employee.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
    else
      @employees = Employee.all
    end
  end
end

  def create_week_off
    @employee_ids = params[:employee_ids]
    @employee = Employee.where(id: @employee_ids)
    day = params[:week_off_masters][:day]
    from = params[:week_off_masters][:from]
    to = params[:week_off_masters][:to]
    is_active = params[:week_off_masters][:is_active]
    is_prefix = params[:week_off_masters][:is_prefix]
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        WeekOffMaster.create(employee_id: eid,day: day,from: from,to: to,is_active: is_active,is_prefix: is_prefix)
        flash[:notice] = "Created successfully"
      end
    end
    redirect_to new_week_off_master_path
  end

  def assign_week_off
    week_off_master = WeekOffMaster.find(params[:format])
    if week_off_master.is_active == true
      for i in week_off_master.from.to_date..week_off_master.to.to_date
        if i.strftime("%a") == week_off_master.day
          @emp_attendance = EmployeeAttendance.where(employee_id: week_off_master.employee_id,day: i).take
          if @emp_attendance.try(:present) == nil
            EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "W",department_id: week_off_master.employee.department_id,is_confirm: false)
          else
          end
        else
        end
      end
      week_off_master.update(is_send: true)
      @week_off_masters = WeekOffMaster.all
      flash[:notice] = "Week Off Assign Successfully"
    else
    flash[:alert] = "Record is not Active!"
    end 
    redirect_to week_off_list_week_off_masters_path
  end

  def edit_modal
    @week_off_master = WeekOffMaster.find(params[:format])
  end

  def update_week_off
    @week_off_master = WeekOffMaster.find(params[:week_off_id])
    @week_off_master.update(week_off_master_params)
     flash[:notice] = 'Week Off Updated Successfully'
     redirect_to week_off_list_week_off_masters_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_off_master
      @week_off_master = WeekOffMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_off_master_params
      params.require(:week_off_master).permit(:is_prefix,:from,:to,:employee_id, :day, :is_active)
    end
end
