class Reports::BankDetailsController < ApplicationController
  def new
  end

  def bank_detail_report
   @employee_bank_details = EmployeeBankDetail.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end
end
