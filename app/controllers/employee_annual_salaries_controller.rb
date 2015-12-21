class EmployeeAnnualSalariesController < ApplicationController
  def index
  	@salary_components = SalaryComponent.all
  end

  def create
  	p "------------------------------------------------"
  	flash[:alert] = "This is under construction."
  	redirect_to employee_annual_salaries_path
  end
end
