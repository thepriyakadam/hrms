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

  # DELETE /week_off_masters/1
  # DELETE /week_off_masters/1.json
  def destroy
    @week_off_master.destroy
    @week_off_masters = WeekOffMaster.all
  end

  def assign_week_off
    week_off_master = WeekOffMaster.find(params[:format])
    if week_off_master.is_active == true
      for i in week_off_master.from.to_date..week_off_master.to.to_date
        if i.strftime("%a") == week_off_master.day 
          EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "W",department_id: week_off_master.employee.department_id,is_confirm: false)
        else
        end
      end
    week_off_master.update(is_send: true)
    @week_off_masters = WeekOffMaster.all
    flash[:notice] = "Week Off Assign Successfully" 
    redirect_to new_week_off_master_path
  else
  end
    flash[:alert] = "Record is not Active!" 
    redirect_to new_week_off_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_off_master
      @week_off_master = WeekOffMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_off_master_params
      params.require(:week_off_master).permit(:from,:to,:employee_id, :day, :is_active)
    end
end
