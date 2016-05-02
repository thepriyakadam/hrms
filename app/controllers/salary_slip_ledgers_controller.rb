class SalarySlipLedgersController < ApplicationController

    def show_employee
     @salaryslip_components = SalaryslipComponent.all
    end

    # def show_employee
    #   @month = params[:month]
    #   @year = params[:year]
    #   department = params[:department_id]
    #   @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    #   @employees = Employee.where(id: @salaryslips, department_id: department)
    # end

end
