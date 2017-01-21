def save_machine_attendance_checkbox
	 @machine_attendance_ids = params[:machine_attendance_ids]
	 if @machine_attendance_ids.nil?
		  flash[:alert] = "Please Select the Checkbox"
		  redirect_to new_machine_attendance_path
		else
			 ma_id = @machine_attendance_ids.map {|i| i.to_i}
			 @employee = MachineAttendance.where(id: ma_id)
			 @company_time_masters = CompanyTimeMaster.where(is_active: true,time_adjust: false)
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
								time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
								total_time_diff = time_diff - s.working_hrs.to_f
								EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)
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
								  time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
								  # byebug
								  if @c1.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S') && @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S')
								 # if @c1.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
									out_time_diff =  TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									 if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)
									# byebug
									# elsif @c1.out_time.strftime('%H:%M:%S') < s.out_time.strftime('%H:%M:%S') || @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S')
									# out_time_diff =  TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									# total_time_diff_1 = time_diff - s.working_hrs.to_f
									#  if total_time_diff_1<0
									#    #byebug
									#    EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									#  else
									#    EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									#  end
									# EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff) 
								 
								  # byebug
								  elsif @c1.in_time.strftime('%H:%M:%S') == s.in_time.strftime('%H:%M:%S') && @c1.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
									out_time_diff =  TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									 if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)                            
								  else
									 # byebug
								  time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
								  total_time_diff = time_diff - s.working_hrs.to_f
								  late_diff =TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
								  @late_mark_masters.each do |lmm|
								  if late_diff.between?(lmm.from.to_i, lmm.to.to_i)
									 # byebug
									 late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
									 EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
									 late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
									 calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
									 if calculated_working_hrs<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: calculated_working_hrs.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: calculated_working_hrs)
									 end
								  end
								end
							 end
								  puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
# byebug
							 elsif e.out.strftime('%H:%M:%S').between?(s.out_min_time.strftime('%H:%M:%S'), s.out_max_time.strftime('%H:%M:%S'))
								  # byebug
								  month_name = e.day.strftime("%B")
								  @c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: s.out_time,machine_attendances_id: e.id,company_time_master_id: s.id,present: e.present,month_name: month_name)
								  MachineAttendance.where(id: e.id).update_all(is_proceed: true)
								  time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
								  # byebug
								  if @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S') && @c1.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
								  # byebug
								  # if @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S')
									out_time_diff =  TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									 if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)
									# elsif @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S') || @c1.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
									# out_time_diff =  TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									# total_time_diff_1 = time_diff - s.working_hrs.to_f
									#  if total_time_diff_1<0
									#    #byebug
									#    EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									#  else
									#    EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									#  end
									# EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)
									# byebug
									elsif @c1.out_time.strftime('%H:%M:%S') == s.out_time.strftime('%H:%M:%S') && @c1.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S')
									out_time_diff =  TimeDifference.between(@c1.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									 if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff,rest_time: time_diff)                                   
								  else
								  # byebug
								  time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
								  total_time_diff = time_diff - s.working_hrs.to_f
								  # byebug
								  late_diff =TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
								  # byebug
								  @late_mark_masters.each do |lmm|
								  if late_diff.between?(lmm.from.to_i, lmm.to.to_i)
									 # byebug
									 late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
									 EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
									 late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
									 calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
									 if calculated_working_hrs<0
										#byebug
										EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: calculated_working_hrs.abs)
									 else
										EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: calculated_working_hrs)
									 end
								  end
								end
							 end
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
								  if @c2.in_time.strftime('%H:%M:%S') > s.in_time.strftime('%H:%M:%S') && @c2.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
									 # byebug
									in_time_diff =  TimeDifference.between(@c2.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_hours.to_f
									out_time_diff =  TimeDifference.between(@c2.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c2.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c2.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c2.id).update_all(working_hrs: time_diff,rest_time: time_diff)
								  elsif @c2.in_time.strftime('%H:%M:%S') < s.in_time.strftime('%H:%M:%S') || @c2.out_time.strftime('%H:%M:%S') > s.out_time.strftime('%H:%M:%S')
									 # byebug
									in_time_diff =  TimeDifference.between(@c2.in_time.strftime('%H:%M:%S'), s.in_time.strftime('%H:%M:%S')).in_hours.to_f
									out_time_diff =  TimeDifference.between(@c2.out_time.strftime('%H:%M:%S'), s.out_time.strftime('%H:%M:%S')).in_hours.to_f
									total_time_diff_1 = time_diff - s.working_hrs.to_f
									if total_time_diff_1<0
										#byebug
										EmployeeAttendance.where(id: @c2.id).update_all(difference_hrs: total_time_diff_1.abs)
									 else
										EmployeeAttendance.where(id: @c2.id).update_all(overtime_hrs: total_time_diff_1)
									 end
									EmployeeAttendance.where(id: @c2.id).update_all(working_hrs: time_diff,rest_time: time_diff)
								  else
								  @late_mark_masters.each do |lmm|
								  if total_in_out_late_diff.between?(lmm.from.to_i, lmm.to.to_i)
									 late_working_hrs = time_diff.abs - lmm.late_mark.to_i.abs
									 EmployeeAttendance.where(id: @c2.id).update_all(working_hrs: late_working_hrs,rest_time: time_diff)
									 late_working_hrs_1 = time_diff.abs - lmm.late_mark.to_i.abs
									 calculated_working_hrs = late_working_hrs_1 - s.working_hrs.to_f
									 if calculated_working_hrs<0
										EmployeeAttendance.where(id: @c2.id).update_all(difference_hrs: calculated_working_hrs.abs)
									 else
										EmployeeAttendance.where(id: @c2.id).update_all(overtime_hrs: calculated_working_hrs)
									 end
								  end
								end
								end
								# byebug
								  puts "/////////////////////////////////////"

							 end
						end
					 end
				# end
		end
  end  
			 flash[:notice] = "Machine Attendance Created Successfully"
			 redirect_to root_url
  end