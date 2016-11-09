class EmployeeSalaryTemplatesController < ApplicationController
  load_and_authorize_resource except: [:salary_template, :find_template, :show_employee_salary_template]
  def index
  end

  def edit
    @employee_salary_template = EmployeeSalaryTemplate.find(params[:id])
  end

  def update
    @employee_salary_template = EmployeeSalaryTemplate.find(params[:id])
    @employee_salary_template.update(employee_salary_template_params)
    flash[:notice] = 'Amount updated successfully.'
    redirect_to fresh_template_employee_templates_path
  end

  def find_employee_for_assign_template
    @employee = Employee.find_by_manual_employee_code(params[:employee_code])
    respond_to do |format|
      if @employee.nil?
        format.js { @flag = true }
      else
        @employee_id = @employee.id
        format.js { @flag = false }
      end
    end
  end

  def find_template
    @employee_id = params[:employee_id]
    if params[:id] == ''
      @flag = false
    else
      @current_employee_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', params[:employee_id], true).take
      @current_salary_components = @current_employee_template.employee_salary_templates unless @current_employee_template.nil?
      @salary_template = SalaryTemplate.find(params[:id])
      unless @salary_template.nil?
        @employee_salary_templates = @salary_template.salary_component_templates
        @flag = true
      end
    end
  end

  def show_employee_list
    @employees = Employee.all
  end

  def show_employee_salary_template
    @employee = Employee.find(params[:emp_id])
    @salary_template = SalaryTemplate.find(params[:salary_template_id])
    authorize! :show, @current_template
    @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee.id,salary_template_id: @salary_template.id)
  end

  def current_template
    @current_template = EmployeeTemplate.where(employee_id: params[:emp_id], is_active: true).take
    authorize! :show, @current_template
    @employee_salary_templates = @current_template.employee_salary_templates

  end

  def show_employee_salary_slip
    @current_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', params[:format], true).take
    @employee_salary_templates = @current_template.employee_salary_templates
  end

  def create_employee_template
    arrays = params[:is_deducted].keys
    @employee_id = params[:employee][:employee_id]
    @template_id = params[:template][:template_id]
    @previous_employee_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee_id, true).take
    if params[:increement][:date] == ''
      flash[:alert] = 'Please specify date.'
      redirect_to new_employee_salary_template_path(id: @employee_id)
    elsif @previous_employee_template.nil?
      @employee_template = EmployeeTemplate.create_object(@employee_id, @template_id)
      @employee_template = EmployeeTemplate.build_objects(arrays, params, @employee_id, @template_id, @employee_template)
      if @employee_template.save
        flash[:notice] = 'Employee template created successfully.'
      else
        flash[:alert] = 'Employee template not created successfully.'
      end
      redirect_to template_list_employee_templates_path(@employee_id)
    else
      ActiveRecord::Base.transaction do
        # arrears_array = params[:old_salary_component_id].keys
        increement_date = params[:increement][:date]
        @employee_template = EmployeeTemplate.create_new_object(@employee_id, @template_id)
        @employee_template = EmployeeTemplate.build_objects(arrays, params, @employee_id, @template_id, @employee_template)

        @employee_arrear = EmployeeArrear.create_object(@employee_id, increement_date)
        @employee_arrear = EmployeeArrear.build_objects(arrears_array, params, @employee_arrear)
        if @employee_arrear.save
          @employee_template.save
          flash[:notice] = 'Employee template created successfully.'
        else
          flash[:alert] = 'Same template cannot assigned.'
        end
      end  
      redirect_to template_list_employee_templates_path(@employee_id)
    end
  end

  def salary_template
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryprocess"
  end

  def find_employee_for_salary
    @addable_salary_items = nil
    @month = params['month']
    @year = params['year']
    @instalment_array = []
    @employee = Employee.find_by_manual_employee_code(params[:employee_code])

    if @employee.nil?
      @flag = false
    else
      authorize! :show, @employee
      @record = Salaryslip.where('month = ? and year = ? and employee_id = ?', params['month'], params['year'], @employee.id).take
      if @record.nil?
        @current_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
        unless @current_template.nil?
          #@addable_salary_items = @current_template.employee_salary_templates.where('is_deducted = ?', false)
          @addable_salary_items = EmployeeSalaryTemplate.where(employee_template_id: @current_template.id, is_deducted: false)
          unless params['month'].nil? && params['year'].nil?
            @working_day = Workingday.where('employee_id = ? and month_name = ? and year = ?', @employee.id, params['month'], params['year']).take
          end
          @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
          @advance_salaries.try(:each) do |a|
            @instalments = a.instalments
            @instalments.try(:each) do |i|
              unless i.instalment_date.nil?
                if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
                  @instalment_array << i
                end # date
              end # instalment nil
            end # instalment each
          end # advance salaries loop
        end # template nil
      end # record nil
      @arrear_items = nil
      @arrear = EmployeeArrear.where('employee_id = ? and is_paid = ?', @employee.id, false).take
      unless @arrear.nil?
        arrear_start_date = @arrear.start_date
        arrear_start_month = arrear_start_date.strftime('%-m').to_i
        arrear_start_year = arrear_start_date.strftime('%Y').to_i
        arrear_end_month = Workingday.months[@month]
        arrear_end_year = params['year'].to_i

        arrear_working_days = Workingday.where(employee_id: @employee.id, month_name: arrear_start_month..arrear_end_month, year: arrear_start_year..arrear_end_year)
        @total_payable_days = arrear_working_days.sum('payable_day')
        @arrear_items = @arrear.employee_arrear_items
      end
      @flag = true
    end
  end

  def is_confirm_employee_template
    # @employee = Employee.find(params[:id])
     @template_ids = params[:template_ids]
    if @template_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to fresh_template_employee_templates_path
      # redirect_to show_employee_salary_template_employee_salary_templates_path(id: @employee.id)
    else
      @template_ids.each do |did|
        @employee_salary_template = EmployeeSalaryTemplate.find(did)
        @employee_salary_template.update(is_confirm: true) 
        # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
        flash[:notice] = "Confirmed Successfully" 
      end 
      redirect_to fresh_template_employee_templates_path
      # redirect_to show_employee_salary_template_employee_salary_templates_path(id: @employee.id)
    end
  end
 
  def modal
  end

  def new
    @employee = Employee.find(params[:id])
    @employee_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
  end

  private

  def employee_salary_template_params
    params.require(:employee_salary_template).permit(:monthly_amount, :annual_amount , :is_confirm)
  end
end
