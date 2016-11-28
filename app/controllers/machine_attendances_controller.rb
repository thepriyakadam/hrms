class MachineAttendancesController < ApplicationController
  before_action :set_machine_attendance, only: [:show, :edit, :update, :destroy]

  def new
    @machine_attendance = MachineAttendance.new
    @machine_attendances = MachineAttendance.where(is_proceed: nil)
  end

#   def save_machine_attendance
#     # byebug
#     @emp_id = params[:machine_attendance][:employee_id]
#     @day = params[:machine_attendance][:day]
#     @in = params[:machine_attendance][:in]
#     @out = params[:machine_attendance][:out]
#     @shift_type = params[:machine_attendance][:shift_master_id]
#     s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: @in.to_time,out: @out.to_time,shift_master_id: @shift_type)
#     @company_time_masters = CompanyTimeMaster.where(is_active: true)
#     @company_time_masters.each do |s|
#     if s1.shift_master_id == s.shift_master_id
#       if @in.between?(s.in_min_time, s.in_max_time) && @out.between?(s.out_min_time, s.out_max_time) && s1.shift_master_id == s.shift_master_id
#         @c1=EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time,out_time: s.out_time,machine_attendances_id: s1.id,company_time_master_id: s.id)
#         time_diff=TimeDifference.between(@c1.in_time.to_time, @c1.out_time.to_time).in_hours
#         total_time_diff = time_diff - s.working_hrs.to_f
#         EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
#         puts "------------------------------------"

#       elsif @in.between?(s.in_min_time, s.in_max_time)  && s1.shift_master_id == s.shift_master_id
#           @c1=EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: s.in_time,out_time: @out.to_time,machine_attendances_id: s1.id,company_time_master_id: s.id)
#           time_diff=TimeDifference.between(@c1.in_time.to_time, @c1.out_time.to_time).in_hours
#           total_time_diff = time_diff - s.working_hrs.to_f
#           EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
#           puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"

#       elsif @out.between?(s.out_min_time, s.out_max_time) && s1.shift_master_id == s.shift_master_id
#           @c1=EmployeeAttendance.create(employee_id: @emp_id,day: @day.to_date,in_time: @in.to_time,out_time: s.out_time,machine_attendances_id: s1.id,company_time_master_id: s.id)
#           time_diff=TimeDifference.between(@c1.in_time.to_time, @c1.out_time.to_time).in_hours
#           total_time_diff = time_diff - s.working_hrs.to_f
#           EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
#           puts "cccccccccccccccccccccccccccccccccccccc"

#       else
#           @c2=EmployeeAttendance.create(employee_id: @emp_id,day: @day,in_time: @in.to_time,out_time: @out.to_time,machine_attendances_id: s1.id,company_time_master_id: s.id)
#           time_diff=TimeDifference.between(@c2.in_time.to_time, @c2.out_time.to_time).in_hours
#           total_time_diff = time_diff - s.working_hrs.to_f
#           EmployeeAttendance.where(id: @c2.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff)
#           puts "/////////////////////////////////////" 
#           flash[:notice] = "Machine Attendance Created Successfully"
#           redirect_to new_machine_attendance_path   
#        end
#           flash[:notice] = "Machine Attendance Created Successfully"
#           redirect_to new_machine_attendance_path
#     end
#   end
# end

  def save_machine_attendance
     @machine_attendance = MachineAttendance.new(machine_attendance_params)
     @machine_attendances = MachineAttendance.all
      if @machine_attendance.save
        @machine_attendance = MachineAttendance.new
      end
      redirect_to new_machine_attendance_path
      flash[:notice] = 'Machine Attendance saved Successfully.'
  end   

  def save_machine_attendance_checkbox
    @machine_attendance_ids = params[:machine_attendance_ids]
    ma_id = @machine_attendance_ids.map {|i| i.to_i}
    if @machine_attendance_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to new_machine_attendance_path
      else
          @employee = MachineAttendance.where(id: ma_id)
          @company_time_masters = CompanyTimeMaster.where(is_active: true)
            @employee.each do |e|
              @company_time_masters.each do |s|
                # byebug
                if e.shift_master_id == s.shift_master_id
                    if e.in.strftime('%H:%M:%S').between?(s.in_min_time.strftime('%H:%M:%S'), s.in_max_time.strftime('%H:%M:%S')) && e.out.strftime('%H:%M:%S').between?(s.out_min_time.strftime('%H:%M:%S'), s.out_max_time.strftime('%H:%M:%S'))
                      @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: s.in_time,out_time: s.out_time,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present)
                      MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                      time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.round
                      total_time_diff = time_diff - s.working_hrs.to_f
                      EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff,total_hrs: time_diff)
                      puts "------------------------------------"

                    elsif e.in.strftime('%H:%M:%S').between?(s.in_min_time.strftime('%H:%M:%S'), s.in_max_time.strftime('%H:%M:%S')) 
                        @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: s.in_time,out_time: e.out,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present)
                        MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                        time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.round
                        total_time_diff = time_diff - s.working_hrs.to_f
                        EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff,total_hrs: time_diff)
                        puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"

                    elsif e.out.strftime('%H:%M:%S').between?(s.out_min_time.strftime('%H:%M:%S'), s.out_max_time.strftime('%H:%M:%S'))
                        @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: s.out_time,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present)
                        MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                        time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.round
                        total_time_diff = time_diff - s.working_hrs.to_f
                        EmployeeAttendance.where(id: @c1.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff,total_hrs: time_diff)
                        puts "cccccccccccccccccccccccccccccccccccccc"

                    else
                        @c2=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present)
                        MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                        time_diff=TimeDifference.between(@c2.in_time.strftime('%H:%M:%S'), @c2.out_time.strftime('%H:%M:%S')).in_hours.round
                        total_time_diff = time_diff - s.working_hrs.to_f
                        EmployeeAttendance.where(id: @c2.id).update_all(company_hrs: s.working_hrs,overtime_hrs: total_time_diff,total_hrs: time_diff)
                        puts "/////////////////////////////////////"    
                    end
                end
            end
      end  
    end
          flash[:notice] = "Machine Attendance Created Successfully"
          redirect_to new_machine_attendance_path    
  end

  def import_machine_attendance
    @machine_attendances = MachineAttendance.all
    respond_to do |format|
    format.html
    format.csv { send_data @machine_attendances.to_csv }
    format.xls
   end
  end

  def import
    # byebug
    MachineAttendance.import(params[:file])
    redirect_to import_machine_attendance_machine_attendances_path, notice: "File imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_attendance
      @machine_attendance = MachineAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_attendance_params
      params.require(:machine_attendance).permit(:employee_id, :day, :in, :out)
    end
end
