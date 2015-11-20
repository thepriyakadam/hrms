class HomeController < ApplicationController
  def index
  	@companies = Company.all
  	@employees = Employee.all
  end
end
