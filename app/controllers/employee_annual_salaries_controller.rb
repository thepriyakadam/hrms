class EmployeeAnnualSalariesController < ApplicationController
  def index
  	@salary_components = SalaryComponent.all
  	@employees = Employee.all
  end

  def create
  	p "------------------------------------------------"
  	@item = params["employee_annual_salary_data"]
  	@employee_ids = params["employee_ids"]
  	ActiveRecord::Base.transaction do
	  	@employee_ids.each do |id|
		  	@item.each do |k,v|
		  		EmployeeAnnualSalary.new do |e|
		  			e.employee_id = id
		  			e.salary_component_id = k
		  			e.amount = v
		  			e.save
		  		end
		  	end
		  end
		end  	
  	flash[:alert] = "This is under construction."
  	redirect_to employee_annual_salaries_path
  end
end
