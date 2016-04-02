class Reports::BankDetailsController < ApplicationController
  def new
  end

  def bank_detail_report
   @employee_bank_details = EmployeeBankDetail.all
  end
end
