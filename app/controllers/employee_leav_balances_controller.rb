
# require 'query_report/helper'  # need to require the helper

class EmployeeLeavBalancesController < ApplicationController
  before_action :set_employee_leav_balance, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource
  # include QueryReport::Helper  # need to include it
  # GET /employee_leav_balances
  # GET /employee_leav_balances.json
  def index
    # @employee_leav_balance = EmployeeLeavBalance.new
    if current_user.class == Group
      @employee_leav_balances = EmployeeLeavBalance.all
    else
      if current_user.role.name == 'GroupAdmin'
        @employee_leav_balances = EmployeeLeavBalance.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(status: 'Active',department_id: current_user.department_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      elsif current_user.role.name == 'Costomize'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="leaveadministration"
  end

  def show_balance
    if current_user.class == Group
      @employee_leav_balances = EmployeeLeavBalance.all
    else
      if current_user.role.name == 'GroupAdmin'
        @employee_leav_balances = EmployeeLeavBalance.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(status: 'Active',department_id: current_user.department_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      elsif current_user.role.name == 'Costomize'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_balances/show_balance.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_balance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_balances/show_balance.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
  # GET /employee_leav_balances/1
  # GET /employee_leav_balances/1.json
  def show
  end

  def leave_balance_report
  end

  def show_leave_balance
    @from_date = params[:employee] ? params[:employee][:from_date] : params[:from_date]
    @to_date = params[:employee] ? params[:employee][:to_date] : params[:to_date]
    @employee_id = params[:employee] ? params[:employee][:employee_id] : params[:employee_id]

    @employee = Employee.find(@employee_id)
    @leave_records = LeaveRecord.where(employee_id: @employee_id,day: @from_date.to_date..@to_date.to_date).group(:employee_leav_request_id)
    
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_balances/leave_balance.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_balances/leave_balance.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def all_balance
    employee_id = Employee.where(status: "Active")
    leav_category = LeavCategory.find_by(code: "C.Off")
    @employee_leav_balances = EmployeeLeavBalance.where(employee_id: employee_id,leav_category_id: leav_category.id,is_active: true)
  end

  # GET /employee_leav_balances/new
  def new
    @employee_leav_balance = EmployeeLeavBalance.new
    @employees = Employee.all
  end

  # GET /employee_leav_balances/1/edit
  def edit
    @leav_category = LeavCategory.find(@employee_leav_balance.leav_category_id)
  end

  def date_categorywise_balance
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end

  def show_date_categorywise
    @from_date = params[:employee] ? params[:employee][:from_date] : params[:from_date]
    @to_date = params[:employee] ? params[:employee][:to_date] : params[:to_date]
    @leav_category_id = params[:employee] ? params[:employee][:leav_category_id] : params[:leav_category_id]
    @emp = Employee.where(status: "Active")

    if @leav_category_id == nil || @leav_category_id == ""
      @employee_leav_balances = EmployeeLeavBalance.where(from_date: @from_date.to_date..@to_date.to_date,employee_id: @emp)
    else
      @employee_leav_balances = EmployeeLeavBalance.where(from_date: @from_date.to_date..@to_date.to_date,leav_category_id: @leav_category_id,employee_id: @emp)
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_balances/date_categorywise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_balances/date_categorywise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  # POST /employee_leav_balances
  # POST /employee_leav_balances.json
def create
    @employee_leav_balance = EmployeeLeavBalance.new(employee_leav_balance_params)

    @employee_ids = params[:employee_ids]
    if @employee_ids.nil?
      flash[:alert] = 'Leave not assigned. Please select employee.'
      redirect_to new_employee_leav_balance_path
    else
      ActiveRecord::Base.transaction do
        @employee_ids.each do |e|
          leave_category = LeavCategory.find(params[:employee_leav_balance][:leav_category_id])
            @elb = EmployeeLeavBalance.create(employee_id: e, leav_category_id: params[:employee_leav_balance][:leav_category_id], no_of_leave: params[:employee_leav_balance][:no_of_leave], total_leave: params[:employee_leav_balance][:total_leave], from_date: params[:employee_leav_balance][:from_date],to_date: params[:employee_leav_balance][:to_date],is_active: true)
        end
      end
       @employee_actual_workingday = 0
        @employee_leav_bal = EmployeeLeavBalance.where("to_date <= ? AND is_active = ?", Date.today,true)
        @employee_leav_bal.each do |e|
          from_date = e.from_date
          to_date = e.to_date

          @from_month = from_date.strftime('%B')
          @to_month = to_date.strftime('%B')

          if @employee_leav_balance.is_present(e)
             @leave_master = LeaveMaster.find_by(leav_category_id: e.leav_category_id)
          
              date_monthly = e.to_date + 30
              date_quarterly = e.to_date + 90
              date_half_yearly = e.to_date + 180
              date_yearly = e.to_date + 365

            if e.employee.try(:status) == 'Active'
              from = from_date.to_date
              to = to_date.to_date
              
              @from_month = from.strftime("%m")
              @to_month = to.strftime("%m")
              @from_year = from.strftime("%Y")
              @to_year = to.strftime("%Y")

              payable_day = 0
              for i in @from_year..@to_year
                for j in @from_month..@to_month
                  @workingday = Workingday.where(employee_id: e.employee_id).where("DATE_FORMAT(date,'%m') = ?", j).take
                  if @workingday.nil?
                    payable_day = payable_day + 0
                  else
                    payable_day = @workingday.payable_day.to_f + payable_day.to_f
                  end
                end# j
              end# i
              payable_day

              if e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Quarterly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                      carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day not nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil
                
                elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Monthly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                      carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day = nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                           if @calculated_no_of_leave.to_f <= @leave_master.no_of_leave.to_f
                             @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                           else
                             @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                           end
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave: @leave.round(2),carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil



                elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Half-yearly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f

                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                        carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day = nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil

                elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Yearly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f

                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                        carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day = nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil


              end #if_else_monthly
          else #status_Inactive
          end

          else #is_present
           
          end
        end #do

      flash[:notice] = 'Leave assigned successfully.'
      redirect_to new_employee_leav_balance_path
    end #employee_ids = nil
  end


  def leave

    # @leav_category_id = params[:salary][:leav_category_id]
    # @employee_leav_balance = EmployeeLeavBalance.where(params[:leav_category_id])
    # leave_category = LeavCategory.find(params[:salary][:leav_category_id])

        @employee_actual_workingday = 0
        @emp =  Employee.where(status: "Active").pluck(:id)
        @employee_leav_bal = EmployeeLeavBalance.where("to_date <= ? AND is_active = ?", Date.today,true).where(employee_id: @emp)
        @employee_leav_bal.each do |e|
          from_date = e.from_date
          to_date = e.to_date

          @from_month = from_date.strftime('%B')
          @to_month = to_date.strftime('%B')

          if LeaveMaster.exists?(leav_category_id: e.leav_category_id)
             @leave_master = LeaveMaster.find_by(leav_category_id: e.leav_category_id)
          
              date_monthly = e.to_date + 30
              date_quarterly = e.to_date + 90
              date_half_yearly = e.to_date + 180
              date_yearly = e.to_date + 365

            if e.employee.try(:status) == 'Active'
              from = from_date.to_date
              to = to_date.to_date
              
              @from_month = from.strftime("%m")
              @to_month = to.strftime("%m")
              @from_year = from.strftime("%Y")
              @to_year = to.strftime("%Y")

              payable_day = 0
              for i in @from_year..@to_year
                for j in @from_month..@to_month
                  @workingday = Workingday.where(employee_id: e.employee_id).where("DATE_FORMAT(date,'%m') = ?", j).take
                  if @workingday.nil?
                    payable_day = payable_day + 0
                  else
                    payable_day = @workingday.payable_day.to_f + payable_day.to_f
                  end
                end# j
              end# i
              payable_day

              if e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Quarterly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                      carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day not nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_quarterly,expiry_date: date_quarterly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil
                
                elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Monthly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                      carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day = nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_monthly,expiry_date: date_monthly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil



              elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Half-yearly"
                if @leave_master.working_day == nil
                  if @leave_master.is_carry_forward == true
                    @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                    if @leave <= @leave_master.limit.to_f

                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                      e.update(is_active: false)
                    else
                        carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                      e.update(is_active: false)
                    end #limit
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                    e.update(is_active: false)
                  end #is_carry_forward
                else #working_day = nil
                  @calculated_no_of_leave = 0
                  if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_half_yearly,expiry_date: date_half_yearly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                            collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                  else #emp_available()
                    flash[:alert] = "Workingday not available"
                  end #emp_available()
                end #working_day nil

                elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Yearly"
                  if @leave_master.working_day == nil
                    if @leave_master.is_carry_forward == true
                      @leave = @leave_master.no_of_leave.to_f + e.no_of_leave.to_f
                      if @leave <= @leave_master.limit.to_f

                        EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round(2),from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave,carry_forward: e.no_of_leave,leave_count: @leave_master.no_of_leave,collapse_value: 0,working_day: payable_day)
                        e.update(is_active: false)
                      else
                          carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                        collapse_value = @leave.to_f - @leave_master.limit.to_f
                        EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave_master.limit,carry_forward: carry_forward.round(2),leave_count: @leave_master.no_of_leave,collapse_value: collapse_value.round(2),working_day: payable_day)
                        e.update(is_active: false)
                      end #limit
                    else
                      EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: @leave_master.no_of_leave,carry_forward: 0,leave_count: @leave_master.no_of_leave,collapse_value: e.no_of_leave,working_day: payable_day)
                      e.update(is_active: false)
                    end #is_carry_forward
                  else #working_day = nil
                  @calculated_no_of_leave = 0
                    if @employee_leav_balance.emp_available(e)

                      if payable_day.to_f < @leave_master.working_day.to_f
                        if @leave_master.is_carry_forward == true
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: e.no_of_leave.to_f,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: e.no_of_leave.to_f,carry_forward: e.no_of_leave.to_f,leave_count: 0,collapse_value: 0,working_day: payable_day)
                          e.update(is_active: false)
                        else 
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: 0,from_date: e.to_date,to_date: date_yearly,expiry_date: date_yearly,is_active: true,total_leave: 0,carry_forward: 0,leave_count: 0,collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end #is_carry_forward
                      else #@employee_actual_workingday < workingday
                          @calculated_no_of_leave = ( payable_day.to_f / @leave_master.company_workingday).to_f * @leave_master.no_of_leave.to_f
                        if @leave_master.is_carry_forward == true
                          @leave = @calculated_no_of_leave.to_f + e.no_of_leave.to_f
                          if @leave <= @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave.round,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave: @leave.round,carry_forward: e.no_of_leave.to_f,leave_count: @calculated_no_of_leave.round(2),collapse_value: 0,working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          else
                            carry_forward = @leave_master.limit.to_f - @leave_master.no_of_leave.to_f
                      collapse_value = @leave.to_f - @leave_master.limit.to_f
                            EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit.to_f,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave: @leave_master.limit.to_f,carry_forward: carry_forward.round(2),leave_count: @calculated_no_of_leave.round(2),collapse_value: collapse_value.round(2),working_day: payable_day)
                            e.update(is_active: false)
                            flash[:notice] = "Created Successfully"
                          end #@leave <= limit
                        else #is_carry_forward
                          EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: calculated_no_of_leave.to_f,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly,total_leave:  calculated_no_of_leave.to_f,carry_forward: 0,leave_count: @calculated_no_of_leave.round(2),collapse_value:  e.no_of_leave,working_day: payable_day)
                          e.update(is_active: false)
                        end
                      end # @day
                    #end  #for i in
                    else #emp_available()
                      flash[:alert] = "Workingday not available"
                    end #emp_available()
                  end #working_day nil
                    flash[:notice] = 'Leave assigned successfully.'

                end #if_else_monthly
          else #status_Inactive
            flash[:alert] = "Employee is not Active"
          end
        else #is_present
         flash[:alert] = "#{e.leav_category.code} is not Present is Leave Master!"
        end
      end #do
      redirect_to employee_leav_balances_path
    end #employee_ids = nil

  # PATCH/PUT /employee_leav_balances/1
  # PATCH/PUT /employee_leav_balances/1.json
  def update
    if @employee_leav_balance.update(employee_leav_balance_params)
      @flag = true
    else
     @flag = false
    end
    redirect_to employee_leav_balance_path
  end

  # DELETE /employee_leav_balances/1
  # DELETE /employee_leav_balances/1.json
  def destroy
    @employee_leav_balance.destroy
    respond_to do |format|
      format.html { redirect_to employee_leav_balances_url, notice: 'Employee leav balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_leave_balance
    reporter(EmployeeLeavBalance.filter_records(current_user), template_class: PdfReportTemplate) do
      # filter :manual_employee_code, type: :string
      #filter(:current_status, :enum, :select => [["Pending",0], ["FirstApproved",2], ["SecondApproved",3], ["FirstRejected",4],["SecondRejected",5],["Cancelled",1]])
      column(:IDD, sortable: true) { |employee_leav_balance| employee_leav_balance.id }
      column(:ID, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |employee_leav_balance| full_name(employee_leav_balance.employee) }
      column(:Designation, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:Leave_Category, sortable:true){|employee_leav_balance| employee_leav_balance.leav_category.try(:description)}
      column(:Leave_Balance, sortable:true){|employee_leav_balance| employee_leav_balance.try(:no_of_leave)}
      # column(:Expiry_Date, sortable:true){|employee_leav_balance| employee_leav_balance.try(:expiry_date)}
      column(:From_Date, sortable:true){|employee_leav_balance| employee_leav_balance.try(:from_date)}
      column(:To_Date, sortable:true){|employee_leav_balance| employee_leav_balance.try(:to_date)}
      column(:Status, sortable:true){|employee_leav_balance| employee_leav_balance.try(:is_active)}
      column(:Total_Leave, sortable:true){|employee_leav_balance| employee_leav_balance.try(:total_leave)}
       column(:Carry_Forward, sortable:true){|employee_leav_balance| employee_leav_balance.try(:carry_forward)}
        column(:Leave_Count, sortable:true){|employee_leav_balance| employee_leav_balance.try(:leave_count)}
         column(:Collapes_Value, sortable:true){|employee_leav_balance| employee_leav_balance.try(:collapse_value)}
          column(:Working_Day, sortable:true){|employee_leav_balance| employee_leav_balance.try(:working_day)}
      column(:Location, sortable:true){|employee_leav_balance| employee_leav_balance.employee.try(:company_location).try(:name)}

    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
    end    
  end

  def collect_employee_for_leave
    if params[:leav_category_id] == ''
      @flag = false
    else
      leav_category_id = params[:leav_category_id]
      @leav_category = LeavCategory.find(params[:leav_category_id])
      if current_user.class == Group
        e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
        @employees = Employee.where.not(id: e)
        # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id}")
      else
        if current_user.role.name == 'GroupAdmin'
          e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
          @employees = Employee.where.not(id: e)
          # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id}")
        elsif current_user.role.name == 'Admin'
          e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
          @employees = Employee.where.not(id: e).where(company_id: current_user.employee.company_location.company_id)
        elsif current_user.role.name == 'Branch'
          e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
          @employees = Employee.where.not(id: e).where(company_location_id: current_user.employee.company_location_id)
          # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id} and employees.company_location_id = #{current_user.company_location_id}")
        end
      end
      @flag = true
      @employee_leav_balance = EmployeeLeavBalance.new
    end
  end

  def leave_balance_modal
     @employee_leav_balance = EmployeeLeavBalance.find(params[:format])
     @leav_category = LeavCategory.find(@employee_leav_balance.leav_category_id)
  end

  def update_leave_balance
     @employee_leav_balance = EmployeeLeavBalance.find(params[:id])
     @employee_leav_balance.update(employee_leav_balance_params)
     flash[:notice] = 'Leave Balance Updated Successfully'
     redirect_to employee_leav_balances_path
  end

  def is_confirm_leave
    @employee_leav_balance = EmployeeLeavBalance.find(params[:emp_leav_bal_id])
    EmployeeLeavBalance.where(id: @employee_leav_balance.id).update_all(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to employee_leav_balances_path
  end

  def modal_balance_detail
    @employee_leav_balance = EmployeeLeavBalance.find(params[:format])
  end

  def import_xl
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Import" 
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_xl_employee_leav_balances_path
    else
    EmployeeLeavBalance.import(params[:file])
    redirect_to import_employee_leav_balance_employee_leav_balances_path, notice: "File imported."
    end
  end

  def import_employee_leav_balance
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports" 
  end

  def employee_leav_balance_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employee_leav_balances = EmployeeLeavBalance.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @employee_leav_balances = EmployeeLeavBalance.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employee_leav_balances = EmployeeLeavBalance.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def report
     @employee_leav_balances = EmployeeLeavBalance.all
      respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_balances/excel_report.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_balances/pdf_report.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_leav_balance
    @employee_leav_balance = EmployeeLeavBalance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_leav_balance_params
    params.require(:employee_leav_balance).permit(:c_off_hrs,:carry_forward,:leave_count,:collapse_value,:working_day,:from_date,:to_date,:is_confirm,:employee_id, :leav_category_id, :no_of_leave, :total_leave, :expiry_date)
  end
end