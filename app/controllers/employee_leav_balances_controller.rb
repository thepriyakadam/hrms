require 'query_report/helper'  # need to require the helper

class EmployeeLeavBalancesController < ApplicationController
  before_action :set_employee_leav_balance, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  include QueryReport::Helper  # need to include it
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
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="leaveadministration"
  end

  # GET /employee_leav_balances/1
  # GET /employee_leav_balances/1.json
  def show
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

        @employee_leav_bal = EmployeeLeavBalance.where(to_date: Date.today,is_active: true)
        @employee_leav_bal.each do |e|
         
          if @employee_leav_balance.is_present(e)
             @leave_master = LeaveMaster.find_by(leav_category_id: e.leav_category_id)

              date_monthly = e.to_date + 30
              date_quarterly = e.to_date + 90
              date_half_yearly = e.to_date + 180
              date_yearly = e.to_date + 360

              if e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Monthly"
                if @leave_master.is_carry_forward == true
                  @leave = @leave_master.no_of_leave.to_i + e.no_of_leave.to_i
                  if @leave <= @leave_master.limit.to_i
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  end
                else
                  EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_monthly,is_active: true,expiry_date: date_monthly)
                  e.update(is_active: false)
                end

              elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Quarterly"
                if @leave_master.is_carry_forward == true
                  @leave = @leave_master.no_of_leave.to_i + e.no_of_leave.to_i
                  if @leave <= @leave_master.limit.to_i
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  end
                else
                  EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_quarterly,is_active: true,expiry_date: date_quarterly)
                  e.update(is_active: false)
                end

              elsif e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Half-yearly"
                if @leave_master.is_carry_forward == true
                  @leave = @leave_master.no_of_leave.to_i + e.no_of_leave.to_i
                  if @leave <= @leave_master.limit.to_i
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  end
                else
                  EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_half_yearly,is_active: true,expiry_date: date_half_yearly)
                  e.update(is_active: false)
                end

              else e.leav_category_id == @leave_master.leav_category_id && @leave_master.period == "Yearly"
                if @leave_master.is_carry_forward == true
                  @leave = @leave_master.no_of_leave.to_i + e.no_of_leave.to_i
                  if @leave <= @leave_master.limit.to_i
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  else
                    EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.limit,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly)
                    e.update(is_active: false)
                    flash[:notice] = "Created Successfully"
                  end
                else
                  EmployeeLeavBalance.create(employee_id: e.employee_id,leav_category_id: e.leav_category_id,no_of_leave: @leave_master.no_of_leave,from_date: e.to_date,to_date: date_yearly,is_active: true,expiry_date: date_yearly)
                  e.update(is_active: false)
                end
              end
          else
           
          end
        end

      flash[:notice] = 'Leave assigned successfully.'
      redirect_to new_employee_leav_balance_path
    end
  end
 
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
      column(:Employee_ID, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |employee_leav_balance| full_name(employee_leav_balance.employee) }
      column(:Designation, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:Leave_Category, sortable:true){|employee_leav_balance| employee_leav_balance.leav_category.try(:description)}
      column(:Leave_Balance, sortable:true){|employee_leav_balance| employee_leav_balance.try(:no_of_leave)}
      # column(:Expiry_Date, sortable:true){|employee_leav_balance| employee_leav_balance.try(:expiry_date)}
      column(:Total_Leave, sortable:true){|employee_leav_balance| employee_leav_balance.try(:total_leave)}
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
          @employees = Employee.where.not(id: e).where(company_id: current_user.employee.company_id)
          # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id}")
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_leav_balance
    @employee_leav_balance = EmployeeLeavBalance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_leav_balance_params
    params.require(:employee_leav_balance).permit(:from_date,:to_date,:is_confirm,:employee_id, :leav_category_id, :no_of_leave, :total_leave, :expiry_date)
  end
end
