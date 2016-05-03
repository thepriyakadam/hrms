class SalarySlipLedgersController < ApplicationController

    def show_employee
   	  #byebug
      @month = params[:month]
      @year = params[:year]
      # @employees = params[:employee_ids]
      bank_name = params[:bank_name]
      @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
      @employees = Employee.where(id: @salaryslips, department_id: bank_name)
      @employee_bank_details = EmployeeBankDetail.where(id: @salaryslips, employee_id: bank_name)
    end

end
