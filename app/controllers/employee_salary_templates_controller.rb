class EmployeeSalaryTemplatesController < ApplicationController
  def index
  end

  def find_employee_for_assign_template
  	@employee = Employee.find_by_manual_employee_code(params[:employee_code]) 
    respond_to do |format|
      if @employee.nil?
        format.js { @flag = true }
      else
        format.js { @flag = false }
      end
    end
  end

  def find_template
  	@salary_template = SalaryTemplate.find(params[:id])
  	@employee_salary_templates = @salary_template.salary_component_templates
  end
end
