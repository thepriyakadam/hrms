class CertificatesController < ApplicationController
  def show
  end
  
  def new
  end

  def show_joining_date
    @employee = Employee.find(params[:salary][:employee])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

  def certificate_print
    @employee = Employee.find(params[:salary][:employee])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end
end

