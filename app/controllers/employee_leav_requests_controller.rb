# require 'query_report/helper'  # need to require the helper
class EmployeeLeavRequestsController < ApplicationController
  before_action :set_employee_leav_request, only: [:show, :edit,:update, :destroy]
  # ##load_and_authorize_resource
  # include QueryReport::Helper  # need to include it

  def index
    @employee = Employee.find(current_user.employee_id)
    @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', current_user.try(:employee_id)).order("id DESC")
    @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
    #@leave_c_offs = LeaveCOff.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def show
  end

  def new
    @employee_leav_request = EmployeeLeavRequest.new
    @employee = Employee.find(current_user.employee_id)
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', current_user.employee_id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id)

    leav_category = LeavCategory.find_by(code: "C.Off")
    @leav_category_id = leav_category.id
    @leav_id = @leav_category_id.to_s.split('')

    @leave_id = params[:leav_category_id]
  end

  def edit
  end

  def from_hr
    @employee = Employee.find(params[:format])
    @employee_leav_request = EmployeeLeavRequest.new
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id, is_taken: false).order("expiry_date desc")
  end

  def select_admin_form
    @employee_leav_request = EmployeeLeavRequest.new
    employee = params[:employee_id]
    @employee = Employee.find_by(id: employee)
    @leave_id = params[:leav_category_id]

    leav_category = LeavCategory.find_by(code: "C.Off")
    @leav_category_id = leav_category.id
    @leav_id = @leav_category_id.to_s.split('')

    if params[:leav_category_id] == @leav_id.inject{|n| n}
      @flag = true
    else
      @flag = false
    end
  end

  def admin_c_off_form

    @employee_leav_request = EmployeeLeavRequest.new
    employee = params[:employee_id]
    @employee = Employee.find_by(id: employee)
    @leave_id = params[:leav_category_id]

    leav_category = LeavCategory.find_by(code: "C.Off")
    @leav_category_id = leav_category.id
    @leav_id = @leav_category_id.to_s.split('')

    if params[:leav_category_id] == @leav_id.inject{|n| n}
      @flag = true
    else
      @flag = false
    end
  end

  def select_checkbox
    if params[:leave_type] == "Full/Half" || params[:leave_type] == "Half Day"
      @flag = true
    else
      @flag = false
    end
  end

  def c_off_date
    if params[:leave_type] == "Full Day" || params[:leave_type] == " "
      @flag = true
    else
      @flag = false
    end
  end


  def c_off_date_admin
    @employee_id = params[:employee_id]
    if params[:leave_type] == "Full Day" || params[:leave_type] == " "
      @flag = true
    else
      @flag = false
    end
  end

  def select_form
    @employee_leav_request = EmployeeLeavRequest.new
    @employee = Employee.find_by(id: current_user.employee_id)
    @leave_id = params[:leav_category_id]

    leav_category = LeavCategory.find_by(code: "C.Off")
    @leav_category_id = leav_category.id
    @leav_id = @leav_category_id.to_s.split('')

    if params[:leav_category_id] == @leav_id.inject{|n| n}
      @flag = true
    else
      @flag = false
    end
  end

  def create
    @employee_leav_request = EmployeeLeavRequest.new(employee_leav_request_params)
    @employee = Employee.find(@employee_leav_request.employee_id)
    start_date = params['employee_leav_request']['start_date']
    @start_date = params['employee_leav_request']['start_date']
    end_date = params['employee_leav_request']['end_date']
    leav_category = LeavCategory.find_by(code: "C.Off")
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id)
    @leav_category = LeavCategory.find(@employee_leav_request.leav_category_id)
    payroll_period = PayrollPeriod.where(status: true).take 

    @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
    #c_off
    
    if @leav_category.id == leav_category.id

      end_date = params['employee_leav_request']['start_date']
      
        @leave_c_off_id = params[:common][:c_off_date]

  #nil fields
        if end_date == "" || @leave_c_off_id == "" || @leave_c_off_id == nil
          flash[:alert] = "Please Fill mendatory Fields"
        else#end_date == nil
          #if  start_date.to_date >= payroll_period.from.to_date && start_date.to_date <= payroll_period.to.to_date 
              @leave_c_off_id = params[:common][:c_off_date]
              @leave_c_off = LeaveCOff.find_by(id: @leave_c_off_id)
            if start_date.to_date > @leave_c_off.c_off_date.to_date
                if @leave_c_off.expiry_date == nil
                else
                  if @leave_c_off.expiry_date < start_date.to_date
                    flash[:alert] = "Compensatory off expired for this day"
                  elsif @leave_c_off.c_off_date > start_date.to_date
                    flash[:alert] = "Please check Compensatory off day"
                  end
                end
                if @employee_leav_request.is_available_coff?
                  flash[:alert] = "Your Leave Request already has been sent"
                elsif @employee_leav_request.is_salary_processed_coff?
                  flash[:alert] = "Salary Processed for this month"
                elsif @employee.manager_id.nil?
                  flash[:alert] = 'Reporting manager not set please set Reporting Manager'
                else
                  @employee_leav_request.first_reporter_id = @employee.manager_id
                  @employee_leav_request.is_pending = true
                  @employee_leav_request.current_status = 'Pending'
                  # if @leave_c_off.leave_count == 1.0 || @leave_c_off.leave_count == 0.0
                  
                  if params[:flag] == "Full"
                    @employee_leav_request.leave_count = 1.0
                    @employee_leav_request.leave_type = "Full Day"
                  else
                    @employee_leav_request.leave_count = 0.5
                    @employee_leav_request.leave_type = "Half Day"
                  end
                  # else
                  #   @employee_leav_request.leave_count = 0.5
                  #   @employee_leav_request.leave_type = "Half Day"
                  # end
                    @employee_leav_request.is_cancelled = false
                    @employee_leav_request.is_first_approved = false
                    @employee_leav_request.is_first_rejected = false
                    @employee_leav_request.is_second_approved = false
                    @employee_leav_request.is_second_rejected = false
                    @employee_leav_request.end_date = start_date
                    @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
                    LeaveCOff.find_by(id: @leave_c_off_id).update(taken_date: start_date)
                    @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id,status: "Pending", change_date: Date.today)
                    @employee_leav_request.save
                    @employee_leav_request.leave_record_create_coff(@employee_leav_request)
                    unless @emp_leave_bal.nil?
                      # if @employee_leav_request.leave_count == 0.5
                      #   no_of_leave = @emp_leave_bal.no_of_leave.to_f - @employee_leav_request.leave_count.to_f
                      #   @emp_leave_bal.update(no_of_leave: no_of_leave)
                      # else
                        no_of_leave = @emp_leave_bal.no_of_leave.to_f - @employee_leav_request.leave_count.to_f
                        @emp_leave_bal.update(no_of_leave: no_of_leave)
                      # end
    #emp_leav_bal_id
                        @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                    end
                    flash[:notice] = "Created successfully!"
                       LeaveRequestMailer.pending(@employee_leav_request).deliver_now    
                end#@leave_c_off.expiry_date < start_date.to_date

              else#start_date.to_date > @leave_c_off.c_off_date.to_date
                flash[:alert] = "C.Off Not Available For #{start_date}"
              end#c_off_date
            # else#start_date.to_date >= payroll_period.from.to_date && start_date.to_date <= payroll_period.to.to_date 
            #   flash[:alert] = "Please Select Date Within Payroll Period"
            # end

          end#end_date == nil
            if current_user.employee_id == @employee_leav_request.employee_id
              redirect_to employee_leav_requests_path
            else
              redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
            end
    else#c_off

        @emp_leav_req = EmployeeLeavRequest.where(employee_id: @employee.id, start_date: start_date,end_date: end_date)
          if params[:flag] == "Full/Half"
            @employee_leav_request.last_half = params[:common][:last_half]
            @employee_leav_request.first_half = params[:common][:first_half]
            @employee_leav_request.present_status = params[:common][:present_status]
            @checkbox = true
          else
            @checkbox = false
          end
      payroll_period = PayrollPeriod.where(status: true).take 
       @leav_category = LeavCategory.find_by(id: @employee_leav_request.leav_category_id)

      # if payroll_period.nil?
      #   flash[:alert] = "Payroll Period Not set!"
      #   redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      # else
  #nil fields
        if start_date == "" || end_date == ""
          flash[:alert] = "Please fill all mandatory fields "
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
        else

            # if  start_date.to_date >= payroll_period.from.to_date && end_date.to_date <= payroll_period.to.to_date
            

              if @employee_leav_request.end_date == nil 
                flash[:alert] = "please Fill all mendatory fields"
                redirect_to new_employee_leav_request_path
              elsif @employee_leav_request.is_available?
                flash[:alert] = "Your Leave Request already has been sent status is Pending"
                redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @employee_leav_request.is_first_approved?
                flash[:alert] = "Your Leave Request already has been sent status is First Approved"
                redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @employee_leav_request.is_final_approved?
                flash[:alert] = "Request already has Approved"
                redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @employee_leav_request.is_salary_processed?
                flash[:alert] = "Attendance Confirm Please Contact to Admin"
                redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @employee_leav_request.is_continue?
                flash[:alert] = "Leave Can't take continueously"
                redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @employee.manager_id.nil?
                flash[:alert] = 'Reporting manager not set please set Reporting Manager'
                redirect_to root_url
              # elsif @employee_leav_request.is_out_of_limit(@employee_leav_request)
              #   flash[:alert] = "Leave "
              #   redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              else
                @employee_leav_request.first_reporter_id = @employee.manager_id
                @employee_leav_request.is_pending = true
                @employee_leav_request.current_status = 'Pending'
                if @employee_leav_request.leave_type == 'Full Day'
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
                elsif @employee_leav_request.leave_type == 'Full/Half'

                  if @employee_leav_request.first_half == true && @employee_leav_request.last_half == true
                    @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f
                  elsif @employee_leav_request.first_half == true
                    @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                  elsif @employee_leav_request.last_half == true
                    @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                  else
                    @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                  end
                elsif @employee_leav_request.leave_type == 'Half Day'
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                elsif @employee_leav_request.leave_type == ''
                  
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
                else
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
                end
                  @employee_leav_request.is_cancelled = false
                  @employee_leav_request.is_first_approved = false
                  @employee_leav_request.is_first_rejected = false
                  @employee_leav_request.is_second_approved = false
                  @employee_leav_request.is_second_rejected = false

                  @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
                  type = LeavCategory.find(@employee_leav_request.leav_category_id).is_payble 
          #leave_limit
                  @leav_category = LeavCategory.find_by(id: @employee_leav_request.leav_category_id)
                  monthly_count = @employee_leav_request.leave_monthly_limit(@employee_leav_request)
                  
                    if @leav_category.monthly_leave != nil && monthly_count > @leav_category.monthly_leave.to_f 
                      flash[:alert] = "Leave Monthly Limit Extended !"
                      redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                    elsif type == false

                     
                      @employee_leav_request.save
                      @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id,status: "Pending", change_date: Date.today)
                        @employee_leav_request.save
              
                    #leave_record
                          @employee_leav_request.leave_record_create(@employee_leav_request)

                          @employee_leav_request.create_attendance_leave
                          @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total + l.count
                              end
                              total
                              @employee_leav_request.update(leave_count: total)

                              @employee_leav_request.minus_leave(@employee_leav_request)
                        
                        if @employee.manager.email.nil? or @employee.manager.email == ""
                          flash[:notice] = "Send request without email."
                        else
                          flash[:notice] = 'Leave Request sent successfully.'
                           LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                        end
                        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)

                    elsif @leav_category.is_limit == true && @employee_leav_request.is_out_of_limit(@employee_leav_request)
                      flash[:alert] = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}" 
                      redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                    else
                      @leave_category = LeavCategory.where(id: @employee_leav_request.leav_category_id,is_active: true).take
                      if @leave_category.is_balance == true
                          if @emp_leave_bal.nil?
                              @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                              flash.now[:alert] = 'Leave balance not set- contact to admin.'
                              render :new
                          elsif @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
                            @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                            flash.now[:alert] = 'Not Allowed. You exceed the leave limit.'
                            render :new
                          elsif @employee_leav_request.try(:start_date).try(:to_date) < @emp_leave_bal.try(:from_date).try(:to_date)
                            @emp_leave_bal1 =  EmployeeLeavBalance.where(employee_id: @employee.id,leav_category_id: @employee_leav_request.leav_category_id,is_active: false).last
                            if @employee_leav_request.leave_count.to_f > @emp_leave_bal1.try(:no_of_leave).to_f
                              flash[:alert] = 'You Have No Balance For This Date'
                            else
                              @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                              @employee_leav_request.save
                          #emp_leav_bal_id
                              @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                              @employee_leav_request.leave_record_create(@employee_leav_request)
                              @employee_leav_request.create_attendance_leave

                              # @leave_record = LeaveRecord.last
                              @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total + l.count
                              end
                              total
                              @employee_leav_request.update(leave_count: total)



                              @employee_leav_request.minus_leave(@employee_leav_request)
                              if @employee.manager.email.nil? || @employee.manager.email == ''
                                flash[:notice] = 'Send request without email.'
                              else
                                flash[:notice] = 'Leave Request sent successfully..'
                                LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                              end
                            end
                              redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                          elsif @leav_category.from.nil? or @leav_category.to.nil?
                            @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                            if @employee_leav_request.save
                              #byebug
                        #emp_leav_bal_id
                              @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                            #leave_record
                              @employee_leav_request.leave_record_create(@employee_leav_request)
                          @employee_leav_request.create_attendance_leave

                              # @leave_record = LeaveRecord.last
                              @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total.to_f + l.count.to_f
                              end
                              total.to_f
                              @employee_leav_request.update(leave_count: total)


                              @employee_leav_request.minus_leave(@employee_leav_request)
                              if @employee.manager.email.nil? || @employee.manager.email == ''
                                flash[:notice] = 'Send request without email.'
                              else
                                flash[:notice] = 'Leave Request sent successfully..'
                                 LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                              end
                              redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                            else
                              render :new
                            end
              # #from-to limit
              #           elsif
              #               @employee_leav_request.leave_count < @leav_category.from or @employee_leav_request.leave_count > @leav_category.to 
              #               @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
              #               flash.now[:alert] = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to} "
              #               render :new

                            #@leave_coff = LeaveCOff.where(employee_id: @employee.id)
                        elsif type == 'C.Off'
                            @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                            if @employee_leav_request.save
                          #emp_leav_bal_id
                              @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                            #leave_record
                              @employee_leav_request.leave_record_create(@employee_leav_request)
                          @employee_leav_request.create_attendance_leave

                              # @leave_record = LeaveRecord.last
                              @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total + l.count
                              end
                              total
                              @employee_leav_request.update(leave_count: total)


                              #@employee_leav_request.manage_coff(@employee_leav_request)
                              @employee_leav_request.minus_leave(@employee_leav_request)
                              if @employee.manager.email.nil? || @employee.manager.email == ''
                                flash[:notice] = 'Send request without email.'
                              else
                                flash[:notice] = 'Leave Request sent successfully !!'
                                 LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                              end
                              redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                            else
                              render :new
                            end
                        else
                            @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                            if @employee_leav_request.save
                          #emp_leav_bal_id
                              @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                  #leave_record
                          @employee_leav_request.leave_record_create(@employee_leav_request)
                          @employee_leav_request.create_attendance_leave

                          # @leave_record = LeaveRecord.last
                          @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total + l.count
                              end
                              total
                              @employee_leav_request.update(leave_count: total)


                              @employee_leav_request.minus_leave(@employee_leav_request)
                              if @employee.manager.email.nil? || @employee.manager.email == ''
                                flash[:notice] = 'Send request without email.'
                              else
                                flash[:notice] = 'Leave Request sent successfully !'
                                 LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                              end
                              redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                            else
                              render :new
                            end
                        end#balance.nil?

                    else #is_balance == true
                          @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                          if @employee_leav_request.save
                         #emp_leav_bal_id
                              #@employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)

                #leave_record
                        @employee_leav_request.leave_record_create(@employee_leav_request)
                          @employee_leav_request.create_attendance_leave

                          # @leave_record = LeaveRecord.last
                          @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                              total = 0
                              @leave_record.each do |l|
                                total = total + l.count
                              end
                              total
                              @employee_leav_request.update(leave_count: total)

                            @employee_leav_request.minus_leave(@employee_leav_request)
                            if @employee.manager.email.nil? || @employee.manager.email == ''
                              flash[:notice] = 'Send request without email.'
                            else
                              flash[:notice] = 'Leave Request sent successfully !'
                              # LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                            end
                            redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                          else
                            render :new
                          end
                    end #@leave_category.is_balance == true
                end #monthly_count > @leav_category.monthly_leave.to_f
              end #@employee_leav_request.end_date == nil 

                if @employee_leav_request.id != nil
                  if @employee_leav_request.leave_type == 'Full/Half'
                    if @employee_leav_request.first_half == false && @employee_leav_request.last_half == false
                      @employee_leav_request.update(first_half: false,last_half: true)
                    end
                  end

                  if @employee_leav_request.leave_type == 'Half Day'
                    if @employee_leav_request.first_half == true && @employee_leav_request.last_half == true
                      @employee_leav_request.update(first_half: true,last_half: false)
                    elsif @employee_leav_request.first_half == false && @employee_leav_request.last_half == false
                      @employee_leav_request.update(first_half: true,last_half: false)
                    else @employee_leav_request.first_half == true || @employee_leav_request.last_half == true
                      @employee_leav_request.save
                    end
                  end
                else
                end
              # if current_user.employee_id == @employee_leav_request.employee_id
              #   redirect_to employee_leav_requests_path
              # else
              #   redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              #   #redirect_to employee_list_on_duty_requests_path
              # end  
              
            # else #start_date == payroll_period.from.to_date
            #   flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
            # end
          end#start_date == nil
      # end#if payroll_period.nil?
    end#c_off
  end


  def update
    respond_to do |format|
      if @employee_leav_request.update(employee_leav_request_params)
        format.html { redirect_to @employee_leav_request, notice: 'Employee leav request was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_leav_request }
      else
        format.html { render :edit }
        format.json { render json: @employee_leav_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_leav_request.destroy
    respond_to do |format|
      format.html { redirect_to employee_leav_requests_url, notice: 'Employee leav request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approved_or_rejected_leave_request
   
      @pending_employee_leav_requests = EmployeeLeavRequest.where("current_status = ? OR current_status = ?", "Pending","FirstApproved").where(first_reporter_id: current_user.employee_id)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false, second_reporter_id: current_user.employee_id)
   
    # @employee_leav_requests = EmployeeLeavRequest.joins("LEFT JOIN leav_approveds ON employee_leav_requests.id = leav_approveds.employee_leav_request_id LEFT JOIN leav_cancelleds ON employee_leav_requests.id = leav_cancelleds.employee_leav_request_id LEFT JOIN leav_rejecteds ON employee_leav_requests.id = leav_rejecteds.employee_leav_request_id where leav_approveds.id IS NULL AND leav_rejecteds.id IS NULL AND leav_cancelleds.id IS NULL")
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end

  def all_leave_request_list
    @first_level_request_lists = EmployeeLeavRequest.where("current_status = ? OR current_status = ?", "Pending","FirstApproved")
    @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
    @second_level_request_lists = EmployeeLeavRequest.where("current_status = ? OR current_status = ?", "Pending","FirstApproved")
  # @employee_leav_requests = EmployeeLeavRequest.joins("LEFT JOIN leav_approveds ON employee_leav_requests.id = leav_approveds.employee_leav_request_id LEFT JOIN leav_cancelleds ON employee_leav_requests.id = leav_cancelleds.employee_leav_request_id LEFT JOIN leav_rejecteds ON employee_leav_requests.id = leav_rejecteds.employee_leav_request_id where leav_approveds.id IS NULL AND leav_rejecteds.id IS NULL AND leav_cancelleds.id IS NULL")
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end

  def employee_list
    if current_user.class == Group
      @employees = Employee.all
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end


  def hr_view_request
    @employee = Employee.find(params[:format])
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @employee_leav_requests = @employee.employee_leav_requests.order("id DESC")
  end

  def employee_history_with_current_leave
    @current_request = EmployeeLeavRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @employee_leav_requests = @employee.employee_leav_requests.order("id DESC")
  end

  def admin_employee_history_with_current_leave
    @current_request = EmployeeLeavRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @employee_leav_requests = @employee.employee_leav_requests.order("id DESC")
  end

  def search_by_start_date
    reporter(EmployeeLeavRequest.filter_records(current_user), template_class: PdfReportTemplate) do
      filter :start_date, type: :date
      # filter :current_status, type: :string
      #column(:Request_ID, sortable: true) { |employee_leav_request| employee_leav_request.id }
      column(:ID, sortable: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |employee_leav_request| full_name(employee_leav_request.employee) }
      column(:Designation, sortable: true) { |employee_leav_request| employee_leav_request.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:From, sortable: true) { |employee_leav_request| employee_leav_request.start_date.to_date }
      column(:To, sortable: true) { |employee_leav_request| employee_leav_request.end_date.to_date }
      column(:Leave_Category, sortable: true) { |employee_leav_request| employee_leav_request.leav_category.try(:description) }
      column(:Apply_Date, sortable: true) { |employee_leav_request| employee_leav_request.created_at.to_date }
      column(:Apply_Time, sortable: true) { |employee_leav_request| employee_leav_request.created_at }
      column(:Leave_Type, sortable: true, &:leave_type)
      column(:Status, sortable: true, &:current_status)
      column(:No_OF_Day, sortable: true, &:leave_count)
      column(:Reason, sortable: true, &:reason)
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
    end
  end

  def search_by_is_pending_date
    reporter(@employee_leav_requests, template_class: PdfReportTemplate) do
      filter :current_status, type: :string
      # filter(:current_status, :enum, :select => [["Pending",0],["Cancelled",1],["FirstApproved",2],["SecondApproved",3],["FirstRejected",4],["SecondRejected",5]])
      column(:Employee_ID, sortable: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
      column(:Emploee_name, sortable: true) { |employee_leav_request| full_name(employee_leav_request.employee) }
      column :current_status
    end
  end

  def leave_request_report
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end
  
  def request_report
    @start_date = params[:employee] ? params[:employee][:start_date] : params[:start_date]
    @end_date = params[:employee] ? params[:employee][:end_date] : params[:end_date]
    @company_id = params[:employee] ? params[:employee][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
  
    if current_user.class == Group
      if @company_id == ""
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CEO'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_requests/leave_request.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'request_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_requests/leave_request.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
  
  def leave_req_status_report
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end

  def status_wise_request
    @start_date = params[:employee] ? params[:employee][:start_date] : params[:start_date]
    @end_date = params[:employee] ? params[:employee][:end_date] : params[:end_date]
    @company = params[:employee] ? params[:employee][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @status = params[:employee] ? params[:employee][:current_status] : params[:current_status]
    
    if @status == "Pending"
      @current_status = 0
    elsif @status == "FinalApproved"
      @current_status = 3
    elsif @status == "FirstApproved"
      @current_status = 2
    elsif @status == "Cancelled"
      @current_status = 1
    elsif @status == "Rejected"
      @current_status = 4
    end
    
    if current_user.class == Group
      if @company == ""
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      end

    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @employee_leav_request_id = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_requests/status_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_requests/status_wise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def balancewise_report
  end

  def show_balancewise_report
    @employee_id = params[:employee][:employee_id]
    @employee = Employee.find_by(id: @employee_id)
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_requests/balancewise_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_requests/balancewise_report.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def leave_request_modal
    @employee_leav_request = EmployeeLeavRequest.find(params[:format])
  end

  private

# Use callbacks to share common setup or constraints between actions.
  def set_employee_leav_request
    @employee_leav_request = EmployeeLeavRequest.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def employee_leav_request_params
    params.require(:employee_leav_request).permit(:present_status,:first_half,:last_half,:current_status,:current_status1,:employee_id, :leav_category_id, :leave_type, :date_range, :start_date, :end_date, :reason)
  end
end
