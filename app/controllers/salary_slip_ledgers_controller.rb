class SalarySlipLedgersController < ApplicationController

    def show_employee
      @bank = Bank.find(params[:bank_id])
      @month = params[:month]
      @year = params[:year]
      emp_array = JoiningDetail.where(bank_id: @bank.id).pluck(:employee_id)
      @reports = []
      @employees = Employee.where(id: emp_array)
      @employees.each do |e|
        j = JoiningDetail.find_by_employee_id(e.id)
        w = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year).take
        s = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year).take
        sr = SalaryReport.collect_data(e,j,w,s)
        @reports << sr
      end
    end

    # def show_employee
    #   @month = params[:month]
    #   @year = params[:year]
    #   department = params[:department_id]
    #   @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    #   @employees = Employee.where(id: @salaryslips, department_id: department)
    # end

end
