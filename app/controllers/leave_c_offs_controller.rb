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
      elsif current_user.role.name == 'Admin'
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
        leav_category = LeavCategory.find_by_name('C.Off')

        if @leave_c_off.expiry_status == true
          @leave_c_off.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
        else
          # @leave_c_off.expiry_date = nil
        end
        @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)

        if leav_category.nil?
        else
          is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
          if is_exist
            @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take
             @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
             
            if @leave_c_off.c_off_type == 'Full Day'
              @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
              @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
              @leave_c_off.leave_count = 1
              @leave_c_off.is_expire = false
              @leave_c_off.current_status = "FinalApproved"
              @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
              @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)

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
              @leave_c_off.is_expire = false
              @leave_c_off.current_status = "FinalApproved"
              @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
              @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
              
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
          else #is_exist
            @employee_leave_balance = EmployeeLeavBalance.new do |b|
              b.employee_id = @leave_c_off.employee_id
              b.leav_category_id = leav_category.id

              if @leave_c_off.expiry_status == true
                b.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
              else
              end
              
              b.from_date = @leave_c_off.c_off_date
              b.is_active = true
              @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)

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
              @leave_c_off.current_status = "FinalApproved"
                @leave_c_off.is_expire = false
            end #do
              @c_off.each do |l|
                if l.try(:expiry_date).to_date < Date.today
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
                  @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                  LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                  @employee_leave_balance.save
                else
                  @employee_leave_balance.save
                end
              end #do
          end #is_exist

          ActiveRecord::Base.transaction do
            @leave_c_off.save
            @employee_leave_balance.save
            StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @leave_c_off.employee_id,status: "FinalApproved")
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
    #@leave_c_off.update(leave_c_off_params)
    @leave_c_off

    params_employee_id = leave_c_off_params["employee_id"]
    params_c_off_date = leave_c_off_params["c_off_date"]
    params_c_off_type = leave_c_off_params["c_off_type"]
    params_expiry_status = leave_c_off_params["expiry_status"]
    params_c_off_expire_day = leave_c_off_params["c_off_expire_day"]
    expiry_date = @leave_c_off.try(:c_off_date) + @leave_c_off.try(:c_off_expire_day)
    leav_category = LeavCategory.find_by_name('C.Off')
    @employee_leave_balance = EmployeeLeavBalance.where(employee_id: params_employee_id, leav_category_id: leav_category.id).take
   
    if @leave_c_off.c_off_type == params_c_off_type
      @leave_c_off.update(employee_id: params_employee_id,c_off_date: params_c_off_date,c_off_type: params_c_off_type,c_off_expire_day: params_c_off_expire_day,expiry_status: params_expiry_status,is_taken: false,expiry_date: expiry_date,leave_count: @leave_c_off.leave_count,is_expire: nil)
    else
      if params_c_off_type == "Full Day"
        @leave_c_off.update(employee_id: params_employee_id,c_off_date: params_c_off_date,c_off_type: params_c_off_type,c_off_expire_day: params_c_off_expire_day,expiry_status: params_expiry_status,is_taken: false,expiry_date: expiry_date,leave_count: 1,is_expire: nil) 
        @employee_leave_balance.update(total_leave: @employee_leave_balance.total_leave.to_f + 0.5)
        @employee_leave_balance.update(no_of_leave: @employee_leave_balance.no_of_leave.to_f + 0.5)
      else
        @leave_c_off.update(employee_id: params_employee_id,c_off_date: params_c_off_date,c_off_type: params_c_off_type,c_off_expire_day: params_c_off_expire_day,expiry_status: params_expiry_status,is_taken: false,expiry_date: expiry_date,leave_count: 0.5,is_expire: nil)
        @employee_leave_balance.update(total_leave: @employee_leave_balance.total_leave.to_f - 0.5)
        @employee_leave_balance.update(no_of_leave: @employee_leave_balance.no_of_leave.to_f - 0.5)
      end
    end

    @leave_c_offs = LeaveCOff.all
    @leave_c_off = LeaveCOff.new
    redirect_to new_leave_c_off_path
  end

  # DELETE /leave_c_offs/1
  # DELETE /leave_c_offs/1.json
  def destroy
    @leave_c_offs = LeaveCOff.all
    leav_category = LeavCategory.find_by_name('C.Off')
    @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id).take
    
    if @leave_c_off.c_off_type == 'Full Day'
      @employee_leave_balance.update(total_leave: @employee_leave_balance.total_leave.to_f - 1)
      @employee_leave_balance.update(no_of_leave: @employee_leave_balance.no_of_leave.to_f - 1)
    else
      @employee_leave_balance.update(total_leave: @employee_leave_balance.total_leave.to_f - 0.5)
      @employee_leave_balance.update(no_of_leave: @employee_leave_balance.no_of_leave.to_f - 0.5)
    end
      @status_c_off = StatusCOff.find_by(leave_c_off_id: @leave_c_off.id)
      @status_c_off.destroy
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
    leav_category = LeavCategory.find_by(name: 'C.Off')
    @emp_leav_bal = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id)
    @emp_leav_bal1 = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id,leav_category_id: leav_category.id).take
  
    @no_of_leav = @emp_leav_bal1.no_of_leave

    if @leave_c_off.c_off_type == 'Full Day'
      @leave_c_off.update(expiry_date: nil,is_expire: false,leave_count: 1,expiry_status: false,c_off_expire_day: 0)
      @emp_leav_bal1.update(no_of_leave: @no_of_leav.to_f + 1 )
    elsif @leave_c_off.c_off_type == 'Half Day'
      @leave_c_off.update(expiry_date: nil,is_expire: false,leave_count: 0.5,expiry_status: false,c_off_expire_day: 0)
      @emp_leav_bal1.update(no_of_leave: @no_of_leav.to_f + 0.5)
    end
    flash[:notice] = "Created successfully"
    redirect_to new_leave_c_off_path
  end
  # def ajax_show_textbox
  #   # byebug
  #   @value = params[:value]
  # end
  def destroy_self
    @leave_c_off = LeaveCOff.find(params[:format])
    @status_c_off = StatusCOff.where(leave_c_off_id: @leave_c_off)
    @status_c_off.destroy_all
    @leave_c_off.destroy
    flash[:notice] = "Destroyed successfully"
    redirect_to leave_c_off_self_services_path
  end

  def approve_modal
    @leave_c_off = LeaveCOff.find(params[:format])
  end

  def approve_c_off
    @leave_c_off = LeaveCOff.find(params[:leave_c_off_id])
    expiry_status = params[:leave_c_off][:expiry_status]
    @leave_c_off.update(expiry_status: expiry_status)
    c_off_expire_day = params[:leave_c_off][:c_off_expire_day]
    leav_category = LeavCategory.find_by_name('C.Off')
    if @leave_c_off.expiry_status == true
      @expiry_date = @leave_c_off.c_off_date + c_off_expire_day.to_i
    else
      @expiry_date = nil
    end
    #@status_c_off = StatusCOff.find_by(leave_c_off_id: @leave_c_off.id)
    if @leave_c_off.employee.manager_2_id == nil
      @leave_c_off.update(c_off_expire_day: c_off_expire_day,expiry_date: @expiry_date,current_status: "FinalApproved")
      StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FinalApproved") 
      COffMailer.first_approved_without_manager(@leave_c_off).deliver_now 
    else
      @leave_c_off.update(c_off_expire_day: c_off_expire_day,expiry_date: @expiry_date,current_status: "FirstApproved")
      StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FirstApproved")
      COffMailer.first_approved(@leave_c_off).deliver_now
    end

    @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take
    is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
    if is_exist
      @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date,to_date: @leave_c_off.expiry_date)
    else
      EmployeeLeavBalance.create(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id,expiry_date: @leave_c_off.expiry_date,to_date: @leave_c_off.expiry_date,from_date: @leave_c_off.c_off_date,no_of_leave: @leave_c_off.leave_count,total_leave: @leave_c_off.leave_count,is_active: true)
    end
    #@employee_leave_balance.update(to_date: @leave_c_off.expiry_date)


     @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
      @c_off.each do |l|
        if l.try(:expiry_date).to_date < Date.today
          LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
        end
      end

    flash[:notice] = "Approved successfully"
    redirect_to leave_c_off_manager_self_services_path
  end

  def reject_c_off
    @leave_c_off = LeaveCOff.find(params[:format])
    @status_c_off = StatusCOff.find_by(leave_c_off_id: @leave_c_off.id)
    @status_c_off.destroy
    @leave_c_off.destroy
    #StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FirstRejected")
    flash[:notice] = "Rejected successfully"
    COffMailer.first_reject(@leave_c_off).deliver_now
    redirect_to leave_c_off_manager_self_services_path
  end

  def admin_approve_modal
    @leave_c_off = LeaveCOff.find(params[:format])
  end

  def final_approve
    @leave_c_off = LeaveCOff.find(params[:leave_c_off_id])
    leav_category = LeavCategory.find_by_name('C.Off')

    if @leave_c_off.current_status != "FirstApproved"
      expiry_status = params[:leave_c_off][:expiry_status]
      @leave_c_off.update(expiry_status: expiry_status)
      c_off_expire_day = params[:leave_c_off][:c_off_expire_day]
      if @leave_c_off.expiry_status == true
        @expiry_date = @leave_c_off.c_off_date + c_off_expire_day.to_i
      else
        @expiry_date = nil
      end
        @leave_c_off.update(status: true,current_status: "FinalApproved",expiry_date: @expiry_date,c_off_expire_day: c_off_expire_day)
        StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FinalApproved")
    else
        @leave_c_off.update(status: true,current_status: "FinalApproved")
        StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FinalApproved")     
    end#@leave_c_off.current_status != "FirstApproved" 

        is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
        if is_exist
          @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take
           @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
           
          if @leave_c_off.c_off_type == 'Full Day'
            @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
            @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
            @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
            @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)

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
          else #Half Day
            @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 0.5
            @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 0.5
            @leave_c_off.leave_count = 0.5
            @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
            @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
            
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
        else #is_exist
          @employee_leave_balance = EmployeeLeavBalance.new do |b|
            b.employee_id = @leave_c_off.employee_id
            b.leav_category_id = leav_category.id

            if @leave_c_off.expiry_status == true
              b.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
            else
            end
            
            b.from_date = @leave_c_off.c_off_date
            b.is_active = true
            b.to_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day

            @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)

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
          end #do
          @employee_leave_balance.save
            @c_off.each do |l|
              if l.try(:expiry_date).to_date < Date.today
                @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
                @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                @employee_leave_balance.save
              else
                @employee_leave_balance.save
              end
            end #do
        end #is_exist
      flash[:notice] = "Approved successfully"
      COffMailer.final_approved(@leave_c_off).deliver_now
    @emp = Employee.find_by(id: @leave_c_off.employee_id)
    if @emp.manager_2_id == current_user.employee_id
      redirect_to leave_c_off_manager_self_services_path
    else
      redirect_to admin_c_off_approval_leave_c_offs_path
    end
  end

  def final_reject
    @leave_c_off = LeaveCOff.find(params[:format])
    @status_c_off = StatusCOff.where(leave_c_off_id: @leave_c_off.id)
    @status_c_off.destroy_all
    @leave_c_off.destroy
    #StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: current_user.employee_id,status: "FinalRejected")
    flash[:notice] = "Rejected successfully"
    COffMailer.final_reject(@leave_c_off).deliver_now
    redirect_to leave_c_off_manager_self_services_path
  end

  def admin_c_off_approval
    @first_level_request_lists = LeaveCOff.where(is_taken: false,status: false,is_expire: false).where("current_status = ? OR current_status = ?","FirstApproved" , "Pending")
    # @second_level_request_lists = LeaveCOff.where(is_taken: false,status: false,is_expire: false,current_status: "FirstApproved")
  end

  def admin_level_c_off_detail
    @current_request = LeaveCOff.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @leave_c_offs = @employee.leave_c_offs.order("id DESC")
  end

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