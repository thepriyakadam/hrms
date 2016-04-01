class Reports::BasicDetailsController < ApplicationController
  def new
  end

  def employee_basic_report
   @employees = Employee.all
  end

end
