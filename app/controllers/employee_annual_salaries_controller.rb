class EmployeeAnnualSalariesController < ApplicationController
  def index
  	@salary_components = SalaryComponent.all
  	@employees = Employee.all
  end

  def create
  	@items = params["employee_annual_salary_data"]
  	@employee_ids = params["employee_ids"]
    
    flag = false
    @items.each do |k,v|
      if v == ""
        flag = true
      end
    end

    if flag
      @salary_components = SalaryComponent.all
      @employees = Employee.all
      flash.now[:alert] = "All fields are mandotory."
      render :index
    elsif @employee_ids.nil?
      @salary_components = SalaryComponent.all
      @employees = Employee.all
      flash.now[:alert] = "Please select employee."
      render :index
    else
      p "data savedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
      redirect_to employee_annual_salaries_path
    end

    
  # 	ActiveRecord::Base.transaction do
	 #  	@employee_ids.try(:each) do |id|
		#   	@item.each do |k,v|
		#   		EmployeeAnnualSalary.new do |e|
		#   			e.employee_id = id
		#   			e.salary_component_id = k
		#   			e.amount = v
		#   			e.save
		#   		end
		#   	end
		#   end
		# end  	
  # 	flash[:alert] = "This is under construction."
  # 	redirect_to employee_annual_salaries_path
  end
end
