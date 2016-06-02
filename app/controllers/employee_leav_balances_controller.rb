require 'query_report/helper'  # need to require the helper

class EmployeeLeavBalancesController < ApplicationController
  before_action :set_employee_leav_balance, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  include QueryReport::Helper  # need to include it
  # GET /employee_leav_balances
  # GET /employee_leav_balances.json
  def index
    if current_user.class == Group
      @employee_leav_balances = EmployeeLeavBalance.all
    else
      if current_user.role.name == 'Company'
        @employee_leav_balances = EmployeeLeavBalance.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
      end
    end
    session[:active_tab] ="leavemanagement"
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
  end

  # POST /employee_leav_balances
  # POST /employee_leav_balances.json
  def create
    @employee_ids = params[:employee_ids]
    if @employee_ids.nil?
      flash[:alert] = 'Leave not assigned. Please select employee.'
      redirect_to new_employee_leav_balance_path
    else
      ActiveRecord::Base.transaction do
        @employee_ids.each do |e|
          leave_category = LeavCategory.find(params[:employee_leav_balance][:leav_category_id])
            @elb = EmployeeLeavBalance.create(employee_id: e, leav_category_id: params[:employee_leav_balance][:leav_category_id], no_of_leave: params[:employee_leav_balance][:no_of_leave], total_leave: params[:employee_leav_balance][:total_leave], expiry_date: params[:employee_leav_balance][:expiry_date])
        end
      end
      flash[:notice] = 'Leave assigned successfully.'
      redirect_to new_employee_leav_balance_path
    end
  end

  # PATCH/PUT /employee_leav_balances/1
  # PATCH/PUT /employee_leav_balances/1.json
  def update
    respond_to do |format|
      if @employee_leav_balance.update(employee_leav_balance_params)
        # format.html { redirect_to @employee_leav_balance, notice: 'Employee leav balance was successfully updated.' }
        # format.json { render :show, status: :ok, location: @employee_leav_balance }
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @employee_leav_balance.errors, status: :unprocessable_entity }
        format.js { @flag = true }
      end
    end
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
    reporter(@employee_leav_balances, template_class: PdfReportTemplate) do
      filter :manual_employee_code, type: :string
      #filter(:current_status, :enum, :select => [["Pending",0], ["FirstApproved",2], ["SecondApproved",3], ["FirstRejected",4],["SecondRejected",5],["Cancelled",1]])
      column(:manual_employee_code, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:manual_employee_code) }
      column(:first_name, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:first_name) }
      column(:middle_name, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:middle_name) }
      column(:last_name, sortable: true) { |employee_leav_balance| employee_leav_balance.employee.try(:last_name) }
      column(:leav_category_id, sortable:true){|employee_leav_balance| employee_leav_balance.leav_category.try(:name)}
      column(:no_of_leave, sortable:true){|employee_leav_balance| employee_leav_balance.try(:no_of_leave)}
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
        if current_user.role.name == 'Company'
          e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
          @employees = Employee.where.not(id: e)
          # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id}")
        elsif current_user.role.name == 'CompanyLocation'
          e = EmployeeLeavBalance.where(leav_category_id: leav_category_id).pluck(:employee_id)
          @employees = Employee.where.not(id: e).where(company_location_id: current_user.employee.company_location_id)
          # @employees = Employee.joins("LEFT JOIN employee_leav_balances on employee_leav_balances.employee_id = employees.id where employee_leav_balances.leav_category_id is not #{leav_category_id} and employees.company_location_id = #{current_user.company_location_id}")
        end
      end
      @flag = true
      @employee_leav_balance = EmployeeLeavBalance.new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_leav_balance
    @employee_leav_balance = EmployeeLeavBalance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_leav_balance_params
    params.require(:employee_leav_balance).permit(:employee_id, :leav_category_id, :no_of_leave, :total_leave, :expiry_date)
  end
end
