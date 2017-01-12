class EmployeeAttendancesController < ApplicationController
  before_action :set_employee_attendance, only: [:show, :edit, :update, :destroy]
  before_action :check_params, only: [:create_attendance]

  # GET /employee_attendances
  # GET /employee_attendances.json
  def index
    @employee_attendances = EmployeeAttendance.group("strftime('%Y',day)")
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"

  end

  # GET /employee_attendances/1
  # GET /employee_attendances/1.json
  def show
  end

  # GET /employee_attendances/new
  def new
    @employee_attendance = EmployeeAttendance.new
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
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
        if current_user.role.name == 'GroupAdmin'
          @employees = Employee.where(status: "Active").filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif current_user.role.name == 'Admin'
          @employees = Employee.where(status: "Active",company_id: current_user.company_location.company_id).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif current_user.role.name == 'Branch'
          @employees = Employee.where(status: "Active",company_location_id: current_user.company_location_id).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif
        @employees = Employee.where(status: "Active").filter_by_date_and_costcenter(@date, @costcenter, current_user)
        #@employees = Employee.filter_by_date_costcenter_and_department(@date, @costcenter, @department, current_user)
        end
      @emp_attendances = EmployeeAttendance.where("strftime('%m/%Y', day) = ? AND present = ?", @date.strftime('%m/%Y'), "W")
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
      @emp_attendances = EmployeeAttendance.where("strftime('%m/%Y', day) = ? AND present = ?", @date.strftime('%m/%Y'), "H")
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
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
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
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
         @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @emp = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)   
      elsif current_user.role.name == 'Branch'
        @emp = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      end
    end
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def display_attendance_2
    @month = params[:month]
    @year = params[:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day

    @start_date = @date
    @end_date = @date.end_of_month
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
         @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
      elsif current_user.role.name == 'Admin'
          @emp = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      elsif current_user.role.name == 'Branch'
          @emp = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      end
    end
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end
                                
  def create_attendance
      @employees, @attendances, work_data_structure = params[:employees], params[:attendances], []
     
      @month = params[:month]
      @year = params[:year]
      @date = Date.new(@year.to_i, Workingday.months[@month])

      params.permit!
      @employees.each { |e| work_data_structure << params[e] }
      #byebug
      a = Workingday.create(work_data_structure)      
      # @employees.try(:each) do |x| 
      #   EmployeeAttendance.where("employee_id = ? AND strftime('%m/%Y', day) = ?",x,@date.strftime('%m/%Y')).update_all(is_confirm: true)
      # end
      @emp1 = params[:employees]
      b=a.last
      @payroll_overtime_masters = PayrollOvertimeMaster.where(is_active: true,is_payroll: true).take
      @emp1.try(:each) do |x| 
      emp_attend=EmployeeAttendance.where(employee_id: x,month_name: b.month_name)
      
      EmployeeAttendance.where("strftime('%m/%Y', day) = ? AND employee_id = ?", @date.strftime('%m/%Y'),x).update_all(is_confirm: true)
      EmployeeWeekOff.where("strftime('%m/%Y', date) = ? AND employee_id = ?", @date.strftime('%m/%Y'),x).update_all(is_confirm: true)
      # ff=EmployeeAttendance.where(employee_id: x,month_name: b.month_name).take
      
      ot_hours=emp_attend.sum(:overtime_hrs).to_f
      diff_hours=emp_attend.sum(:difference_hrs).to_f
      calculated_diff=ot_hours-diff_hours
      # Workingday.where(employee_id: x).update_all(ot_days: calculated_diff.to_f / @payroll_overtime_masters.company_hrs.to_f)
      Workingday.where(employee_id: x).update_all(ot_days: calculated_diff.to_f)
      # d=Workingday.where(employee_id: x)
      #   d.each do |f|
      #     f.update(calculated_payable_days: f.payable_day)
      #   end
      end
      work=Workingday.where("ot_days < ?", 0).pluck(:id)
      @workingdays = Workingday.where(id: work)
      @workingdays.each do |wor|
      
      emp_att=EmployeeAttendance.where(employee_id: wor.employee_id,month_name: wor.month_name)

      overtime_hours=emp_att.sum(:overtime_hrs).to_f
      difference_hours=emp_att.sum(:difference_hrs).to_f
      calculated_diff_hours=(overtime_hours-difference_hours)
      total_hrs =  wor.payable_day.to_f * @payroll_overtime_masters.company_hrs.to_f
      result = total_hrs - wor.ot_days.abs.to_f
      final_payable_day = result / @payroll_overtime_masters.company_hrs.to_f
      # byebug
      Workingday.where(id: wor,employee_id: wor.employee_id).update_all(calculated_payable_days: final_payable_day.to_f,ot_days: nil)
      # Workingday.update_all(is_confirm: true)
      end


      flash[:notice] = "Workingday successfully saved."
      redirect_to employee_attendances_path
  end

  def costcenter_wise_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def show_costcenter_wise_attendance
    @year, @month = params[:year], params[:month]
    @costcenter_id =params[:costcenter]
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id).pluck(:employee_id)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @costcenter).group(:employee_id)
  end 

  def employee_attendance_excel_report
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @emp = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      elsif current_user.role.name == 'Branch'
        @emp = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)     
      end
    end
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
    format.xls {render template: 'employee_attendances/employee_attendance_1.xls.erb'}
    end
  end

  def employee_attendance_pdf_report
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @emp = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      elsif current_user.role.name == 'Branch'
        @emp = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      end
    end
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
      respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'employee_attendance',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'employee_attendances/employee_slip_pdf.pdf.erb',
                  show_as_html: params[:debug].present?,
                  margin:  { top:1,bottom:1,left:1,right:1 }
                end
             end
  end

  def costcenter_wise_excel1
    @year, @month ,@cost_center = params[:year], params[:month] , params[:cost_center]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
    format.xls {render template: 'employee_attendances/costcenter_wise_excel.xls.erb'}
    end
  end

  def costcenter_wise_pdf
     @year, @month ,@cost_center = params[:year], params[:month],params[:cost_center]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_attendances/costcenter_wise_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
            end
         end
    
  end
  
  def revert_attendance_employeewise
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
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
  

  def display_employee_attendance_list
    @month = params[:month].to_s
    @year = params[:year].to_s
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id).group(:employee_id)
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
  end

  def employee_attendances_list
    # @employees1 = EmployeeAttendance.where(employee_id: current_user.employee_id)
    # @employees1.each do |s|
    #   @month = s.day.strftime("%B")
    #   @year = s.day.strftime("%Y")
    # end
    @employees1 = EmployeeAttendance.where(employee_id: current_user.employee_id).take
    @month = @employees1.day.strftime("%B")
    @year = @employees1.day.strftime("%Y")
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id).group(:employee_id)
  end

  def attendance_report
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def confirm_attendance
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    #@emp = Employee.where(status: "Active").pluck(:id)
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def create_attendance_1
    @employees, @attendances, work_data_structure, @date = params[:employees], params[:attendances], [], params[:date]
    params.permit!
    @employees.each { |e| work_data_structure << params[e] }
    #EmployeeAttendance.where(employee_id: @employees).where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.to_date.strftime('%m/%Y'),false).update_all(is_confirm: true)
    Workingday.create(work_data_structure)
    flash[:notice] = "Workingday successfully saved."
    redirect_to confirm_attendance_form_employee_attendances_path
  end

  def emp_attendance_1_list
    @month = params[:month]
    @year = params[:year]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end
  
  def calculate_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def display_total
    @month = params[:month]
    @year = params[:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    #@day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def attendance_total_xls
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.strftime('%m/%Y'),false).group(:employee_id)
    respond_to do |format|
      format.xls {render template: 'employee_attendances/attendance_total.xls.erb'}
    end
  end

  def attendance_total_pdf
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
              template: 'employee_attendances/attendance_total_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def select_date_department_form
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Reports"
  end

  def show_departmntwise_employee
    @date = params[:salary][:date]
    @department = params[:salary][:company_location_id]
    @employees = Employee.where(department_id: @department).pluck(:id)
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date ,employee_id: @employees)
  end

  def department_wise_pdf
    @date = params[:date]
    @department = params[:department]
    @employees = Employee.where(department_id: @department).pluck(:id)
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date,employee_id: @employees)
    
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_department_wise',
        layout: '/layouts/pdf.html.erb',
        :template => 'employee_attendances/print_department_wise.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
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

  def department_wise_xls
    @date, @department = params[:date], params[:department]
    @employees = Employee.where(department_id: @department).pluck(:id)
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date,employee_id: @employees)
    respond_to do |format|
      format.xls {render template: 'employee_attendances/print_department_wise.xls.erb'}
    end
  end

  def select_date_present_form
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Reports"
  end

  def show_datewise_employee
    @date = params[:date]
    @present = params[:present]
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date,present: @present)
  end

  def date_wise_pdf
    @date = params[:date]
    @present = params[:present]
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date,present: @present)
    
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_date_wise',
        layout: '/layouts/pdf.html.erb',
        :template => 'employee_attendances/print_date_wise.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
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

  def date_wise_xls
    @date, @present = params[:date], params[:present]
    @employee_attendances = EmployeeAttendance.where(day: @date.to_date,present: @present)
    respond_to do |format|
      format.xls {render template: 'employee_attendances/print_date_wise.xls.erb'}
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
