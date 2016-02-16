class EmployeeTemplatesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def template_list
    @employee = Employee.find(params[:id])
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
