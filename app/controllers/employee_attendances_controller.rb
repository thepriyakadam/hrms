class EmployeeAttendancesController < ApplicationController
  before_action :set_employee_attendance, only: [:show, :edit, :update, :destroy]
  before_action :check_params, only: [:create_attendance]

  # GET /employee_attendances
  # GET /employee_attendances.json
  def index
    @employee_attendances = EmployeeAttendance.group("strftime('%Y',day)")
    session[:active_tab] = "timemgmt"
  end

  # GET /employee_attendances/1
  # GET /employee_attendances/1.json
  def show
  end

  # GET /employee_attendances/new
  def new
    @employee_attendance = EmployeeAttendance.new
    session[:active_tab] = "timemgmt"
  end

  # GET /employee_attendances/1/edit
  def edit
  end

  # POST /employee_attendances
  # POST /employee_attendances.json
  def create
    @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    respond_to do |format|
      if @employee_attendance.save
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully created.' }
        format.json { render :show, status: :created, location: @employee_attendance }
      else
        format.html { render :new }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_attendances/1
  # PATCH/PUT /employee_attendances/1.json
  def update
    respond_to do |format|
      if @employee_attendance.update(employee_attendance_params)
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_attendance }
      else
        format.html { render :edit }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_attendances/1
  # DELETE /employee_attendances/1.json
  def destroy
    @employee_attendance.destroy
    respond_to do |format|
      format.html { redirect_to employee_attendances_url, notice: 'Employee attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def department_wise_employee_list
    @costcenter, @date = params[:salary][:name], params[:salary][:day].to_date
    #@department = params[:salary][:department_id]
    if Holiday.exists?(holiday_date: @date)
      @holiday_flag = true
      @holiday = Holiday.find_by(holiday_date: @date)
    else
      @holiday_flag = false
      if current_user.class == Member
      if current_user.role.name == 'CompanyLocation'
      @employees = Employee.where(company_location_id: current_user.company_location_id).filter_by_date_and_costcenter(@date, @costcenter, current_user)

      elsif
      @employees = Employee.filter_by_date_and_costcenter(@date, @costcenter, current_user)
      #@employees = Employee.filter_by_date_costcenter_and_department(@date, @costcenter, @department, current_user)

      end
    end
      @employee_attendance = EmployeeAttendance.new
    end  
  end
    
  def create_employee_attendance
    @employee_ids = params[:employee_ids]
    day = params[:employee_attendances][:day]
    present = params[:employee_attendances][:present]
    #department = params[:employee_attendances][:department_id]
    @employee = Employee.where(id: @employee_ids)
    
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        @emp = Employee.find_by_id(eid)
      EmployeeAttendance.create(employee_id: eid,day: day,present: present,department_id: @emp.department_id, is_confirm: false)  
      #Holiday.where(holiday_date: day).update_all(is_taken: true)
      flash[:notice] = "Created successfully"
      end
    end
    redirect_to new_employee_attendance_path
  end

  def attendance
    @year = params[:year]
    @month = params[:month]
    @department = params[:department_id]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def revert_attendance
  end

  def show_employee
    @costcenter_id =params[:salary][:costcenter_id]
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id).pluck(:employee_id)
    #@department_id = params[:salary][:department_id]
    @day = params[:salary][:day]
    @present = params[:salary][:present]
    @employee_attendances = EmployeeAttendance.where(present: @present ,employee_id: @costcenter).where(day: @day.to_date,is_confirm: false).group(:employee_id)
  end

  def destroy_employee_attendance
    @costcenter_id =params[:costcenter_id]
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id).pluck(:employee_id)
    @day = params[:day]
    @present = params[:present]
    @employee_attendance_ids = params[:employee_attendance_ids]
    if @employee_attendance_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to revert_attendance_employee_attendances_path
    else
      @employee_attendance_ids.each do |eid|
        @employee_attendance = EmployeeAttendance.find(eid)
        EmployeeAttendance.where(id: eid).destroy_all
      end
      flash[:notice] = "Revert successfully"
      redirect_to revert_attendance_employee_attendances_path
    end
  end

  def department_wise_emp
    @year = params[:year]
    @month = params[:month]
    @department = params[:salary][:department_id]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? AND department_id = ?", @date.strftime('%m/%Y'),@department).group(:employee_id)
  end

  def monthly_attendance
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

   def display_attendance_1
    @month = params[:month]
    @year = params[:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end
                                
  def create_attendance
    @employees, @attendances, work_data_structure, @date = params[:employees], params[:attendances], [], params[:date]
    params.permit!
    @employees.each { |e| work_data_structure << params[e] }
    EmployeeAttendance.where(employee_id: @employees).where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.to_date.strftime('%m/%Y'),false).update_all(is_confirm: true)
    Workingday.create(work_data_structure)
    flash[:notice] = "Workingday successfully saved."
    redirect_to employee_attendances_path
  end

  def costcenter_wise_attendance
  end

  def show_costcenter_wise_attendance
    @year, @month = params[:year], params[:month]
    @costcenter_id =params[:costcenter]
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id).pluck(:employee_id)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @costcenter).group(:employee_id)
  end 

  def employee_slip
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_attendances/employee_attendance.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
            end
         end
  end

  def employee_slip_xls
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
      format.xls {render template: 'employee_attendances/employee_attendance.xls.erb'}
    end
  end
  
  def revert_attendance_employeewise
  end

  def show_employee_list
    @employee_id = params[:salary][:employee_id]
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @employee_attendances = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and employee_id = ?", @date.strftime('%m/%Y'),@employee_id)
  end

  def destroy_attendance_employeewise
    @employee_id = params[:employee_id]
    @month = params[:month]
    @year = params[:year]
    @employee_attendance_ids = params[:employee_attendance_ids]
      if @employee_attendance_ids.nil?
        flash[:alert] = "Please Select Employees"
        redirect_to revert_attendance_employeewise_employee_attendances_path
      else
        @employee_attendance_ids.each do |eid|
          @employee_attendance = EmployeeAttendance.find(eid)
          EmployeeAttendance.where(id: eid).destroy_all
        end
        flash[:notice] = "Revert successfully"
        redirect_to revert_attendance_employeewise_employee_attendances_path
      end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee_attendance
    @employee_attendance = EmployeeAttendance.find(params[:id])
  end

  def check_params
    if params[:employees].nil?
      flash[:alert] = "Please Select employees checkbox."
      redirect_to employee_attendances_path
    end 
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_attendance_params
    params.require(:employee_attendance).permit(:employee_id, :day, :present, :in_time, :out_time)
  end
end
