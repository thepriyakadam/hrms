class SalarySlipLedgersController < ApplicationController

    def show_employee
      @month = params[:month]
      @year = params[:year]
      # @employees = params[:employee_ids]
      
      @employees= Employee.all
      # bank_name = params[:bank_name]
      # @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
      # @employees = EmployeeBankDetail.where(id: @salaryslips, bank_name: bank_name)

      # @employee_bank_details = EmployeeBankDetail.where(id: @salaryslips, employee_id: bank_name)
    end

    # def show_employee
    #   @month = params[:month]
    #   @year = params[:year]
    #   department = params[:department_id]
    #   @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    #   @employees = Employee.where(id: @salaryslips, department_id: department)
    # end

end
