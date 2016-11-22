class MachineAttendancesController < ApplicationController

  def new
  	@machine_attendance = MachineAttendance.new
  end

  def save_machine_attendance
  	# byebug
  	@emp_id = params[:machine_attendance][:employee_id]
  	@day = params[:machine_attendance][:day]
  	@in = params[:machine_attendance][:in]
  	@out = params[:machine_attendance][:out]
  	@company_time_masters = CompanyTimeMaster.where(is_active: true)
  	@company_time_masters.each do |s|
  	if @in.to_time.between?(s.in_min_time.to_time, s.in_max_time.to_time) && @out.to_time.between?(s.out_min_time.to_time, s.out_max_time.to_time)
  	 	# EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time.strftime("%H:%M %p"),out_time: s.out_time.strftime("%H:%M %p").to_i,machine_attendances_id: s.id)
  	 	@c1=EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time,out_time: s.out_time,machine_attendances_id: s.id)
      diff = @c1.out_time.to_time - @c1.in_time.to_time
      EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: diff)
  	 	puts "------------------------------------"
  	 	flash[:notice] = "Machine Attendance Created Successfully"
      redirect_to new_machine_attendance_path
  	 else
  	    #EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_min_time.strftime("%H:%M %p"),out_time: s.out_min_time.strftime("%H:%M %p").to_i,machine_attendances_id: s.id)
  	    @c2=EmployeeAttendance.create(employee_id: @emp_id,day: @day,in_time: @in.to_time,out_time: @out.to_time,machine_attendances_id: s.id)
        diff = @c2.out_time.to_time - @c2.in_time.to_time
        EmployeeAttendance.where(id: @c2.id).update_all(company_hrs: diff)
  	    puts "/////////////////////////////////////"   	
     end
        flash[:notice] = "Machine Attendance Created Successfully"
        redirect_to new_machine_attendance_path
    end
  end
end