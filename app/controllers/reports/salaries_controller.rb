class Reports::SalariesController < ApplicationController
  def new

  end

  def date_range_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    @salaryslips = []
    unless @location == ""
      @employees = Employee.where(company_location_id: @location.to_i)
      @salaryslips = Salaryslip.where("month = ? and year = ?", @month, @year).where(employee_id: @employees)
    else
      @salaryslips = Salaryslip.where("month = ? and year = ?", @month, @year)
    end
    if @salaryslips.empty?
      flash[:alert] = "Salary not available for this month and year"
      redirect_to new_reports_salary_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end

  def show

  end

  def department_wise
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
      redirect_to show_reports_salary_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end

  def ctc_yearly_report
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
      redirect_to show_reports_salary_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end

end

