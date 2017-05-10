class Reports::CtcDetailsController < ApplicationController
  def new
  end

  def ctc_detail_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]

    @department = params[:salary][:department_id]
    @salaryslips = []
    if @department == ''
      @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
    else
      @employees = Employee.where(department_id: @department.to_i)
      @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
    end

    if @salaryslips.empty?
      flash[:alert] = 'Salary not available for this month and year'
      # redirect_to new_reports_ctc_detail_path
    end
  end
end
