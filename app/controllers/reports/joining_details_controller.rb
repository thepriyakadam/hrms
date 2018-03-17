class Reports::JoiningDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def collect_departments
    @company_location = CompanyLocation.find(params[:id])
    @departments = @company_location.departments
  end
  
end
