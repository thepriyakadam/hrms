require 'query_report/helper'  # need to require the helper
class EmployeeTemplatesController < ApplicationController
  load_and_authorize_resource except: [:template_list]
  include QueryReport::Helper  # need to include it
  def index
    if current_user.class == Group
      @employees = Employee.all
    else
      if current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salarymaster"
  end

  def show
  end
  
  def template_list
    @employee = Employee.find(params[:format])
    @employee_templates = @employee.employee_templates
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
    else
      if current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salarymaster"
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
      column(:Emploee_name, sortable: true) { |employee_template| full_name(employee_template.employee) }
      column(:Template, sortable: true) { |employee_template| employee_template.salary_template.code }
      column(:start_date, sortable: true) { |employee_template| employee_template.start_date }
      column(:end_date, sortable: true) { |employee_template| employee_template.end_date }
      column(:created_at, sortable: true) { |employee_template| employee_template.created_at.to_date }
      column(:updated_at, sortable: true) { |employee_template| employee_template.updated_at.to_date }
    end
  def revert_salary_template
    @employee = Employee.find(params[:employee_id])
    @salary_template = SalaryTemplate.find(params[:salary_template_id])
    EmployeeTemplate.where(employee_id: @employee.id,salary_template_id: @salary_template.id).destroy_all
    EmployeeSalaryTemplate.where(employee_id: @employee.id,salary_template_id: @salary_template.id).destroy_all
    # @emp_template = EmployeeTemplate.find_by(employee_id: @employee.id).last
    flash[:notice] = 'Employee Template was Reverted Successfully.'
    redirect_to employee_templates_path
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
end
