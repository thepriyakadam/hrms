class EmployeeWeekOffsController < ApplicationController
  before_action :set_employee_week_off, only: [:show, :edit, :update, :destroy]

  # GET /employee_week_offs
  # GET /employee_week_offs.json
  def index
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  # GET /employee_week_offs/1
  # GET /employee_week_offs/1.json
  def show
  end

  # GET /employee_week_offs/new
  def new
    @employee_week_off = EmployeeWeekOff.new
  end

  # GET /employee_week_offs/1/edit
  def edit
  end

  # POST /employee_week_offs
  # POST /employee_week_offs.json
  def create
    @employee_week_off = EmployeeWeekOff.new(employee_week_off_params)

    respond_to do |format|
      if @employee_week_off.save
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully created.' }
        format.json { render :show, status: :created, location: @employee_week_off }
      else
        format.html { render :new }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_week_offs/1
  # PATCH/PUT /employee_week_offs/1.json
  def update
    respond_to do |format|
      if @employee_week_off.update(employee_week_off_params)
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_week_off }
      else
        format.html { render :edit }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_week_offs/1
  # DELETE /employee_week_offs/1.json
  def destroy
    @employee_week_off.destroy
    respond_to do |format|
      format.html { redirect_to employee_week_offs_url, notice: 'Employee week off was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_week_off_list
    from_date = params[:employee_week_off][:from_date]
    to_date = params[:employee_week_off][:to_date]
    employee = params[:employee_week_off][:employee_id]
    @employee_week_offs = EmployeeWeekOff.where(date: from_date.to_date..to_date.to_date,employee_id: employee)
  end

  def revert_week_off
    @employee_week_off = EmployeeWeekOff.find(params[:format])
    EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @employee_week_off.date).destroy_all
    @employee_week_off.destroy
    flash[:notice] = "Revert successfully"
    redirect_to employee_week_offs_path
  end

  def edit_week_off_modal
    @employee_week_off = EmployeeWeekOff.find(params[:format])
  end

  def edit_week_off
    date = params[:employee_week_off][:date]
    @date = date.to_date
    day = @date.strftime('%a')
    employee_week_off_id = params[:employee_week_off_id]
    @employee_week_off = EmployeeWeekOff.find_by(id: employee_week_off_id)
    @employee_attendance = EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @employee_week_off.date).take
    
      if @employee_week_off.is_present(@date,@employee_week_off.employee_id)
        @emp_atten = EmployeeAttendance.where(employee_id: @employee_week_off.employee_id,day: @date).take
        if @emp_atten.is_confirm == false
          if @emp_atten.employee_leav_request_id == nil && @emp_atten.on_duty_request_id == nil
            @emp_atten.update(present: "W")
            @employee_week_off.update(day: day,date: @date)
            @employee_attendance.destroy
            flash[:notice] = "Updated successfully"
          else
            flash[:alert] = "Attendance Available!"
          end
        else
          flash[:alert] = "Attendance Already Processed!!"
        end
      else
        EmployeeAttendance.create(employee_id: @employee_week_off.employee_id,day: @date,present: "W",department_id: @employee_week_off.try(:employee).try(:department_id)) 
        @employee_week_off.update(day: day,date: @date)
        @employee_attendance.destroy
        flash[:notice] = "Updated successfully"
      end
      redirect_to employee_week_offs_path
  end

  def date_wise_week_off
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  def show_date_wise_weekoff
    @from_date = params[:employee][:from_date]
    @to_date = params[:employee][:to_date]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]

      if current_user.class == Group
        if company == ""
          @employees = Employee.where(status: 'Active').pluck(:id)
          @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
        elsif location == ""
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
        elsif department == ""
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
        end
      elsif current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          if company == ""
            @employees = Employee.where(status: 'Active').pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          elsif location == ""
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          elsif department == ""
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          else
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          end
        elsif current_user.role.name == 'Admin'
          if company == ""
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          elsif location == ""
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          elsif department == ""
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          else
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id) 
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          end
          elsif current_user.role.name == 'Branch'
            if company == "" || location == ""
            @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
           elsif department == ""
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
            else 
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          end
          elsif current_user.role.name == 'HOD'
            if company == "" || location == "" || department == ""
            @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          else 
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            @employee_week_offs = EmployeeWeekOff.where(date: @from_date.to_date..@to_date.to_date,employee_id: @employees)
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      # end#ifnil
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_week_offs/date_wise_weekoff.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_week_off',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_week_offs/date_wise_weekoff.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def revert_selective
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="WeekoffSetup"
  end

  def show_employee_list
    from_date = params[:employee][:from_date]
    to_date = params[:employee][:to_date]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]

    if current_user.class == Group
      if company == ""
        @employees = Employee.where(status: 'Active').pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: false)
      elsif location == ""
        @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
      elsif department == ""
        @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
      else
        @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          @employees = Employee.where(status: 'Active').pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: false)
        elsif location == ""
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        elsif department == ""
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        else
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        end
      elsif current_user.role.name == 'Admin'
        if company == ""
          @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        elsif location == ""
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        elsif department == ""
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        else
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        end
      elsif current_user.role.name == 'Branch'
        if company == "" || location == ""
          @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        elsif department == ""
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        else 
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        end
      elsif current_user.role.name == 'HOD'
        if company == "" || location == "" || department == ""
          @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        else 
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        @employee_week_offs = EmployeeWeekOff.where(employee_id: @employees,date: from_date.to_date..to_date.to_date,is_confirm: nil)
        end
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    
  end#def

  def revert_selective_week_off
    @employee_week_off_ids = params[:employee_week_off_ids]
    if @employee_week_off_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_week_off_ids.each do |eid|
        @emp_week_off = EmployeeWeekOff.find_by_id(eid)
        EmployeeAttendance.where(employee_id: @emp_week_off.employee_id,day: @emp_week_off.date).destroy_all 
        @emp_week_off.destroy
        flash[:notice] = "Revert successfully"
      end
    end
    redirect_to revert_selective_employee_week_offs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_week_off
      @employee_week_off = EmployeeWeekOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_week_off_params
      params.require(:employee_week_off).permit(:week_off_master_id, :employee_id, :day, :date, :status, :is_confirm)
    end
end
