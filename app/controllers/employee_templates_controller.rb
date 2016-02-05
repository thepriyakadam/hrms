class EmployeeTemplatesController < ApplicationController
  def index
    @employees = Employee.all
  end
end
