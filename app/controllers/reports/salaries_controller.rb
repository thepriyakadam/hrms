class Reports::SalariesController < ApplicationController
  def new

  end

  def date_range_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @salaryslips = []
    @salaryslips = Salaryslip.where("month = ? and year = ?", @month, @year)
    if @salaryslips.empty?
      flash[:alert] = "Salary not available for this month and year"
      redirect_to new_reports_salary_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end
end
