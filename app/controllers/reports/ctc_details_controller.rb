class Reports::CtcDetailsController < ApplicationController
  def new
  end

  def ctc_detail_report
  	 @month = params[:salary][:month]
    @year = params[:salary][:year]
 
    @department= params[:salary][:department_id]
    @salaryslips = []
    unless @department == ""
      @employees = Employee.where(department_id: @department.to_i)
      @salaryslips = Salaryslip.where("month = ? and year = ?", @month, @year).where(employee_id: @employees)
    else
      @salaryslips = Salaryslip.where("month = ? and year = ?", @month, @year)
    end
   
    if @salaryslips.empty?
      flash[:alert] = "Salary not available for this month and year"
      #redirect_to new_reports_ctc_detail_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end

end
