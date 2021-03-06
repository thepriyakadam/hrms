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
			@emp_id = params[:machine_attendance][:employee_id]
			@day = params[:machine_attendance][:day]
			@in = params[:machine_attendance][:in]
			@out = params[:machine_attendance][:out]
			@shift_type = params[:machine_attendance][:shift_master_id]
			@present = params[:machine_attendance][:present]
			# byebug
			if @in == "" && @out == "" && @present == ""
				# byebug
				s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: nil,out: nil,shift_master_id: @shift_type,present: nil)
			elsif @in == "" && @present == ""
				# byebug
				s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: nil,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: nil)
			elsif @out == "" && @present == ""
				s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: @in.to_datetime.utc,out: nil,shift_master_id: @shift_type,present: nil)
			else
				# byebug
				s1=MachineAttendance.create(employee_id: @emp_id,day: @day,in: @in.to_datetime.utc,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: @present)
			end
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
		@present = params[:machine_attendance][:present]
		# MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day,in: @in.to_datetime.utc,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: @present,user_id: current_user.employee_id,is_updated: true)
		if @in == "" && @out == "" && @present == ""
				MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day.to_date,in: nil,out: nil,shift_master_id: @shift_type,present: nil,user_id: current_user.employee_id,is_updated: true)
		elsif @in == "" && @out == ""
				MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day.to_date,in: nil,out: nil,shift_master_id: @shift_type,present: @present,user_id: current_user.employee_id,is_updated: true)
		elsif @in == "" || @present == ""
			# byebug
			MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day.to_date,in: nil,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: nil,user_id: current_user.employee_id,is_updated: true)
		elsif @out == "" || @present == ""
			MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day.to_date,in: @in.to_datetime.utc,out: nil,shift_master_id: @shift_type,present: nil,user_id: current_user.employee_id,is_updated: true)
		else
			# byebug
			MachineAttendance.where(id: @machine_attendance.id).update_all(employee_id: @machine_attendance.employee_id,day: @day.to_date,in: @in.to_datetime.utc,out: @out.to_datetime.utc,shift_master_id: @shift_type,present: @present,user_id: current_user.employee_id,is_updated: true)
		end
		flash[:notice] = "Machine Attendance Updated Successfully"
		redirect_to new_machine_attendance_path
	end

	def search_by_date
		reporter(EmployeeAttendance, template_class: PdfReportTemplate) do
			filter :day, type: :date
			# filter :current_status, type: :string
			#column(:Request_ID, sortable: true) { |employee_leav_request| employee_leav_request.id }
			column(:ID, sortable: true) { |employee_attendance| employee_attendance.employee.try(:manual_employee_code) }
			column(:Employee_Name, sortable: true) { |employee_attendance| full_name(employee_attendance.employee) }
			column(:Day, sortable: true) { |employee_attendance| employee_attendance.day }
			column(:Month, sortable: true) { |employee_attendance| employee_attendance.month_name }
			column(:InTime, sortable: true) { |employee_attendance| employee_attendance.in_time }
			column(:OutTime, sortable: true) { |employee_attendance| employee_attendance.out_time}
			column(:WorkingHrs, sortable: true) { |employee_attendance| employee_attendance.working_hrs }
			column(:DifferenceHrs, sortable: true) { |employee_attendance| employee_attendance.difference_hrs }
			column(:OvertimeHrs, sortable: true) { |employee_attendance| employee_attendance.overtime_hrs }
			column(:LateMark, sortable: true) { |employee_attendance| employee_attendance.late_mark }
		end
		session[:active_tab] ="LeaveManagement"
		session[:active_tab1] ="LeaveReports"
	end


	def save_machine_attendance_checkbox
		@machine_attendance_ids = params[:machine_attendance_ids]
		if @machine_attendance_ids.nil?
				flash[:alert] = "Please Select the Checkbox"
				redirect_to new_machine_attendance_path
			else
					ma_id = @machine_attendance_ids.map {|i| i.to_i}
					@employee = MachineAttendance.where(id: ma_id)
					@employee_1 = MachineAttendance.where(id: ma_id).pluck(:employee_id)
					@joining_details = JoiningDetail.where(employee_id: @employee_1)
					@company_time_masters = CompanyTimeMaster.where(is_active: true)
					# @late_mark_masters = LateMarkMaster.where(is_active: true)
						@employee.each do |e|
							@company_time_masters.each do |ctm|
								@joining_details.each do |jd|
									if jd.time_master == true
										# byebug
										if e.present == "P"

											if e.shift_master_id == ctm.shift_master_id
												# byebug
												if e.in.strftime('%H:%M:%S').between?(ctm.in_min_time.strftime('%H:%M:%S'), ctm.in_max_time.strftime('%H:%M:%S')) && e.out.strftime('%H:%M:%S').between?(ctm.out_min_time.strftime('%H:%M:%S'), ctm.out_max_time.strftime('%H:%M:%S'))
													# byebug
														month_name = e.day.strftime("%B")
														# byebug
														@c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: ctm.in_time,out_time: ctm.out_time,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
														MachineAttendance.where(id: e.id).update_all(is_proceed: true)
														# time_diff=TimeDifference.between(@c1.in_time.strftime('%H:%M:%S'), @c1.out_time.strftime('%H:%M:%S')).in_hours.to_f
														time_diff=Time.at((@c1.out_time-@c1.in_time).round).utc.strftime "%H:%M"
														# byebug
														total_time_diff = (time_diff.to_time - ctm.working_hrs.to_time) / 1.hours
														EmployeeAttendance.where(id: @c1.id).update_all(working_hrs: time_diff)
														if total_time_diff<0
															EmployeeAttendance.where(id: @c1.id).update_all(difference_hrs: total_time_diff.abs)
														else
															# byebug
															EmployeeAttendance.where(id: @c1.id).update_all(overtime_hrs: total_time_diff.to_f.round(2))
														end
														puts "IN Time & OUT Time"
												
												
												elsif e.in.strftime('%H:%M:%S').between?(ctm.in_min_time.strftime('%H:%M:%S'), ctm.in_max_time.strftime('%H:%M:%S'))
													# byebug
														month_name = e.day.strftime("%B")
														@c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: ctm.in_time,out_time: nil,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
														MachineAttendance.where(id: e.id).update_all(is_proceed: true)
														if jd.time_adjusted == true
															# byebug
															if e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																# byebug
															 EmployeeAttendance.where(id: @c1.id).update_all(out_time: e.out)
															 @employee_attend = EmployeeAttendance.where(id: @c1.id)
															 @employee_attend.each do |ea|
																late_diff_in_min =TimeDifference.between(ea.out_time.strftime('%H:%M:%S') , ctm.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																EmployeeAttendance.where(id: ea).update_all(late_mark: late_diff_in_min)
															end
															 # byebug
															else
																if jd.ot_option == true
																EmployeeAttendance.where(id: @c1.id).update_all(out_time: e.out)
																else
																	# byebug
																EmployeeAttendance.where(id: @c1.id).update_all(out_time: ctm.out_time)
																end
															end
														else
																EmployeeAttendance.where(id: @c1.id).update_all(out_time: e.out)
														end
														puts "Innnnnnnnnnnnnnnnnnnnn Timeeeeeeeeeeeee"
												
												
												elsif e.out.strftime('%H:%M:%S').between?(ctm.out_min_time.strftime('%H:%M:%S'), ctm.out_max_time.strftime('%H:%M:%S'))
														month_name = e.day.strftime("%B")
														@c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: nil,out_time: ctm.out_time,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
														MachineAttendance.where(id: e.id).update_all(is_proceed: true)
														if jd.time_adjusted == true
															if e.in.strftime('%H:%M:%S') < ctm.in_time.strftime('%H:%M:%S')
															 EmployeeAttendance.where(id: @c1.id).update_all(in_time: e.in)
															else
																if jd.ot_option == true
																EmployeeAttendance.where(id: @c1.id).update_all(in_time: e.in)
																else
																 EmployeeAttendance.where(id: @c1.id).update_all(in_time: ctm.in_time)
																end
															end
														else
															 EmployeeAttendance.where(id: @c1.id).update_all(in_time: e.in)
															 @employee_attend = EmployeeAttendance.where(id: @c1.id)
															 @employee_attend.each do |ea|
																late_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																EmployeeAttendance.where(id: ea).update_all(late_mark: late_diff_in_min)
															 end
														end
														puts "Out Time"
							
												else

													if jd.time_adjusted == true

															month_name = e.day.strftime("%B")
															@c2=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
															MachineAttendance.where(id: e.id).update_all(is_proceed: true)
															# byebug

															if e.in.strftime('%H:%M:%S') < ctm.in_time.strftime('%H:%M:%S') && e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																	  
																	  if jd.ot_option == true
																	  	EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in,out_time: e.out)
																	  	@employee_attend = EmployeeAttendance.where(id: @c2.id)
																		  @employee_attend.each do |ea|
																			in_late_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																			out_late_diff_in_min =TimeDifference.between(ea.out_time.strftime('%H:%M:%S') , ctm.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																			total_in_out_diff_in_min = in_late_diff_in_min - out_late_diff_in_min
																			if total_in_out_diff_in_min < 0
																			  EmployeeAttendance.where(id: ea).update_all(late_mark: total_in_out_diff_in_min.abs)
																		  else
																		  end
																	   	end
																	   	
																		else

																		end

																	# end
															# end

														  elsif e.in.strftime('%H:%M:%S') > ctm.in_time.strftime('%H:%M:%S') && e.out.strftime('%H:%M:%S') > ctm.out_time.strftime('%H:%M:%S')

														  	if jd.ot_option == true
														  		EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in,out_time: e.out)
														  		@employee_attend = EmployeeAttendance.where(id: @c2.id)
														  		@employee_attend.each do |ea|
                                  in_late_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																	out_late_diff_in_min =TimeDifference.between(ea.out_time.strftime('%H:%M:%S') , ctm.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
                                  total_in_out_diff_in_min = in_late_diff_in_min - out_late_diff_in_min
																	if total_in_out_diff_in_min < 0
																	EmployeeAttendance.where(id: ea).update_all(late_mark: total_in_out_diff_in_min.abs)
																  else
																  end
														  		end

														  	else

														  	end



															elsif @c2.late_mark.nil? && e.in.strftime('%H:%M:%S') < ctm.in_time.strftime('%H:%M:%S') || e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																	if e.in.strftime('%H:%M:%S') < ctm.in_time.strftime('%H:%M:%S')
																		if jd.ot_option == true
																			 EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in)
																			# 	 @employee_attend.each do |ea|
																			# 	 early_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																			# 	 EmployeeAttendance.where(id: ea).update_all(late_mark: early_diff_in_min)
																			# end
																		else
																			 EmployeeAttendance.where(id: @c2.id).update_all(in_time: ctm.in_time)
																		end
																	else
																		 EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in)
																		 @employee_attend = EmployeeAttendance.where(id: @c2.id)
																		 @employee_attend.each do |ea|
																			late_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																			EmployeeAttendance.where(id: ea).update_all(late_mark: late_diff_in_min)
																		end
																	end
																	# byebug
																	if e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																			 EmployeeAttendance.where(id: @c2.id).update_all(out_time: e.out)
																			 @employee_attend = EmployeeAttendance.where(id: @c2.id)
																			@employee_attend.each do |ea|
																				late_diff_in_min =TimeDifference.between(ea.out_time.strftime('%H:%M:%S') , ctm.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																				# byebug
																				#f=EmployeeAttendance.where(id: @c2.id).pluck(:late_mark)
																				if ea.late_mark.nil?
																					# byebug
																					total_late_in_min = 0 + late_diff_in_min
																					EmployeeAttendance.where(id: ea).update_all(late_mark: total_late_in_min)
																				else
																					total_late_in_min = ea.late_mark.to_i + late_diff_in_min
																					# byebug
																					EmployeeAttendance.where(id: ea).update_all(late_mark: total_late_in_min)
																				end
																			end
																	else
																				if jd.ot_option == true
																				 EmployeeAttendance.where(id: @c2.id).update_all(out_time: e.out)
																				 else
																				 EmployeeAttendance.where(id: @c2.id).update_all(out_time: ctm.out_time)
																				end   
																	end
															end
															puts "Time Adjusted True"
													
													else
															month_name = e.day.strftime("%B")
															@c2=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
															MachineAttendance.where(id: e.id).update_all(is_proceed: true)
															if e.in.strftime('%H:%M:%S') > ctm.in_time.strftime('%H:%M:%S') || e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																# byebug
																	if e.in.strftime('%H:%M:%S') > ctm.in_time.strftime('%H:%M:%S')
																		EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in)
																		@employee_attend = EmployeeAttendance.where(id: @c2.id)
																		 @employee_attend.each do |ea|
																			late_diff_in_min =TimeDifference.between(ea.in_time.strftime('%H:%M:%S') , ctm.in_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																			EmployeeAttendance.where(id: ea).update_all(late_mark: late_diff_in_min)
																		 end
																	else
																		if jd.ot_option == true
																			EmployeeAttendance.where(id: @c2.id).update_all(in_time: e.in)
																		else
																			EmployeeAttendance.where(id: @c2.id).update_all(in_time: ctm.in_time)
																		end
																	end

																	if e.out.strftime('%H:%M:%S') < ctm.out_time.strftime('%H:%M:%S')
																		EmployeeAttendance.where(id: @c2.id).update_all(out_time: e.out)
																		@employee_attend = EmployeeAttendance.where(id: @c2.id)
																			 @employee_attend.each do |ea|
																				late_diff_in_min =TimeDifference.between(ea.out_time.strftime('%H:%M:%S') , ctm.out_time.strftime('%H:%M:%S')).in_minutes.abs.to_f
																				# f=EmployeeAttendance.where(id: @c2.id).pluck(:late_mark)
																				if ea.late_mark.nil?
																				# byebug
																				total_late_in_min = 0 + late_diff_in_min
																				EmployeeAttendance.where(id: ea).update_all(late_mark: total_late_in_min)
																				else
																				total_late_in_min = ea.late_mark.to_i + late_diff_in_min
																				EmployeeAttendance.where(id: ea).update_all(late_mark: total_late_in_min)
																			 end
																			 end
																	else
																		if jd.ot_option == true
																			EmployeeAttendance.where(id: @c2.id).update_all(out_time: e.out)
																		else
																			EmployeeAttendance.where(id: @c2.id).update_all(out_time: ctm.out_time)
																		end
																	end
															end
															puts "Time Adjusted Nil"
													end

												end# if elsif end

											else #shift_master
							
											end #shift_master

											else
											# byebug
											# month_name = e.day.strftime("%B")
											# EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendances_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
											# MachineAttendance.where(id: e.id).update_all(is_proceed: true)
											#puts "In Time or Out Time Nil and status Also Nil"
											# byebug
											month_name = e.day.strftime("%B")
											if e.in.nil? && e.out.nil? && e.present.nil? == false
												 # byebug
												 EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: nil,out_time: nil,present: e.present,month_name: month_name)
												 MachineAttendance.where(id: e.id).update_all(is_proceed: true)

												elsif e.in.nil? && e.present.nil? == false
														 EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: ctm.in_time,out_time: e.out,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
														 MachineAttendance.where(id: e.id).update_all(is_proceed: true)
												
												elsif e.out.nil? && e.present.nil? == false
														# byebugs
															EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: ctm.out_time,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
															MachineAttendance.where(id: e.id).update_all(is_proceed: true)
													# end
											else
												if e.in.nil? == false && e.out.nil? == false && e.present.nil? == false
												 # byebug
												 @c3=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,present: e.present,month_name: month_name)
												 MachineAttendance.where(id: e.id).update_all(is_proceed: true)
												 # byebug
													if @c3.present == "A"
													else
														# byebug
														# if @c3.present == "W"
														# 	time_diff=TimeDifference.between(@c3.in_time.strftime('%H:%M:%S'), @c3.out_time.strftime('%H:%M:%S')).in_hours.to_f
														# 	total_time_diff = time_diff - ctm.working_hrs.to_f
														# 	EmployeeAttendance.where(id: @c3.id).update_all(working_hrs: time_diff)
														# 	if total_time_diff<0
														# 		EmployeeAttendance.where(id: @c3.id).update_all(difference_hrs: total_time_diff.abs)
														# 	else
														# 		# byebug
														# 		EmployeeAttendance.where(id: @c3.id).update_all(overtime_hrs: total_time_diff.to_f.round(2))
														# 	end
														# end
													 end
													end
											end 
										end

									else #joining_detail
										# byebug
									month_name = e.day.strftime("%B")
									@c1=EmployeeAttendance.create(employee_id: e.employee_id,day: e.day.to_date,in_time: e.in,out_time: e.out,machine_attendance_id: e.id,company_time_master_id: ctm.id,present: e.present,month_name: month_name)
									MachineAttendance.where(id: e.id).update_all(is_proceed: true)
	
								end #joining_detail
							end#joining_detail loop
							# byebug
							if e.in.nil? || e.out.nil? || e.present.nil?
								else
								# if e.employee.joining_detail.ot_option == true
								# if e.in.strftime('%H:%M:%S').between?(ctm.in_min_time.strftime('%H:%M:%S'), ctm.in_max_time.strftime('%H:%M:%S')) && e.out.strftime('%H:%M:%S').between?(ctm.out_min_time.strftime('%H:%M:%S'), ctm.out_max_time.strftime('%H:%M:%S'))
								# else
								  # byebug
									month_name = e.day.strftime("%B")
									emp_attend = EmployeeAttendance.where(employee_id: e.employee_id,month_name: month_name,day: e.day,difference_hrs: nil)
									emp_attend.each do |eatt|
										if eatt.in_time.nil? || eatt.out_time.nil?
										else
											time_diff=Time.at((eatt.out_time-eatt.in_time).round).utc.strftime "%H:%M"
											final_time_diff_in_hrs=time_diff.to_time.strftime("%H").to_i + time_diff.to_time.strftime("%M").to_f/60

											total_time_diff = (time_diff.to_time - ctm.working_hrs.to_time) / 1.hours
										 EmployeeAttendance.where(id: eatt).update_all(working_hrs: final_time_diff_in_hrs)
										if total_time_diff>0 && e.employee.joining_detail.ot_option == true
											# byebug
											EmployeeAttendance.where(id: eatt).update_all(overtime_hrs: total_time_diff.to_f.round(2))
										end
									# end # e.in.nil? || e.out.nil? || e.present.nil?
									end#emp_attend loop
									puts "Overtime Calculations............................."
										@emp_attend_1 = EmployeeAttendance.where(employee_id: e.employee_id,month_name: month_name,day: e.day,difference_hrs: nil,overtime_hrs: nil).where.not(late_mark: nil,working_hrs: nil)
										@late_mark_masters = LateMarkMaster.where(is_active: true)
										@emp_attend_1.each do |ea1| 
											if ea1.in_time.nil? || ea1.out_time.nil?
											else
											@late_mark_masters.each do |lmm|
												if ea1.late_mark.between?(lmm.from.to_i, lmm.to.to_i)
													# byebug
													working_hrs_to_minutes=Time.at(ea1.working_hrs.to_f*3600.round.abs).utc.strftime("%H:%M")

													late_working_hrs = (working_hrs_to_minutes.to_time - lmm.late_mark.to_time) / 1.hours
													# late_working_hrs_1 = (ea1.working_hrs.to_time - lmm.late_mark.to_time) / 1.hours
													if late_working_hrs<0 && e.employee.joining_detail.ot_option == true || e.employee.joining_detail.ot_option == false
														diff_hrs = (ctm.working_hrs.to_time - working_hrs_to_minutes.to_time) / 1.hours

														time_diff=Time.at((ea1.out_time-ea1.in_time).round).utc.strftime "%H:%M"
														final_time_diff_in_hrs=time_diff.to_time.strftime("%H").to_i + time_diff.to_time.strftime("%M").to_f/60

													  EmployeeAttendance.where(id: ea1).update_all(working_hrs: final_time_diff_in_hrs,difference_hrs: diff_hrs.abs,present: "A")
													else
														# byebug
														# if e.employee.joining_detail.ot_option == true || e.employee.joining_detail.ot_option == false
															late_hrs = (working_hrs_to_minutes.to_time - ctm.working_hrs.to_time) / 1.hours
															#byebug
															EmployeeAttendance.where(id: ea1).update_all(working_hrs: late_working_hrs,difference_hrs: late_hrs.abs)
															# late_working_hrs = (ea1.working_hrs.to_time - lmm.late_mark.to_time) / 1.hours
															# EmployeeAttendance.where(id: ea1).update_all(working_hrs: late_working_hrs,difference_hrs: late_hrs.abs)
															# byebug
													  # end
													end
													# total_time_diff = (late_working_hrs_1 - ctm.working_hrs.to_time) / 1.hours
													# if total_time_diff<0 || e.employee.joining_detail.ot_option == true || e.employee.joining_detail.ot_option == false
													# 	EmployeeAttendance.where(id: ea1).update_all(difference_hrs: total_time_diff.abs)
													# else
													# 	if total_time_diff<0 || e.employee.joining_detail.ot_option == true
													#   	EmployeeAttendance.where(id: ea1).update_all(overtime_hrs: total_time_diff.to_f.round(2))
													#   end
													# end
												end
											end#late_mark_masters loop
										end#emp_attend_1 loop
										puts "Difference Calculations............................."
								# end#e.employee.joining_detail.ot_option == true
							end# e.in.nil? || e.out.nil? || e.present.nil? && e.employee.joining_detail.ot_option == true
								# end
								#end#emp_attend loop
						end#employee loop
					end
				end
					end#company_time_masters loop
					flash[:notice] = "Machine Attendance Confirmed Successfully"
					redirect_to root_url
		end#machine_attendance_ids
	end


	def import_machine_attendance
		# @content = "Hello World"
		@machine_attendances = MachineAttendance.all
		# @employees = Employee.all
		respond_to do |format|
		format.html
		format.csv { send_data @machine_attendances.to_csv }
		format.xls
	    end
	   session[:active_tab] ="TimeManagement"
     session[:active_tab1] ="AttendanceSetup"
	end

	def import_machine_attendance_to_txt
		# @content = "Hello World"
		# @machine_attendances = MachineAttendance.all
		@employees = Employee.all
		respond_to do |format|
		format.html
		format.csv { send_data @employees.to_txt,filename: "employees-#{Date.today}.txt" }
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
