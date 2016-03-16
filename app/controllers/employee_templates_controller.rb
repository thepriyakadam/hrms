class EmployeeTemplatesController < ApplicationController
  load_and_authorize_resource except: [:template_list]
  def index
    if current_user.class == Group
      @employees = Employee.all
    else
      if current_user.role.name == "Company"
        @employees = Employee.all
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == "Employee"
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
  end

  def template_list
    @employee = Employee.find(params[:format])
    @employee_templates = @employee.employee_templates
  end

  def activate
    @employee_template = EmployeeTemplate.find(params[:id])
    @employee = @employee_template.employee
    @pre_employee_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee.id, true).take
    ActiveRecord::Base.transaction do
      @pre_employee_template.update(is_active: false, end_date: Date.today)
      @employee_template.update(is_active: true, start_date: Date.today)
    end
    @employee_templates = @employee.employee_templates
  end

  def deactivate
    
  end

  def fresh_template
    if current_user.class == Group
      @employees = Employee.all
    else
      if current_user.role.name == "Company"
        @employees = Employee.all
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == "Employee"
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
  end

  def fresh
    @employee = Employee.find(params[:format])
  end

  def assign_new_template
    @employee_id = params[:employee_id]
    unless params[:id] == ""
      @salary_template = SalaryTemplate.find(params[:salary_template_id])
      unless @salary_template.nil?
        @employee_salary_templates = @salary_template.salary_component_templates
        @flag = true
      end
    else
      @flag = false
    end
  end

  def create_fresh_template
    arrays = params[:is_deducted].keys
    @employee_id = params[:employee][:employee_id]
    @template_id = params[:template][:template_id]
    
    @previous_employee_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee_id,true).take
    if @previous_employee_template.nil?
      @employee_template = EmployeeTemplate.create_object(@employee_id, @template_id)
      @employee_template = EmployeeTemplate.build_objects(arrays,params,@employee_id, @template_id, @employee_template)
      
      if @employee_template.save
        flash[:notice] = "Employee template created successfully."
        redirect_to show_employee_salary_template_employee_salary_templates_path(@employee_id)
      else
        flash[:alert] = "Employee template not created successfully."
        redirect_to template_list_employee_templates_path(@employee_id)
      end
    else
      flash[:alert] = "Same template already assigned."   
      redirect_to template_list_employee_templates_path(@employee_id)
    end
  end
end
