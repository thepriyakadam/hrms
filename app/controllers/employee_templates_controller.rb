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
end
