class Reports::EmployeeController < ApplicationController
  def new

  end

  def employee_basic_detail
    @employees = Employee.all
  end
end

