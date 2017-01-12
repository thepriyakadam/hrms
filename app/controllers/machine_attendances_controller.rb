class MachineAttendancesController < ApplicationController
  before_action :set_machine_attendance, only: [:show, :edit, :update, :destroy]

  def new
    @machine_attendance = MachineAttendance.new
    @machine_attendances = MachineAttendance.where(is_proceed: nil)
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="AttendanceSetup"
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
    # byebug
    @emp_id = params[:machine_attendance][:employee_id]
    @day = params[:machine_attendance][:day]
    @in = params[:machine_attendance][:in]
    @out = params[:machine_attendance][:out]
    @shift_type = params[:machine_attendance][:shift_master_id]
    @present = params[:machine_attendance][:present]
    # byebug
    s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: @in.to_datetime.utc,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: @present)
    flash[:notice] = "Machine Attendance Created Successfully"
    redirect_to new_machine_attendance_path
end
  
  def modal
    @machine_attendance = MachineAttendance.find(params[:format])
  end

  def edit_machine_attendance
    # byebug
    @machine_attendance = MachineAttendance.find(params[:id])
    # byebug
    # @emp_id = params[:machine_attendance][:employee_id]
    @day = params[:machine_attendance][:day]
    # byebug
    @in = params[:machine_attendance][:in]
    @out = params[:machine_attendance][:out]
    @shift_type = params[:machine_attendance][:shift_master_id]
    MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day,in: @in.to_datetime.utc,out: @out.to_datetime.utc,shift_master_id: @shift_type,user_id: current_user.employee_id,is_updated: true)
    flash[:notice] = "Machine Attendance Updated Successfully"
    redirect_to new_machine_attendance_path
  end


  def save_machine_attendance_checkbox
    @machine_attendance_ids = params[:machine_attendance_ids]
    if @machine_attendance_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to new_machine_attendance_path
      else
          ma_id = @machine_attendance_ids.map {|i| i.to_i}
          @employee = MachineAttendance.where(id: ma_id)
          @company_time_masters = CompanyTimeMaster.where(is_active: true)
          @late_mark_masters = LateMarkMaster.where(is_active: true)
            @employee.each do |e|
              @company_time_masters.each do |s|
                # @late_mark_masters.each do |lmm|
                # byebug
                  if e.shift_master_id == s.shift_master_id
                    # byebug
                      if e.in.strftime('%H:%M:%S').between?(s.in_min_time.strftime('%H:%M:%S'), s.in_max_time.strftime('%H:%M:%S')) && e.out.strftime('%H:%M:%S').between?(s.out_min_time.strftime('%H:%M:%S'), s.out_max_time.strftime('%H:%M:%S'))
                        month_name = e.day.strftime("%B")
                        @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: s.in_time,out_time: s.out_time,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present,month_name: month_name)
                        MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                        time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.round
                        total_time_diff = time_diff - s.working_hrs.to_f
                        EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff)
                        if total_time_diff<0
                          EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff.abs)
                        else
                          EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff)
                        end
                        puts "------------------------------------"

                      elsif e.in.strftime('%H:%M:%S').between?(s.in_min_time.strftime('%H:%M:%S'), s.in_max_time.strftime('%H:%M:%S'))
                          # byebug
                          month_name = e.day.strftime("%B")
                          @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: s.in_time,out_time: e.out,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present,month_name: month_name)
                          MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                          time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.round
                          total_time_diff = time_diff - s.working_hrs.to_f
                          late_diff =TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_minutes.abs.round
                          #late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
                          #calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
                          @late_mark_masters.each do |lmm|
                          if late_diff.between?(lmm.from.to_i, lmm.to.to_i)
                            # byebug
                            late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
                            EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
                          # EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff)
                          end
                        end
                          # if calculated_working_hrs<0
                          #   EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: calculated_working_hrs.abs)
                          # else
                          #   EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: calculated_working_hrs)
                          # end
                          puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
# byebug
                      elsif e.out.strftime('%H:%M:%S').between?(s.out_min_time.strftime('%H:%M:%S'), s.out_max_time.strftime('%H:%M:%S'))
                          # byebug
                          month_name = e.day.strftime("%B")
                          @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: s.out_time,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present,month_name: month_name)
                          MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                          time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
                          total_time_diff = time_diff - s.working_hrs.to_f
                          # byebug
                          late_diff =TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
                          # late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
                          # byebug
                          # calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
                          late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
                          calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
                          # byebug
                          @late_mark_masters.each do |lmm|
                          if late_diff.between?(lmm.from.to_i, lmm.to.to_i)
                            # byebug
                            # lm=LateMarkMaster.where(id: lmm).take

                            # late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
                            # calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f

                            late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
                            EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
                          # EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff)
                          end
                        end
                          # byebug
                          # if calculated_working_hrs<0
                          #   EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: calculated_working_hrs.abs)
                          # else
                          #   EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: calculated_working_hrs)
                          # end
                        # end
                          puts "cccccccccccccccccccccccccccccccccccccc"
                          # byebug
                      else
                          # byebug
                          month_name = e.day.strftime("%B")
                          @c2=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present,month_name: month_name)
                          MachineAttendance.where(id: e.id).update_all(is_proceed: true)
                          time_diff=TimeDifference.between(@c2.in_time.strftime('%H:%M:%S'), @c2.out_time.strftime('%H:%M:%S')).in_hours.to_f
                          total_time_diff = time_diff - s.working_hrs.to_f
                          in_late_diff =TimeDifference.between(@c2.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
                          out_late_diff =TimeDifference.between(@c2.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
                          total_in_out_late_diff = in_late_diff + out_late_diff
                          # byebug
                          @late_mark_masters.each do |lmm|
                          if total_in_out_late_diff.between?(lmm.from.to_i, lmm.to.to_i)
                            # byebug
                            # lm=LateMarkMaster.where(id: lmm).take

                            # late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
                            # calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f

                            late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
                            EmployeeAttendance.where(id: @c2.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
                          # EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff)
                          end
                        end
                          # if total_time_diff<0
                          #   EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff.abs)
                          # else
                          #   EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff)
                          # end
                          puts "/////////////////////////////////////"    
                      end
                  end
                end
            # end
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
    MachineAttendance.import(params[:file])
    redirect_to import_machine_attendance_machine_attendances_path, notice: "File imported."
  end

  def machine_attendance_xls
    @machine_attendances = MachineAttendance.all
    # @machine_attendances = MachineAttendance.where(is_proceed: nil)
    respond_to do |format|
      format.xls {render template: 'machine_attendances/machine_attendances.xls.erb'}
    end
  end

  def machine_attendance_pdf
    @machine_attendances = MachineAttendance.all
     # @machine_attendances = MachineAttendance.where(is_proceed: nil)
     respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'machine_attendances',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'machine_attendances/machine_attendances.pdf.erb',
              show_as_html: params[:debug].present?
            end
         end
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
