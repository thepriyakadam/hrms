class Reports::BankDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def bank_detail_report
   @employee_bank_details = EmployeeBankDetail.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end

  # def bank_detail_report
  #  @employee_bank_details = EmployeeBankDetail.all
  # end
  
end