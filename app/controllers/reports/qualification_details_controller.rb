class Reports::QualificationDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

end

