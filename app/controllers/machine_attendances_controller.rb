class MachineAttendancesController < ApplicationController

  def new
  	@machine_attendance = MachineAttendance.new
    @machine_attendances = MachineAttendance.all
  end

  def save_machine_attendance
  	# byebug
  	@emp_id = params[:machine_attendance][:employee_id]
  	@day = params[:machine_attendance][:day]
  	@in = params[:machine_attendance][:in]
  	@out = params[:machine_attendance][:out]
    MachineAttendance.create(employee_id: @emp_id,day: @day,in: @in.to_time,out: @out.to_time)
  	@company_time_masters = CompanyTimeMaster.where(is_active: true)
  	@company_time_masters.each do |s|
  	if @in.to_time.between?(s.in_min_time.to_time, s.in_max_time.to_time) && @out.to_time.between?(s.out_min_time.to_time, s.out_max_time.to_time)
  	 	# EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time.strftime("%H:%M %p"),out_time: s.out_time.strftime("%H:%M %p").to_i,machine_attendances_id: s.id)
  	 	@c1=EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time,out_time: s.out_time,machine_attendances_id: s.id)
      # diff = @c1.out_time.to_time - @c1.in_time.
      time_diff=TimeDifference.between(@c1.in_time.to_time, @c1.out_time.to_time).in_hours
      total_time_diff = time_diff - s.working_hrs
      EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
  	 	puts "------------------------------------"
  	 	flash[:notice] = "Machine Attendance Created Successfully"
      redirect_to new_machine_attendance_path
  	 else
  	    #EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_min_time.strftime("%H:%M %p"),out_time: s.out_min_time.strftime("%H:%M %p").to_i,machine_attendances_id: s.id)
  	    @c2=EmployeeAttendance.create(employee_id: @emp_id,day: @day,in_time: @in.to_time,out_time: @out.to_time,machine_attendances_id: s.id)
        # diff = @c2.out_time.to_time - @c2.in_time.to_time
        time_diff=TimeDifference.between(@c2.in_time.to_time, @c2.out_time.to_time).in_hours
        total_time_diff = time_diff - s.working_hrs
        EmployeeAttendance.where(id: @c2.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
  	    puts "/////////////////////////////////////"   	
     end
        flash[:notice] = "Machine Attendance Created Successfully"
        redirect_to new_machine_attendance_path
    end
  end

  # def is_confirm
  #   @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  #   @selected_resume_ids = params[:selected_resume_ids]
  #   if @selected_resume_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #     redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
  #   else
  #     @selected_resume_ids.each do |eid|
  #     @selected_resume = SelectedResume.find(eid)
  #     @selected_resume.update(status: "Shortlisted") 
  #     flash[:notice] = "Confirmed Successfully"
  #   end 
  #    redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
  #  end
  # end

  def save_machine_attendance_checkbox
    @machine_attendance_ids = params[:machine_attendance_ids]
    ma_id = @machine_attendance_ids.map {|i| i.to_i}
    if @machine_attendance_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_machine_attendance_path
    else
      @machine_attendance_ids.each do |mid|
      @machine_attendance = MachineAttendance.find(mid)
      @e1 = MachineAttendance.where(id: ma_id)
      @company_time_masters = CompanyTimeMaster.where(is_active: true)
      @e1.each do |e|
      @company_time_masters.each do |s|
        # byebug
      if e.in.to_time.between?(s.in_min_time.to_time, s.in_max_time.to_time) && e.out.to_time.between?(s.out_min_time.to_time, s.out_max_time.to_time)
        @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: s.in_time.to_time,out_time: s.out_time.to_time,machine_attendances_id: s.id)
        time_diff=TimeDifference.between(@c1.in_time.to_time, @c1.out_time.to_time).in_hours
        total_time_diff = time_diff - s.working_hrs
        EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
        puts "------------------------------------"
        flash[:notice] = "Machine Attendance Created Successfully"
        redirect_to new_machine_attendance_path
      else
        @c2=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in.to_time,out_time: e.out.to_time,machine_attendances_id: s.id)
        time_diff=TimeDifference.between(@c2.in_time.to_time, @c2.out_time.to_time).in_hours
        total_time_diff = time_diff - s.working_hrs
        EmployeeAttendance.where(id: @c2.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
        puts "/////////////////////////////////////"    
       end
        flash[:notice] = "Machine Attendance Created Successfully"
        redirect_to new_machine_attendance_path
        end
      end 
       redirect_to new_machine_attendance_path
     end
    end
  end

end