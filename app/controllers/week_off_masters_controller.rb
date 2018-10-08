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
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  # GET /week_off_masters/1/edit
  def edit
  end


  def show_employee_attendance
    @week_off_master = WeekOffMaster.find(params[:week_off_master_id])
    @employee_week_off = EmployeeWeekOff.where(week_off_master_id: @week_off_master.id).pluck(:id)
    @employee_attendances = EmployeeAttendance.where(employee_week_off_id: @employee_week_off)
    respond_to do |f|
      f.js
      f.xls {render template: 'week_off_masters/show_employee_attendance.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'week_off_masters/show_employee_attendance.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
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
    if @week_off_master.update(week_off_master_params)
      @flag = true
    else
     @flag = false
    end
    redirect_to week_off_list_week_off_masters_path
     # @week_off_masters = WeekOffMaster.all
     # @week_off_master = WeekOffMaster.new
  end

  # DELETE /week_off_masters/1  # DELETE /week_off_masters/1.json
  def destroy
    @week_off_master.destroy
    @week_off_masters = WeekOffMaster.all
    redirect_to week_off_list_week_off_masters_path
  end
  
  def week_off_list
    if current_user.role.name == 'GroupAdmin' 
      @employees = Employee.where(status: 'Active')
      @week_off_masters = WeekOffMaster.where(is_send: nil).where(employee_id: @employees)
    elsif current_user.role.name == 'Admin'
      @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id)
      @week_off_masters = WeekOffMaster.where(is_send: nil).where(employee_id: @employees)
    elsif current_user.role.name == 'Branch'
      @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
      @week_off_masters = WeekOffMaster.where(is_send: nil).where(employee_id: @employees)
    elsif current_user.role.name == 'Costomize'
      @employees = Employee.where(status: 'Active')
      @week_off_masters = WeekOffMaster.where(is_send: nil).where(employee_id: @employees)
    end
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  def employee_list
    @week_off_master = WeekOffMaster.new(week_off_master_params)

    @department_id = params[:employee][:department_id]
    @day = params[:week_off_master][:day]
    @from = params[:week_off_master][:from]
    @to = params[:week_off_master][:to]
    @first = params[:week_off_master][:first]
    @second = params[:week_off_master][:second]
    @third = params[:week_off_master][:third]
    @forth = params[:week_off_master][:forth]
    @fifth = params[:week_off_master][:fifth]
    @is_active = params[:week_off_master][:is_active]

      if @department_id == ""
        if current_user.role.name == 'GroupAdmin'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where.not(id: @emp_id)      
        elsif current_user.role.name == 'Admin'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).where.not(id: @emp_id)
        elsif current_user.role.name == 'Branch'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).where.not(id: @emp_id)
        else
          @employees = Employee.where(status: 'Active')
        end
      else
        if current_user.role.name == 'GroupAdmin'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where(department_id: @department_id).where.not(id: @emp_id)      
        elsif current_user.role.name == 'Admin'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where(department_id: @department_id,status: 'Active',company_id: current_user.company_location.company_id).where.not(id: @emp_id)
        elsif current_user.role.name == 'Branch'
          @emp_id = WeekOffMaster.where(day: @day,from: @from.to_date,to: @to.to_date).pluck(:employee_id)
          @employees = Employee.where(department_id: @department_id,status: 'Active',company_location_id: current_user.company_location_id).where.not(id: @emp_id)
        else
          @employees = Employee.where(department_id: @department_id,status: 'Active')
        end
      end
  end

  def create_week_off
    @employee_ids = params[:employee_ids]
    @employee = Employee.where(id: @employee_ids)
    day = params[:week_off_masters][:day]
    from = params[:week_off_masters][:from]
    to = params[:week_off_masters][:to]
    first = params[:week_off_masters][:first]
    second = params[:week_off_masters][:second]
    third = params[:week_off_masters][:third]
    forth = params[:week_off_masters][:forth]
    fifth = params[:week_off_masters][:fifth]
    is_active = params[:week_off_masters][:is_active]
    is_prefix = params[:week_off_masters][:is_prefix]

      if @employee_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @employee_ids.each do |eid|
          WeekOffMaster.create(employee_id: eid,day: day,from: from,to: to,is_active: is_active,is_prefix: is_prefix,first: first,second: second,
            third: third,forth: forth,fifth: fifth)
          flash[:notice] = "Created successfully"
        end
      end
    redirect_to new_week_off_master_path
  end

  def assign_week_off
    @week_off_master_ids = params[:week_off_master_ids]
    if @week_off_master_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @week_off_master_ids.each do |wid|
        week_off_master = WeekOffMaster.find_by(id: wid)
        if week_off_master.is_active == true
          for i in week_off_master.from.to_date..week_off_master.to.to_date
            if i.strftime("%a") == week_off_master.day
              count = (i.to_date.day - 1).to_i/7
              
             @emp_attendance = EmployeeAttendance.where(employee_id: week_off_master.employee_id,day: i).take
              if @emp_attendance.nil?
                if week_off_master.first == true ||  week_off_master.second == true || week_off_master.third == true || week_off_master.forth == true || week_off_master.fifth == true
                    
                    if week_off_master.first == true && count == 0
                      employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                      EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "WO",department_id: week_off_master.employee.department_id,is_confirm: false,employee_week_off_id: employee_week_off.id,comment: "Week off set")
                    elsif week_off_master.second == true && count == 1
                      employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                      EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "WO",department_id: week_off_master.employee.department_id,is_confirm: false,employee_week_off_id: employee_week_off.id,comment: "Week off set")
                    elsif week_off_master.third == true && count == 2
                      employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                      EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "WO",department_id: week_off_master.employee.department_id,is_confirm: false,employee_week_off_id: employee_week_off.id,comment: "Week off set")
                    elsif week_off_master.forth == true && count == 3
                      employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                      EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "WO",department_id: week_off_master.employee.department_id,is_confirm: false,employee_week_off_id: employee_week_off.id,comment: "Week off set")
                    elsif week_off_master.fifth == true && count == 4
                      employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                      EmployeeAttendance.create(employee_id: week_off_master.employee_id,day: i,present: "WO",department_id: week_off_master.employee.department_id,is_confirm: false,employee_week_off_id: employee_week_off.id,comment: "Week off set")
                    end
                else
                end

              else
                if @emp_attendance.try(:employee_leav_request_id) != nil
                  if week_off_master.first == true && count == 0
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,comment: "Leave Request has been sent before week off set")
                  elsif week_off_master.second == true && count == 1
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,comment: "Leave Request has been sent before week off set")
                  elsif week_off_master.third == true && count == 2
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,comment: "Leave Request has been sent before week off set")
                  elsif week_off_master.forth == true && count == 3
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,comment: "Leave Request has been sent before week off set")
                  elsif week_off_master.fifth == true && count == 4
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,comment: "Leave Request has been sent before week off set")
                  end
                elsif @emp_attendance.try(:on_duty_request_id) != nil
                  if week_off_master.first == true && count == 0
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOOD",comment: "Od Request has been sent before week off")
                  elsif week_off_master.second == true && count == 1
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOOD",comment: "Od Request has been sent before week off")
                  elsif week_off_master.third == true && count == 2
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOOD",comment: "Od Request has been sent before week off")
                  elsif week_off_master.forth == true && count == 3
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOOD",comment: "Od Request has been sent before week off")
                  elsif week_off_master.fifth == true && count == 4 
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOOD",comment: "Od Request has been sent before week off")
                  end
                elsif @emp_attendance.try(:holiday_id) != nil
                  if week_off_master.first == true && count == 0
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOH",comment: "Holiday has been set before week off") 
                  elsif week_off_master.second == true && count == 1
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOH",comment: "Holiday has been set before week off") 
                  elsif week_off_master.third == true && count == 2
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOH",comment: "Holiday has been set before week off") 
                  elsif week_off_master.forth == true && count == 3
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOH",comment: "Holiday has been set before week off") 
                  elsif week_off_master.fifth == true && count == 4 
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WOH",comment: "Holiday has been set before week off") 
                  end
                else
                  if week_off_master.first == true && count == 0
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WO",comment: "Week off set after attendance setup") 
                  elsif week_off_master.second == true && count == 1
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WO",comment: "Week off set after attendance setup") 
                  elsif week_off_master.third == true && count == 2
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WO",comment: "Week off set after attendance setup") 
                  elsif week_off_master.forth == true && count == 3
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WO",comment: "Week off set after attendance setup") 
                  elsif week_off_master.fifth == true && count == 4 
                    employee_week_off = EmployeeWeekOff.create(week_off_master_id: wid,employee_id: week_off_master.employee_id,day: week_off_master.day,date: i)
                    @emp_attendance.update(employee_week_off_id: employee_week_off.id,present: "WO",comment: "Week off set after attendance setup") 
                  end
                end
              end
            else
            end
          end
          week_off_master.update(is_send: true)
          @week_off_masters = WeekOffMaster.all
        else
          flash[:alert] = "Record is not Active!"
        end 
          #redirect_to week_off_list_week_off_masters_path
        end #do
        flash[:notice] = "Week Off Assign Successfully"
      end
      redirect_to week_off_list_week_off_masters_path
  end

  def edit_modal
    @week_off_master = WeekOffMaster.find(params[:format])
  end

  def update_week_off
    @week_off_master = WeekOffMaster.find(params[:week_off_master_id])

    params_from = week_off_master_params["from"]
    params_to = week_off_master_params["to"]

    payroll_period = PayrollPeriod.where(status: true).take 
    #if  params_from.to_date >= payroll_period.from.to_date && params_to.to_date <= payroll_period.to.to_date
      @week_off_master.update(week_off_master_params)
       flash[:notice] = 'Week Off Updated Successfully'
    # else
    #   flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
    # end

    redirect_to week_off_list_week_off_masters_path
  end

  def revert_week_off_master
  end

  def show_weekoff_master_data
    @employee_id = params[:employee][:employee_id]
    from = params[:employee][:from]
    to = params[:employee][:to]
    day = params[:employee][:day]
     if @employee_id == "" && from == nil && to == nil
        @week_off_masters = WeekOffMaster.where(day: day)
     elsif @employee_id == "" 
      @week_off_masters = WeekOffMaster.where(from: from.to_date,to: to.to_date,day: day)
     elsif from == nil || to == nil
      @week_off_masters = WeekOffMaster.where(employee_id: @employee_id,day: day)
     else
      @week_off_masters = WeekOffMaster.where(employee_id: @employee_id,from: from.to_date,to: to.to_date,day: day)
    end
  end

  def revert_master_data
    @week_off_master = WeekOffMaster.find(params[:week_off_master_id])
    @employee_week_off = EmployeeWeekOff.where(week_off_master_id: @week_off_master.id).pluck(:id)
    @employee_attendance = EmployeeAttendance.where(employee_week_off_id: @employee_week_off).destroy_all
    @employee_week_offs = EmployeeWeekOff.where(week_off_master_id: @week_off_master.id).destroy_all
    @week_off_master.destroy
    flash[:notice] = 'Week Off Reverted '
    redirect_to revert_week_off_master_week_off_masters_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_off_master
      @week_off_master = WeekOffMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_off_master_params
      params.require(:week_off_master).permit(:is_prefix,:from,:to,:employee_id, :day, :is_active,:first,:second,:third,:forth,:fifth)
    end
end
