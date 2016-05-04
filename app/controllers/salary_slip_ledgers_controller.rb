class SalarySlipLedgersController < ApplicationController

    def show_employee
      @bank = Bank.find(params[:bank_id])
      @month = params[:month]
      @year = params[:year]
      emp_array = EmployeeBankDetail.where(bank_id: @bank.id).pluck(:employee_id)
      @reports = []
      i = 0
      @employees = Employee.where(id: emp_array)
      @employees.each do |e|
        j = JoiningDetail.find_by_employee_id(e.id)
        wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
        sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take

        if j.nil? or e.nil? or wd1.nil? or sl1.nil?
          i=i+1
        else
          sr = SalaryReport.collect_data(e,j,wd1,sl1)
        end
        @reports << sr
        puts i
        puts "-------------------------------------***********"
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
