class Reports::CertificateController < ApplicationController


  def new
  end

  def show_joining_date
  	@emp = params[:salary][:employee]
  	@employee = Employee.find(@emp)
  	@joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  	#@character = params[:employee][:certificate]
  end
end
