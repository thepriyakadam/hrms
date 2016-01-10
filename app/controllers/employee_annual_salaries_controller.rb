class EmployeeAnnualSalariesController < ApplicationController
  def index
    @salary_components = SalaryComponent.all
  	# @deducted_salary_components = SalaryComponent.deducted
    # @addected_salary_components = SalaryComponent.addected
  	# @employees = Employee.joins("left join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id where employee_annual_salaries.employee_id is null")
    @employee_annual_salaries = EmployeeAnnualSalary.all
  end

  def new
    @employee_annual_salary = EmployeeAnnualSalary.new
    @salary_component = SalaryComponent.find(params[:id])
  end

  def create
  	@employee_annual_salary = EmployeeAnnualSalary.new(employee_annual_salary_params) 
    if @employee_annual_salary.save
      @employee_annual_salaries = EmployeeAnnualSalary.all
      flash[:notice] = "Salary Data Added Successfully."
      @flag = true
    else
      flash[:alert] = "Salary Data Not Added Successfully."
      @flag = false
    end
  end

  def created_employee_annual_salary
    @employees = Employee.joins("inner join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id").uniq
  end

  def employee_annual_salary_slip
    @employee = Employee.find(params[:format])
    @items = @employee.employee_annual_salaries
  end

  def all_employee_monthly_salary
    @deducted_salary_components = SalaryComponent.deducted
    @addected_salary_components = SalaryComponent.addected
    @all_employee_annual_salaries = EmployeeAnnualSalary.all
    @employees = Employee.joins("inner join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id").uniq
  end

  private

  def set_employee_annual_salary
    @employee_annual_salary = EmployeeAnnualSalary.find(params[:id])
  end

  def employee_annual_salary_params
    params.require(:employee_annual_salary).permit(:employee_id,:salary_component_id,:percentage,:parent_salary_component_id,:is_deducted,:to_be_paid,:max_amount,:monthly_amount,:annual_amount,:is_taxable,:tax,:base)
  end
end