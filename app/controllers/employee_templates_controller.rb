require 'query_report/helper'  # need to require the helper
class EmployeeTemplatesController < ApplicationController
  load_and_authorize_resource except: [:template_list]
  include QueryReport::Helper  # need to include it
  def index
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
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="SalarySetup"
  end

  def show
  end
 
  def template_list
    @employee = Employee.find(params[:format])
    @employee_templates = @employee.employee_templates
    @template = EmployeeTemplate.where(employee_id: @employee.id)
    @salaryslip_component = SalaryslipComponent.all
    #@temp = @template.last
  end

  def activate
    if params[:activate][:activate_date] == ''
      flash[:alert] = 'Please specify date.'
      redirect_to template_list_employee_templates_path(format: params[:activate][:employee_id])
    else
      @employee_template = EmployeeTemplate.find(params[:activate][:id])
      @employee = @employee_template.employee
      @pre_employee_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
      ActiveRecord::Base.transaction do
        @pre_employee_template.update(is_active: false, end_date: params[:activate][:activate_date])
        @employee_template.update(is_active: true, start_date: params[:activate][:activate_date])
      end
      @employee_templates = @employee.employee_templates
      flash[:notice] = 'Template Activated...'
      redirect_to template_list_employee_templates_path(format: @employee.id)
    end
  end

  def deactivate
  end

  def fresh_template
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
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="SalarySetup"
  end

  def fresh
    @employee = Employee.find(params[:format])
  end

  def assign_new_template
    @employee_id = params[:employee_id]
    if params[:id] == ''
      @flag = false
    else
      @salary_template = SalaryTemplate.find(params[:salary_template_id])
      unless @salary_template.nil?
        @employee_salary_templates = @salary_template.salary_component_templates
        @flag = true
      end
    end
  end
  def template_salary
    reporter(EmployeeTemplate.filter_records(current_user), template_class: PdfReportTemplate) do
      filter :start_date, type: :date
      column(:Employee_ID, sortable: true) { |employee_template| employee_template.employee.try(:manual_employee_code) }
      column(:Employee_name, sortable: true) { |employee_template| full_name(employee_template.employee) }
      column(:Category, sortable: true) { |employee_template| employee_template.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:Template, sortable: true) { |employee_template| employee_template.salary_template.code }
      column(:start_date, sortable: true) { |employee_template| employee_template.start_date }
      column(:end_date, sortable: true) { |employee_template| employee_template.end_date }
      column(:created_at, sortable: true) { |employee_template| employee_template.created_at.to_date }
      column(:updated_at, sortable: true) { |employee_template| employee_template.updated_at.to_date }
    end
  end

  def revert_salary_template
    @employee = Employee.find(params[:employee_id])
    @salary_template = SalaryTemplate.find(params[:salary_template_id])
    @employee_template = EmployeeTemplate.find(params[:employee_template_id])
    
    # if @c1=EmployeeTemplate.where(employee_id: @employee.id).pluck(:is_active).last == true
       #EmployeeTemplate.where(employee_id: @employee.id).update_all(end_date: nil,is_active: true)
      # @emp_temp = EmployeeTemplate.where(employee_id: @employee.id).last
      # @emp_temp.update(end_date: nil,is_active: true)
    #end
    @a1 = EmployeeTemplate.where(employee_id: @employee.id,id: @employee_template.id).last
      if @a1.is_active == true
        @a1.destroy
        @emp_temp = EmployeeTemplate.where(employee_id: @employee.id).last
        @emp_temp.update(end_date: nil,is_active: true)

        EmployeeSalaryTemplate.where(employee_id: @employee.id,employee_template_id: @employee_template.id).destroy_all
      end
    flash[:notice] = 'Employee Template was Reverted Successfully.'
    redirect_to template_list_employee_templates_path(format: @employee.id)
  end

  def cancel_salary_template
    @employee = Employee.find(params[:employee_id])
    @employee_template = EmployeeTemplate.find(params[:employee_template_id])
    EmployeeTemplate.where(id: @employee_template.id).destroy_all
    EmployeeSalaryTemplate.where(employee_template_id: @employee_template.id,employee_id: @employee.id).destroy_all
    flash[:notice] = 'Employee Template was Cancelled Successfully.'
    redirect_to template_list_employee_templates_path(@employee.id)
  end

  def create_fresh_template
    arrays = params[:is_deducted].keys
    @employee_id = params[:employee][:employee_id]
    @template_id = params[:template][:template_id]

    @previous_employee_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee_id, true).take
    if @previous_employee_template.nil?
      @employee_template = EmployeeTemplate.create_object(@employee_id, @template_id)
      @employee_template = EmployeeTemplate.build_objects(arrays, params, @employee_id, @template_id, @employee_template)

      if @employee_template.save
        flash[:notice] = 'Employee template created successfully.'
        redirect_to template_list_employee_templates_path(@employee_id)
      else
        flash[:alert] = 'Employee template not created successfully.'
        redirect_to template_list_employee_templates_path(@employee_id)
      end
    else
      flash[:alert] = 'Same template already assigned.'
      redirect_to template_list_employee_templates_path(@employee_id)
    end
  end

  def active_list
    if current_user.class == Group
      @employee_templates = EmployeeTemplate.where(is_active: true)
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employee_templates = EmployeeTemplate.where(is_active: true)
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @employee_templates = EmployeeTemplate.where(is_active: true,employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_templates = EmployeeTemplate.where(is_active: true,employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @employee_templates = EmployeeTemplate.where(is_active: true,employee_id: @employees)
      else current_user.role.name == 'Employee'
         @employee_templates = EmployeeTemplate.where(is_active: true,employee_id: current_user.employee_id)
      end
    end
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def show_employee_record
    #employee_template_id = params[:employee_templates][:employee_template_id]
    @employee_template_ids = params[:employee_template_ids]
    if @employee_template_ids.nil?
      flash[:alert] = "Please Select the checkbox"
      @employee_salary_templates = []
      redirect_to show_employee_record_employee_templates_path
    else
      # @employee_salary_templates = []
      # @employee_template_ids.each do |eid|
      #   @employee_salary_templates = EmployeeSalaryTemplate.where(employee_template_id: eid)
      #    @employee_salary_templates.each do |g|
      #   @employee_salary_templates = EmployeeSalaryTemplate.where(id: g.id)
      #   @employee_salary_templates << @employee_salary_template
      #   end  
      # end
    end
  end

  def salary_breakup_pdf
    @employee_template_ids = params[:employee_template_ids]
    @employee_template_ids.each do |e|
      @employee_template = EmployeeTemplate.find_by(id: e)
      @employee_salary_templates = EmployeeSalaryTemplate.where(employee_template_id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee_template',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_templates/salary_breakup.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
  end

  def salary_breakup_xls
    @employee_template_ids = params[:employee_template_ids]
      @employee_template_ids.each do |e|
        @employee_template = EmployeeTemplate.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employee_templates/salary_breakup.xls.erb'}
    end
  end

  def employee_wise_breakup
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def salary_employee_wise
    @employee = Employee.find(params[:salary][:employee_id])
    @employee_templates = EmployeeTemplate.where(employee_id: @employee.id)
    @employee_templates.each do |t|
      @employee_salary_templates = EmployeeSalaryTemplate.where(employee_template_id: t)
      @employee_salary_templates.each do |s|
        @employee_salary_template = EmployeeSalaryTemplate.find_by(id: s)
      end
    end
  end

  def employee_wise_pdf
    @employee = Employee.find(params[:employee_id])
    @employee_templates = EmployeeTemplate.where(employee_id: @employee.id)
    @employee_templates.each do |t|
      @employee_salary_templates = EmployeeSalaryTemplate.where(employee_template_id: t)
      @employee_salary_templates.each do |s|
        @employee_salary_template = EmployeeSalaryTemplate.find_by(id: s)
      end
    end
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee.id)
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee_template',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_templates/employee_wise_salary.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
  end

  def employee_wise_xls
     @employee = Employee.find(params[:employee_id])
    @employee_templates = EmployeeTemplate.where(employee_id: @employee.id)
    @employee_templates.each do |t|
      @employee_salary_templates = EmployeeSalaryTemplate.where(employee_template_id: t)
      @employee_salary_templates.each do |s|
        @employee_salary_template = EmployeeSalaryTemplate.find_by(id: s)
      end
    end
    respond_to do |format|
      format.xls {render template: 'employee_templates/employee_wise_salary.xls.erb'}
    end
  end

  

end