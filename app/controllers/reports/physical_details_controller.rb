class Reports::PhysicalDetailsController < ApplicationController
  def new
  end
  def physical_detail_report
	@location = params[:salary][:company_location_id]
  if current_user.class == Group
		if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
		    @employee_physicals = EmployeePhysical.all
		else
			@employees = Employee.where(company_location_id: @location.to_i)
              @employee_physicals = EmployeePhysical.where(employee_id: @employees)
		end 
  	elsif current_user.class == Member
  		if current_user.role.name == "Company"
  			if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
  			@employee_physicals = EmployeePhysical.all
  			else
  				@employees = Employee.where(company_location_id: @location.to_i)
                  @employee_physicals = EmployeePhysical.where(employee_id: @employees)
  			end 
  		elsif current_user.role.name == "CompanyLocation"
  			params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
  			@employees = Employee.where(company_location_id: current_user.company_location_id)
  			  @employee_physicals = EmployeePhysical.where(employee_id: @employees)
  		elsif current_user.role.name == "Department"
  			  @employee_physicals = EmployeePhysical.where(department_id: current_user.department_id)
   		elsif current_user.role.name == "Superviser"
  		elsif current_user.role.name == "Employee"
  		end
  	end
  end
end
