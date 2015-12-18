class HomeController < ApplicationController
  def index
  	@companies = Company.all
  	@company_locations = CompanyLocation.all
  	@departments = Department.all
  	@employees = Employee.all
  	if current_user.role.name == "Employee"
  	  @employee = Employee.find(current_user.employee_id)
    end
  end
end
