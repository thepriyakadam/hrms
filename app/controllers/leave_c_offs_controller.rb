require 'query_report/helper' # need to require the helper

class LeaveCOffsController < ApplicationController
  before_action :set_leave_c_off, only: [:show, :edit, :update, :destroy]
  
  # GET /leave_c_offs
  # GET /leave_c_offs.json
  include QueryReport::Helper # need to include it

  def index
  end

  # GET /leave_c_offs/1
  # GET /leave_c_offs/1.json
  def show
  end

  # GET /leave_c_offs/new
  def new
    @leave_c_off = LeaveCOff.new
    if current_user.class == Group
      @leave_c_offs = LeaveCOff.all
    else
      if current_user.role.name == 'GroupAdmin'
        @leave_c_offs = LeaveCOff.all
      if current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @leave_c_offs = LeaveCOff.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @leave_c_offs = LeaveCOff.where(employee_id: @employees)
      end
    end
     session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="leaveadministration"
  end

  # GET /leave_c_offs/1/edit
  def edit
  end

  # POST /leave_c_offs
  # POST /leave_c_offs.json
  def create
    @leave_c_off = LeaveCOff.new(leave_c_off_params)
    if @leave_c_off.is_present?
      redirect_to new_leave_c_off_path
      flash[:alert] = "Your COff already set for that day"
    else
        @leave_c_off = LeaveCOff.new(leave_c_off_params)
        @leave_c_offs = LeaveCOff.all
        leav_category = LeavCategory.find_by_name('Compensatory Off')
        if @leave_c_off.expiry_status == true
          @leave_c_off.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
        else
        end
        @c_off = LeaveCOff.where(is_expire: nil,expiry_status: true)

        if leav_category.nil?
        else
          is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
          if is_exist
            @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take
             @c_off = LeaveCOff.where(is_expire: nil,expiry_status: true)
             
            if @leave_c_off.c_off_type == 'Full Day'
              @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
              @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
              @leave_c_off.leave_count = 1
              @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)

              @c_off.each do |l|
                if l.try(:expiry_date).to_date < Date.today
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
                  @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                  LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                  @employee_leave_balance.save
                else
                  @employee_leave_balance.save
                end
              end
            else
              @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 0.5
              @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 0.5
              @leave_c_off.leave_count = 0.5
              @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
              
              @c_off.each do |l|
                if l.try(:expiry_date) < Date.today
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take
                  @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                  LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                @employee_leave_balance.save
                else
                @employee_leave_balance.save
                end
              end
            end
          else
            @employee_leave_balance = EmployeeLeavBalance.new do |b|
              b.employee_id = @leave_c_off.employee_id
              b.leav_category_id = leav_category.id
              if @leave_c_off.expiry_status == true
                b.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
              else
              end
              b.is_active = true
              @c_off = LeaveCOff.where(is_expire: nil,expiry_status: true)

              if @leave_c_off.c_off_type == "Full Day"
                b.no_of_leave = 1
                b.total_leave = 1
                @leave_c_off.leave_count = 1
                puts @leave_c_off.leave_count
              else
                b.no_of_leave = 0.5
                b.total_leave = 0.5
                @leave_c_off.leave_count = 0.5
                puts @leave_c_off.leave_count
              end
            end
              @c_off.each do |l|
                if l.try(:expiry_date).to_date < Date.today
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
                  @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                  LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                  @employee_leave_balance.save
                else
                  @employee_leave_balance.save
                end
              end
          end
          ActiveRecord::Base.transaction do
            @leave_c_off.save
            @employee_leave_balance.save
            flash[:notice] = "Your C-Off set successfully"
            redirect_to new_leave_c_off_path
          end

        end
        @leave_c_off = LeaveCOff.new
    end
  end

  # PATCH/PUT /leave_c_offs/1
  # PATCH/PUT /leave_c_offs/1.json
  def update
    @leave_c_off.update(leave_c_off_params)
    @leave_c_offs = LeaveCOff.all
    @leave_c_off = LeaveCOff.new
    redirect_to new_leave_c_off_path
  end

  # DELETE /leave_c_offs/1
  # DELETE /leave_c_offs/1.json
  def destroy
    @leave_c_offs = LeaveCOff.all
    leav_category = LeavCategory.find_by_name('Compensatory Off')
    @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id).take
    
    if @leave_c_off.c_off_type == 'Full Day'
      @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f - 1
      @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - 1
    else
      @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f - 0.5
      @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - 0.5
    end
      @leave_c_off.destroy
  end

  def search_by_c_off_date
    reporter(LeaveCOff.filter_records(current_user), template_class: PdfReportTemplate) do
      filter :c_off_date, type: :date
      # column(:Employee_Code, sortable: true) { |leave_c_off| leave_c_off.employee_id }
      column(:Employee_ID, sortable: true) { |leave_c_off| leave_c_off.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |leave_c_off| full_name(leave_c_off.employee) }
      column(:Designation, sortable: true) { |leave_c_off| leave_c_off.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:Date, sortable: true, &:c_off_date)
      column(:Type, sortable: true, &:c_off_type)
      column(:Expire_Day, sortable: true, &:c_off_expire_day)
      column(:Status, sortable: true, &:expiry_status)
      column(:Taken, sortable:true, &:is_taken)
      column(:Expire_Date, sortable:true, &:expiry_date)
      column(:No_OF_COff, sortable:true, &:leave_count)
      column(:Location, sortable: true) { |leave_c_off| leave_c_off.employee.try(:company_location).try(:name) }
      session[:active_tab] ="LeaveManagement"
      session[:active_tab1] ="LeaveReports"
    end
  end

  def add_coff
    @leave_c_off = LeaveCOff.find(params[:id])
    #@leave_c_off = LeaveCOff.find(params['login']['leave_c_off_id'])
    leav_category = LeavCategory.find_by(name: 'Compensatory Off')
    @emp_leav_bal = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id)
    @emp_leav_bal1 = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id).take
  
    @no_of_leav = @emp_leav_bal1.no_of_leave

    if @leave_c_off.c_off_type == 'Full Day'
      @leave_c_off.update(expiry_date: nil,is_expire: nil,leave_count: 1,expiry_status: nil,c_off_expire_day: nil)
      @emp_leav_bal1.update(no_of_leave: @no_of_leav.to_f + 1 )
    elsif @leave_c_off.c_off_type == 'Half Day'
      @leave_c_off.update(expiry_date: nil,is_expire: nil,leave_count: 0.5,expiry_status: nil,c_off_expire_day: nil)
      @emp_leav_bal1.update(no_of_leave: @no_of_leav.to_f + 0.5)
    end
    flash[:notice] = "Created successfully"
    redirect_to new_leave_c_off_path
  end
  # def ajax_show_textbox
  #   # byebug
  #   @value = params[:value]
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leave_c_off
    @leave_c_off = LeaveCOff.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leave_c_off_params
    params.require(:leave_c_off).permit(:is_expire,:employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status, :expiry_date, :leave_count)
  end
end
