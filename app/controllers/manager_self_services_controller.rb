class ManagerSelfServicesController < ApplicationController
	def subordinate_list
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def appraiser_subordinate
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(appraisee_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def reviewer_subordinate
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(appraiser_confirm: true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_list
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(" appraiser_confirm = ? OR reviewer_confirm = ?", true,true).group(:period_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def reporties_list
    session[:active_tab] ="ManagerSelfService"
    @employee = Employee.find_by(id: current_user.employee_id)
    @employees = Employee.where("manager_id = ? OR manager_2_id = ?",@employee,@employee)
  end

  def reporties_profile_modal
    @employee = Employee.find(params[:employee_id])
    @joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
  end

  def approved_or_rejected_leave_request
    if current_user.class == Group
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false)
    else
      @pending_employee_leav_requests = EmployeeLeavRequest.where(current_status: "Pending", first_reporter_id: current_user.employee_id)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false, second_reporter_id: current_user.employee_id)
    end
    session[:active_tab] ="ManagerSelfService"
  end

  def all_leave_request_list
    if current_user.class == Group
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false)
    else
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)

      @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @emp_leav_req)
    end
    session[:active_tab] ="ManagerSelfService"
  end

  def request_approval_list
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
      @pending_on_duty_requests = OnDutyRequest.where(current_status: "Pending", employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: @employees_ind)
    session[:active_tab] ="ManagerSelfService"
  end

  def short_leave_approval
   # @emp = Employee.find_by(id: current_user.employee_id)
    #current_login = Employee.find_by(id: current_user.employee_id)  
    @emp = Employee.find(current_user.employee_id)
    employees = @emp.subordinates
    employees_ind = @emp.indirect_subordinates
    @employees = employees.where(status: "Active").pluck(:id)
    @employees_ind = employees_ind.where(status: "Active").pluck(:id)

    @employee = @employees + @employees_ind

    # emps = current_login.subordinates
    # @all = emps.where(status: "Active")
    # subordinates = @all.pluck(:id)
    # emps = current_login.indirect_subordinates
    # @all = emps.where(status: "Active")
    # indirect_subordinates = @all.pluck(:id)
    
    @short_leave_requests = ShortLeaveRequest.where(employee_id: @employee,status: "Pending" )
  end

  def od_request_list
   
      @first_level_request_lists = OnDutyRequest.where(current_status: "Pending")
      @on_duty_request = OnDutyRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @on_duty_request)
    
    session[:active_tab] ="ManagerSelfService"
  end
  
  def training_request_list
    @training_requests = TrainingRequest.where("reporting_master_id = ? and (status = ? or status = ? or status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] = "ManagerSelfService"
  end

  def final_approval_training_list
    @training_requests = TrainingRequest.where(status: "SecondApproved")
  	session[:active_tab] ="ManagerSelfService"
  end

  def resignation_history
    @pending_resignation_requests = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false,reporting_master_id: current_user.employee_id)
    @first_approved_resignation_requests = EmployeeResignation.where(is_first_approved: true, is_second_approved: false,is_second_rejected: false, is_cancelled: false,second_reporter_id: current_user.employee_id)
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_resignation_history
    @emp = Employee.find(current_user.employee_id)
    @sub = @emp.subordinates
    @ind_sub = @emp.indirect_subordinates
    @employee = @sub + @ind_sub

    @employee_resignations = EmployeeResignation.where(employee_id: @employee).group(:employee_id)
  end

  def final_approval_emp_resignation_list
    @employee_resignations = EmployeeResignation.where("(resign_status = ?)","SecondApproved")
    session[:active_tab] ="ManagerSelfService"
  end

  def employee_attendance
    session[:active_tab] ="ManagerSelfService"
  end

  def show_datewise_attendance
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee = @employees + @employees_ind

    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_id = params[:employee][:employee_id]
    # @latemark_master = LatemarkMaster.last
    # @latemark_master_time = @latemark_master.company_time
    # @company_time = @latemark_master_time.strftime("%I:%M")
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day ASC")
  end

  def subordinate_attendance
    session[:active_tab] ="ManagerSelfService"
  end

  def show_subordinate_attendance
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee_id = @employees + @employees_ind

    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day DESC")

     respond_to do |format|
        format.js
        format.xls {render template: 'manager_self_services/subordinate_attendance.xls.erb'}
        format.html
        format.pdf do
        render pdf: 'show_subordinate_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'manager_self_services/subordinate_attendance.pdf.erb',
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

  def investment_declaration
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] = "IncomeTax"
    @emp = InvestmentDeclaration.where(status: true,is_confirm: false).pluck(:employee_id)
    @employees = Employee.where(status: 'Active',id: @emp)
  end

  def investment_declaration_list
    @employee_id = params[:employee_id]
    @emp = Employee.find_by(id: @employee_id)
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.where(employee_id: @employee_id,status: true,is_confirm: false)
  end

  def reject_declaration
    comment = params[:comment]
    investment_declaration_id = params[:investment_declaration_id]
    @investment_declaration = InvestmentDeclaration.find_by(id: investment_declaration_id)
    @investment_declaration.update(status: false,comment: comment)
    flash[:alert] = "Rejected!"
    redirect_to investment_declaration_manager_self_services_path
  end

  def leave_c_off 
    session[:active_tab] ="ManagerSelfService"
    current_login = Employee.find_by(id: current_user.employee_id)
    @sub = current_login.subordinates
    @ind_sub = current_login.indirect_subordinates

    @emp = @sub + @ind_sub
    @leave_c_off_pending = LeaveCOff.where(employee_id: @sub,is_taken: false,status: false,is_expire: false,current_status: "Pending")
    @leave_c_off_first_approved = LeaveCOff.where(employee_id: @ind_sub,is_taken: false,status: false,is_expire: false,current_status: "FirstApproved")

  end

  def employee_resignation_history
    @emp = Employee.find(current_user.employee_id)
    @sub = @emp.subordinates
    @ind_sub = @emp.indirect_subordinates
    @employee = @sub + @ind_sub

    @employee_resignations = EmployeeResignation.where(employee_id: @employee).group(:employee_id)
  end

  def shift_wise_system_base
    joining_detail = JoiningDetail.find_by(employee_id: current_user.employee_id)
    shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)

    @shift_employees = ShiftEmployee.where(shift_time_id: shift_time).group(:date,:shift_time_id).order("date desc")
    session[:active_tab] ="TimeManagementHod"
  end

  def system_base_attendance
    date = Date.today
    shift_employee = ShiftEmployee.find(params[:shift_employee_id])
    @date = shift_employee.date
    # joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
    
    @employees = Employee.where(status: "Active").where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id)
    employee_id = @employees.pluck(:id)
    #byebug
    @shift_employees = ShiftEmployee.where(shift_schedule_id: shift_employee.shift_schedule_id,date: @date,employee_id: employee_id)
  end

  def show_system_attendance
    #byebug
    @employees = Employee.where(status: "Active").where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id)
    employee_id = @employees.pluck(:id)
    @shift_employee = ShiftEmployee.find(params[:shift_employee_id])

    @shift_employees = ShiftEmployee.where(shift_schedule_id: @shift_employee.shift_schedule_id,date: @shift_employee.date,employee_id: employee_id).pluck(:employee_id)
    @employee_attendances = EmployeeAttendance.where(employee_id: @shift_employees,day: @shift_employee.date)
  end

  def create_systembase_attendance
    #date = Date.today
    time = Time.now
    @time = time.strftime("%H:%M:%S")
    shift_employee = ShiftEmployee.find(params[:format])
    @date = shift_employee.date
    emp = shift_employee.employee_id
    employee = Employee.find_by(id: emp)
    if EmployeeAttendance.exists?(day: @date.to_date,employee_id: employee.id)
      emp_attendance = EmployeeAttendance.where(day: @date.to_date,employee_id: employee.id).take

      total_hrs =  @time.to_time - emp_attendance.try(:in_time)
      working_hrs = Time.at(total_hrs).strftime("%H:%M")
      @employee_attendance = EmployeeAttendance.find_by(id: emp_attendance.id).update(out_time: @time,working_hrs: working_hrs)
    else
      EmployeeAttendance.create(employee_id: employee.id,day: @date.to_date,present: "P",in_time: @time,out_time: @time,count: 1.0,department_id: employee.department_id,comment: "System Base")
    end
    redirect_to system_base_attendance_manager_self_services_path(shift_employee_id: shift_employee.id)
  end

  def view_attendance
    shift_employee = ShiftEmployee.find(params[:format])
    employee = shift_employee.employee_id
    date = shift_employee.date
    @employee_attendances = EmployeeAttendance.where(employee_id: employee,day: date.to_date)
  end

  def add_attendance
    session[:active_tab] ="ManagerSelfService"
  end

  def managerwise_attendance_list
    @date =  params[:salary][:day].to_date
    @shift_time_id = params[:salary][:shift_time_id]

    if params[:save]
      @name = true

      if current_user.class == Member
        if current_user.role.name == 'GroupAdmin' || current_user.role.name == "GroupTimeManagement" || current_user.role.name == "GroupRecruiter"
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",id: joining_detail).where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).filter_by_date(@date)
          employee_id = @employees.pluck(:id)
          @employe_attendance = ShiftEmployee.where(shift_time_id: @shift_time_id,date: @date,employee_id: employee_id)
        elsif current_user.role.name == 'Admin'|| current_user.role.name == "AdminTimeManagement" || current_user.role.name == "AdminRecruiter"
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",company_id: current_user.company_location.company_id,id: joining_detail).where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).filter_by_date(@date)
          employee_id = @employees.pluck(:id)
          @employe_attendance = ShiftEmployee.where(shift_time_id: @shift_time_id,date: @date,employee_id: employee_id)
        elsif current_user.role.name == 'Branch' || current_user.role.name == 'TimeAndAttendance' || current_user.role.name == 'Recruitment'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",company_location_id: current_user.company_location_id,id: joining_detail).where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).filter_by_date(@date)
          employee_id = @employees.pluck(:id)
          @employe_attendance = ShiftEmployee.where(shift_time_id: @shift_time_id,date: @date,employee_id: employee_id)
        elsif current_user.role.name == 'Employee'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",id: current_user.employee_id,id: joining_detail).where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).filter_by_date(@date)
          employee_id = @employees.pluck(:id)
          @employe_attendance = ShiftEmployee.where(shift_time_id: @shift_time_id,date: @date,employee_id: employee_id)
        elsif
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",id: joining_detail).where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).filter_by_date(@date)
          employee_id = @employees.pluck(:id)
          @employe_attendance = ShiftEmployee.where(shift_time_id: @shift_time_id,date: @date,employee_id: employee_id)
        end
        @emp_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? AND present = ?", @date.strftime('%m/%Y'), "W")
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
        end#do
        @employee_attendance = EmployeeAttendance.new
      end #if current_user.class == Member 

      @emp = Employee.find(current_user.employee_id)
      sub_ord = @emp.subordinates
      @sub = sub_ord.where(status: "Active")
      ind_sub = @emp.indirect_subordinates
      @ind_sub = ind_sub.where(status: "Active")
      @employee = @sub + @ind_sub

      @emp_attendance = EmployeeAttendance.where(employee_id:  @employee,day: @date.to_date)
    elsif params[:report]
      @name = false
      employee = Employee.where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).pluck(:id)
      @all_employee_attendances = EmployeeAttendance.where(day: @date,employee_id: employee)
      respond_to do |f|
        f.js
        f.xls {render template: 'manager_self_services/team_attendance.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'team_attendance',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'manager_self_services/team_attendance.pdf.erb',
          show_as_html: params[:debug].present?
        end
      end
    elsif params[:outtime]
      @name = 1
      @emp = Employee.find(current_user.employee_id)
      sub_ord = @emp.subordinates
      @sub = sub_ord.where(status: "Active")
      ind_sub = @emp.indirect_subordinates
      @ind_sub = ind_sub.where(status: "Active")
      @employee = @sub + @ind_sub

      @all_employee_attendances = EmployeeAttendance.where.not(in_time: nil).where(shift_time_id: @shift_time_id,employee_id: @employee,day: @date)
    end#params[save]
  end

  def atten_report
    @date =  params[:salary][:day].to_date
      employee = Employee.where("manager_id = ? OR manager_2_id = ?", current_user.employee_id,current_user.employee_id).pluck(:id)
      @all_employee_attendances = EmployeeAttendance.where(day: @date,employee_id: employee)
     respond_to do |f|
        f.js
        f.xls {render template: 'manager_self_services/team_attendance.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'team_attendance',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'manager_self_services/team_attendance.pdf.erb',
          show_as_html: params[:debug].present?
        end
      end
  end

  def create_update_show_attendance
    @emp = Employee.find(current_user.employee_id)
    sub_ord = @emp.subordinates
    @sub = sub_ord.where(status: "Active")
    ind_sub = @emp.indirect_subordinates
    @ind_sub = ind_sub.where(status: "Active")
    @employee = @sub + @ind_sub

    date = Date.today
    @employee_attendances = EmployeeAttendance.where(employee_id:  @employee,day: date.to_date)
    session[:active_tab] ="TimeManagementHod"
  end

  def create_managerwise_attendance
    @employee_ids = params[:employee_ids]
    day = params[:employee_attendances][:day]
    present = params[:employee_attendances][:present]
    in_time = params[:employee_attendance][:in_time]
    out_time = params[:employee_attendance][:out_time]
    #byebug
    shift_time_id = params[:shift_time_id]
    #department = params[:employee_attendances][:department_id]
    @employee = Employee.where(id: @employee_ids)

    if in_time == "" && out_time == ""
      in_time = "08:30" 
      out_time = "17:30"
    elsif in_time == "" 
      in_time = "08:30"
    elsif out_time == ""
      out_time = "17:30"
    end
     total_hrs = out_time.to_time - in_time.to_time
     working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
    
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        @emp = Employee.find_by_id(eid)

      EmployeeAttendance.create(shift_time_id: shift_time_id,employee_id: eid,day: day,present: present,department_id: @emp.department_id, is_confirm: false,in_time: in_time,out_time: out_time,working_hrs: working_hrs,comment: "(Admin)Manually Created")  
      #Holiday.where(holiday_date: day).update_all(is_taken: true)
      flash[:notice] = "Created successfully"
      end
    end
    redirect_to create_update_show_attendance_manager_self_services_path
  end

  def detail_attendance_modal
    @employee_attendance = EmployeeAttendance.find(params[:employee_attendance]) 
  end

  def edit_current_attendance
    @employee_attendance = EmployeeAttendance.find(params[:employee_attendance])
  end

  def update_attendance
    employee_attendance_id = params[:employee_attendance_id]
    present = params[:employee_attendance][:present]
    in_time = params[:employee_attendance][:in_time]
    out_time = params[:employee_attendance][:out_time]
    employee_attendance = EmployeeAttendance.find_by(id: employee_attendance_id)

    total_hrs = out_time.to_time - in_time.to_time
    working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")

    employee_attendance.update(present: present,in_time: in_time,out_time: out_time,working_hrs: working_hrs,comment: "Updated By Manager")
    flash[:notice] = "Updated successfully"
    redirect_to create_update_show_attendance_manager_self_services_path
  end

  def update_out_time
    @employee_attendance_ids = params[:employee_attendance_ids]
    out_time = params[:employee_attendance][:out_time]

    if @employee_attendance_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_attendance_ids.each do |eid|
      @employee_attendance = EmployeeAttendance.find_by_id(eid)
      #out_time = Time.now
      #byebug
      total_hrs = out_time.to_time - @employee_attendance.in_time.to_time
      #working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
      working_hrs = Time.at(total_hrs).strftime("%H:%M")

      @employee_attendance.update(out_time: out_time,working_hrs: working_hrs) 
      flash[:notice] = "Updated successfully"
      end
    end
    redirect_to create_update_show_attendance_manager_self_services_path
  end

  def vacancy_request
  end

  def vacancy_request_create
    @employee_designation = params[:vacancy_master][:employee_designation_id]
    flash[:notice] = "Vacancy Request Created!"
    redirect_to vacancy_request_manager_self_services_path   
   end


end
