class HomeController < ApplicationController
  def index
  	@companies = Company.all
  	@company_locations = CompanyLocation.all
  	@departments = Department.all
  	@employees = Employee.all
  end
end
