class EmployeeAnnualSalariesController < ApplicationController
  def index
  	@deducted_salary_components = SalaryComponent.deducted
    @addected_salary_components = SalaryComponent.addected
  	@employees = Employee.joins("left join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id where employee_annual_salaries.employee_id is null")

  end

  def create
  	@items = params["employee_annual_salary_data"]
  	@employee_ids = params["employee_ids"]
    @salary_components = SalaryComponent.all
    @employees = Employee.joins("left join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id where employee_annual_salaries.employee_id is null")
    flag = false
    @items.each do |k,v|
      if v == ""
        flag = true
      end
    end
    if flag
      flash.now[:alert] = "All fields are mandatory."
      render :index
    elsif @employee_ids.nil?
      flash.now[:alert] = "Please select employee."
      render :index
    else
      ActiveRecord::Base.transaction do
        @employee_ids.try(:each) do |id|
          @items.each do |k,v|
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
end
