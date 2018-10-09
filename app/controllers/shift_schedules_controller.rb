class ShiftSchedulesController < ApplicationController
  before_action :set_shift_schedule, only: [:show, :edit, :update, :destroy]

  # GET /shift_schedules
  # GET /shift_schedules.json
  def index
    @shift_schedules = ShiftSchedule.all
  end

  # GET /shift_schedules/1
  # GET /shift_schedules/1.json
  def show
  end

  # GET /shift_schedules/new
  def new
    @shift_schedule = ShiftSchedule.new

    # joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    # shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)
    # @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")

    if current_user.role.name == 'GroupAdmin'
      shift_time = ShiftTime.where(status: true).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")
    elsif current_user.role.name == 'Admin'
      shift_time = ShiftTime.where(status: true).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")
    elsif current_user.role.name == 'HOD'
      employees = Employee.where(manager_id: current_user.employee_id).pluck("id")
      joining_detail = JoiningDetail.where(employee_id: employees).pluck("cost_center_id")
      shift_time = ShiftTime.where(cost_center_id: joining_detail,status: true).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")
    elsif current_user.role.name == 'Supervisor'
      joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
      shift_time =ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")
    else current_user.role.name == 'Employee'
      shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id,status: true).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time).order("id desc")
    end
    session[:active_tab] = "TimeManagementHod"
  end

  # GET /shift_schedules/1/edit
  def edit
  end

  # POST /shift_schedules
  # POST /shift_schedules.json
  def create
    @shift_schedule = ShiftSchedule.new(shift_schedule_params)

    if @shift_schedule.save
      @shift_schedule = ShiftSchedule.new
      joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
      shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)
      @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time)

      #@shift_schedules = ShiftSchedule.all
      @flag=true 
    else
      @flag=false
    end
  end

  # PATCH/PUT /shift_schedules/1
  # PATCH/PUT /shift_schedules/1.json
  def update
    @shift_schedule.update(shift_schedule_params)
    @shift_schedule = ShiftSchedule.new
    joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)
    @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time)

    #@shift_schedules = ShiftSchedule.all
  end

  # DELETE /shift_schedules/1
  # DELETE /shift_schedules/1.json
  def destroy
    @shift_schedule.destroy
    #@shift_schedules = ShiftSchedule.all
    joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)
    @shift_schedules = ShiftSchedule.where(shift_time_id: shift_time)
  end

  def employee_shift
    cost_center = ShiftSchedule.find(params[:format]).shift_time.cost_center
    @employee = JoiningDetail.where(cost_center_id: cost_center.id).pluck(:employee_id)

    @shift_schedule = ShiftSchedule.find(params[:format])
    current_login = Employee.find(current_user.employee_id)
    emps_sub = current_login.subordinates
    emps_ind = current_login.indirect_subordinates

    @emp_sub = emps_sub.where(status: "Active")
    @emp_ind = emps_ind.where(status: "Active")
    #@employee = @emp_sub + @emp_ind
    #joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)

    shift_employee = ShiftEmployee.where(date: @shift_schedule.from.to_date..@shift_schedule.to.to_date).pluck(:employee_id)
    @employees = Employee.where(id: @employee).where.not(id: shift_employee)
    shift_employees = ShiftEmployee.where(shift_schedule_id: @shift_schedule.id,employee_id: @employee).pluck(:employee_id)

    @shift_employees = Employee.where(id: shift_employees)
    
  end

  def shift_employee
    current_login = Employee.find(current_user.employee_id)
    emps_sub = current_login.subordinates
    emps_ind = current_login.indirect_subordinates

    @emp_sub = emps_sub.where(status: "Active")
    @emp_ind = emps_ind.where(status: "Active")
    @employee = @emp_sub + @emp_ind
    
    @shift_schedule = ShiftSchedule.find(params[:shift_schedule_id])
    shift_employees = ShiftEmployee.where(shift_schedule_id: @shift_schedule.id,employee_id: @employee).pluck(:employee_id)
    @shift_employees = Employee.where(id: shift_employees)
    respond_to do |f|
      f.js
      f.xls {render template: 'shift_schedules/shift_employee.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' shift_employee',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'shift_schedules/shift_employee.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def set_employee_shift
    shift_schedule = ShiftSchedule.find(params[:shift_schedule])
    @employee_ids = params[:employee_ids]
    if @employee_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to show_employee_record_shift_schedules_path
    else
      @employee_ids.each do |eid|
        @employee = Employee.find(eid)
        for i in shift_schedule.from.to_date..shift_schedule.to.to_date
          ShiftEmployee.create(shift_schedule_id: shift_schedule.id,employee_id: @employee.id,date: i,created_by_id: current_user.employee_id,shift_time_id: shift_schedule.shift_time_id,status: true)
        end
      end#do
      flash[:notice] = "Set Successfully!!"
    end#if
    redirect_to new_shift_schedule_path
  end

  def view_employee_shift
    @shift_schedule = ShiftSchedule.find(params[:shift_schedule_id])
    @employee = Employee.find(params[:emp_id])
    @shift_employees = ShiftEmployee.where(shift_schedule_id: @shift_schedule.id,employee_id: @employee.id)
  end

  def datewise_shift_employee
  end

  def show_datewise_attendance
    @from = params[:employee][:start_date]
    @to = params[:employee][:end_date]
    
    @employee = params[:employee][:employee_id]

    if @employee.nil?
      current_login = Employee.find(current_user.employee_id)
      emps_sub = current_login.subordinates
      emps_ind = current_login.indirect_subordinates
      @emp_sub = emps_sub.where(status: "Active")
      @emp_ind = emps_ind.where(status: "Active")
      @employee = @emp_sub + @emp_ind
    else
      @employee = params[:employee][:employee_id]
    end

    @shift_employees = ShiftEmployee.where(date: @from.to_date..@to.to_date,employee_id: @employee)
    respond_to do |f|
      f.js
      f.xls {render template: 'shift_schedules/show_datewise_attendance.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_datewise_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'shift_schedules/show_datewise_attendance.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def edit_employee_shift
    @shift_employee = ShiftEmployee.find(params[:format])
  end

  def update_shift
    shift_employee = ShiftEmployee.find(params[:shift_employee_id])
    shift_schedule_id = params[:shift_employee][:shift_schedule_id]

    shift_employee.update(shift_schedule_id: shift_schedule_id)
    flash[:notice] = "Updated Successfully!!"
    redirect_to new_shift_schedule_path
  end

  def update_shift_for_employee
  end

  def show_employee
    @shift_id_1 = params[:shift_id_1]
    @shift_employees = ShiftEmployee.where(shift_time_id: @shift_id_1)
  end

  def update_shift_multiple

    @shift_id_1 = params[:salary][:shift_id_1]
    @shift_id_2 = params[:salary][:shift_id_2]
    
    shift_employee_ids = params[:shift_employee_ids]
      if shift_employee_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        shift_time = ShiftTime.find_by(id: @shift_id_2)
        shift_employee_ids.each do |e|
          shift_employee = ShiftEmployee.find_by(id: e)
          shift_employee.update(shift_time_id: shift_time.id)
          flash[:notice] = "Updated Successfully"
          end
        end
    redirect_to update_shift_for_employee_shift_schedules_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_schedule
      @shift_schedule = ShiftSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_schedule_params
      params.require(:shift_schedule).permit(:shift_time_id, :from, :to, :status)
    end
end
