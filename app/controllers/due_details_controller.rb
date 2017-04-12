class DueDetailsController < ApplicationController
  before_action :set_due_detail, only: [:show, :edit, :update, :destroy]

  # GET /due_details
  # GET /due_details.json
  def index
    @due_details = DueDetail.all
  end

  # GET /due_details/1
  # GET /due_details/1.json
  def show
  end

  # GET /due_details/new
  def new
    @due_detail = DueDetail.new
    @due_template = DueTemplate.find(params[:due_template_id])
    @due_details = DueDetail.where(due_template_id: @due_template.id)
    # redirect_to new_due_detail_path  
  end


  # GET /due_details/1/edit
  def edit
  end

  def create
    @due_detail = DueDetail.new(due_detail_params)
    @due_details = DueDetail.all
    if @due_detail.save
      @due_detail = DueDetail.new
    end
    @due_template_id = DueTemplate.find(params[:due_detail][:due_template_id])
    flash[:notice] = 'Due Detail created Successfully.'   
    redirect_to new_due_detail_path(due_template_id: @due_template_id.id)
  end

  def update
    @due_detail.update(due_detail_params)
    @due_details = DueDetail.all
    @due_detail = DueDetail.new
    redirect_to new_due_detail_path
    flash[:notice] = 'Due Detail updated Successfully.'   
  end

  def destroy
    @due_detail.destroy
    @due_details = DueDetail.all
  end

  def all_employee_resignation_list
    @employee_resignations = EmployeeResignation.all
    session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  def is_confirm
    @due_detail_ids = params[:due_detail_ids]
    if @due_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to root_url
    else
      @due_detail_ids.each do |did|
      @due_detail = DueDetail.find(did)
      @due_detail.update(is_confirmed: true) 
      flash[:notice] = "Confirmed Successfully"
    end 
     redirect_to root_url
  end
  end

  def due_detail_history
     @due_details = DueDetail.where(reporting_master_id: current_user.employee_id,is_confirmed: true)
  end

  def show_due_template_list
     @due_template = DueTemplate.find(params[:due_template_id])
     @due_templates = DueTemplate.where(id: @due_template.id)
     @due_details = DueDetail.where(due_template_id: @due_template.id)
  end

  def all_due_template
     # @employee_resignation = EmployeeResignation.find(params[:format])
     # @employee = Employee.find(@employee_resignation.employee_id)
     @employee = Employee.find(params[:emp_id])
     @employees = Employee.where(id: @employee.id)
  end

  def create_due_employee_detail
    # @due_employee_detail = DueEmployeeDetail.new(due_employee_detail_params)
    # byebug
    @emp = params[:due_employee_detail][:employee_id]
    @due_template = params[:due_template_id][:hhh]
    # byebug
    # @employee = Employee.find(params[:emp_id])
    # @due_employee_detail.save
    @due_detail_ids = params[:due_detail_ids]
    if @due_detail_ids.nil?
       flash[:alert] = "Please Select the Checkbox"
    else
      @due_detail_ids.each do |did|
       due_det = DueDetail.where(id: did)
       due_det.each do |dd|
       DueEmployeeDetail.create(due_detail_id: dd.id,reporting_master_id: dd.reporting_master_id,employee_id: @emp,due_template_id: @due_template,is_proceed: true)
      # DueEmployeeDetail.create(due_detail_id: dd.id,reporting_master_id: dd.reporting_master_id,employee_id: @emp,due_template_id: @due_template,is_confirmed: true)
      # DueEmployeeDetail.create(due_detail_id: dd.id,reporting_master_id: dd.reporting_master_id,employee_id: @emp,due_template_id: @due_template)

      # DueEmployeeDetail.create(reporting_master_id: did,employee_id: @employee.id,due_template_id: @due_template,is_confirmed: true)
      flash[:notice] = "Created Successfully & Request Also Sent to the Selected Due Owner."
      end
    end
  end
    # redirect_to all_employee_resignation_list_due_details_path
    redirect_to all_employee_list_due_details_path
  end


  def emis_confirm_employee_dueployee_due_detail_history
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @due_employee_details = DueEmployeeDetail.where(reporting_master_id: @reporting_masters,is_confirmed: true)
    session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  def employee_due_detail_history
    # byebug
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    # @due_employee_details = DueEmployeeDetail.where(reporting_master_id: @reporting_masters)
    @due_employee_details = DueEmployeeDetail.where(reporting_master_id: @reporting_masters,is_proceed: true)
    session[:active_tab] = "employee_resignation"
    session[:active_tab1] ="no_due_mgmt"
  end

  def all_employee_list
     @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved").pluck(:employee_id)
     @employees = Employee.where(id: @employee_resignations,status: "Inactive")
     session[:active_tab] = "employee_resignation"
    session[:active_tab1] ="no_due_mgmt"
  end

  def all_employee_due_detail
     @due_employee_details = DueEmployeeDetail.where(is_confirmed: false)
     session[:active_tab] = "resignationmanagement"
     session[:active_tab1] ="no_due_mgmt"
  end

  def is_confirm_employee_due
     @due_employee_detail_ids = params[:due_employee_detail_ids]
    if @due_employee_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to root_url
    else
      @due_employee_detail_ids.each do |did|
        @due_employee_detail = DueEmployeeDetail.find(did)
        @due_employee_detail.update(is_confirmed: true) 
        # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
        flash[:notice] = "Confirmed Successfully"
      end
      redirect_to root_url
    end
  end

  def due_employee_detail_list
     # @due_employee_details = DueEmployeeDetail.where(is_confirmed: true)
     # @employee_resignation = EmployeeResignation.find(params[:format])
     # @employee = Employee.find(@employee_resignation.employee_id)
     @employee = Employee.find(params[:emp_id])

     # @due_employee_details = DueEmployeeDetail.where(employee_id: @employee.id,is_confirmed: true)
     # @due_employee_details_1 = DueEmployeeDetail.where(employee_id: @employee.id,is_confirmed: true).pluck(:id)

     @due_employee_details = DueEmployeeDetail.where(employee_id: @employee.id,is_proceed: true)
     @due_employee_details_1 = DueEmployeeDetail.where(employee_id: @employee.id,is_proceed: true).pluck(:id)
     @due_actions = DueAction.where(due_employee_detail_id: @due_employee_details_1)
  end

  # def due_action_list
  #   @due_employee_detail = DueEmployeeDetail.find(params[:format])
  #   @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
  # end


  def emp_resignation
    @employee_resignations = EmployeeResignation.all
    redirect_to new_due_detail_path(due_template_id: @due_template_id.id)
  end

   def modal
    @due_detail = DueDetail.find(params[:format])
    # redirect_to new_due_detail_path  
  end

  def specific_due_action_list
    @due_employee_detail = DueEmployeeDetail.find(params[:format])
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
  end

  # def emp_resignation_list
  #   @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved").pluck(:employee_id)
  #   @employees = Employee.where(id: @employee_resignations,status: "Inactive")
  #   session[:active_tab] = "employee_resignation"
  #   session[:active_tab1] ="no_due_mgmt"
  # end


  def emp_resignation_list
    @employee_resignations = EmployeeResignation.where(resign_status: "FinalApproved").pluck(:employee_id)
    @due_employee_details = DueEmployeeDetail.where(employee_id: @employee_resignations,is_confirmed: true).pluck(:employee_id)
    @employees = Employee.where(id: @due_employee_details)
    session[:active_tab] = "employee_resignation"
    session[:active_tab1] ="full_and_final"
  end

  def due_clearence_list
     @employee = Employee.find(params[:emp_id])
     @due_employee_details = DueEmployeeDetail.where(employee_id: @employee.id,is_confirmed: true)
     @due_employee_details_1 = DueEmployeeDetail.where(employee_id: @employee.id,is_confirmed: true).pluck(:id)
     @due_actions = DueAction.where(due_employee_detail_id: @due_employee_details_1,is_confirm: true)
     @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
     # byebug
     @leav_category = LeavCategory.where(is_active: true,is_cashable: true).pluck(:id)
     @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employee.id,leav_category_id: @leav_category,is_active: true)
     @workingdays = Workingday.where(employee_id: @employee.id,full_and_final: true)
     @workingdays_1 = Workingday.where(employee_id: @employee.id,full_and_final: true).pluck(:id)
     @salaryslips = Salaryslip.where(workingday_id: @workingdays_1)

     @gratuities = Gratuity.where(employee_id: @employee.id)

    #  @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee.id)
    #  @leave_cash_masters = LeaveCashMaster.where(is_active: true)
    #  # @day_in_month =  @leave_cashable.date.end_of_month.day
    #  day_in_month = Date.today.end_of_month.day
    #  sum = @employee_leav_balances.sum(:no_of_leave)
    #  @employee_salary_templates.try(:each) do |est|
    #  @leave_cash_masters.try(:each) do |lcm|
    #     formula_string = lcm.base_component.split(',').map {|i| i.to_i}
    #     @employee_templates = EmployeeTemplate.where(employee_id: @employee.id,is_active: true).take
    #     formula_item = EmployeeSalaryTemplate.where(salary_component_id: formula_string,employee_id: @employee.id,employee_template_id: @employee_templates.id)  
    #     @total = formula_item.sum(:monthly_amount)
    #     # byebug
    #     # formula_item_monthly_amount = ( @total.to_f / @day_in_month.to_i * lcm.rate.to_f ) * @leave_cashable.cashable.to_f
    #     formula_item_monthly_amount = ( @total.to_f / day_in_month.to_i * lcm.rate.to_f ) * sum.to_i
    #     # LeaveCashable.where(id: @leave_cashable.id).update_all(amount: formula_item_monthly_amount)
    #   end
    # end
     #  # byebug
     #  formula_item_monthly_amount_1 = formula_item_monthly_amount.map {|i| i.to_i}

     session[:active_tab] = "employee_resignation"
     session[:active_tab1] ="full_and_final"
  end



  def emp_salary_list
     @workingday = Workingday.find(params[:format])
     @employees = Employee.where(id: @workingday.employee_id)

  end

  def show_full_and_final_employee
    @month = params[:month]
    @year = params[:year]
    # byebug
    @workingdays = Workingday.where(month_name: @month, year: @year,full_and_final: true).pluck(:employee_id)
    @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    emp_ids = @workingdays - @salaryslips
    if current_user.class == Group
      @employees = Employee.where(id: emp_ids)  
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.where(id: emp_ids)
      elsif current_user.role.name == "Admin"
        company_employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        new_ids = company_employees & emp_ids
        @employees = Employee.where(id: new_ids)
      elsif current_user.role.name == "Branch"
        location_employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        new_ids = location_employees & emp_ids
        @employees = Employee.where(id: new_ids)
      elsif current_user.role.name == "HOD"
        department_employees = Employee.where(department_id: current_user.company_location_id)
        new_ids = department_employees & emp_ids
        @employees = Employee.where(id: new_ids)
      end
    end
  end

  def full_and_final_settlement
     session[:active_tab] = "employee_resignation"
     session[:active_tab1] ="full_and_final"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_detail
      @due_detail = DueDetail.find(params[:id])
    end
    
    def due_employee_detail_params
      params.require(:due_employee_detail).permit(:employee_id, :due_template_id, :due_employee_template_id, :due_detail_id,:reporting_master_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_detail_params
      params.require(:due_detail).permit(:reporting_master_id, :due_employee_template_id, :status, :due_template_id)
    end
end