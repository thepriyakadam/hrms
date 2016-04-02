class Reports::PhysicalDetailsController < ApplicationController
  def new
  end
  def physical_detail_report
  	@employee_physicals = EmployeePhysical.all
  end
end
