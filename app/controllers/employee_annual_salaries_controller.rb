class EmployeeAnnualSalariesController < ApplicationController
  def index
  	@deducted_salary_components = SalaryComponent.deducted
    @addected_salary_components = SalaryComponent.addected
  	@employees = Employee.joins("left join employee_annual_salaries on employees.id = employee_annual_salaries.employee_id where employee_annual_salaries.employee_id is null")

  end

  def create
  	@items = params["employee_annual_salary_data"]
  	@employee_ids = params["employee_ids"]
    @deducted_salary_components = SalaryComponent.deducted
    @addected_salary_components = SalaryComponent.addected
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
              #SalaryComponent.find()
              e.employee_id = id
              e.salary_component_id = k
              e.amount = v
              e.parent_salary_component_id = 
              e.save
            end
          end
        end
      end
      flash[:alert] = "This is under construction."
      redirect_to employee_annual_salaries_path
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
end
