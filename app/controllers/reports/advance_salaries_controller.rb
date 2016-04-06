class Reports::AdvanceSalariesController < ApplicationController
  def new
  end
   def advance_salary_report
    @location = params[:salary][:company_location_id]
    @advance_salaries = []
    unless @location == ""
      @employees = Employee.where(company_location_id: @location.to_i)
      @advance_salaries = AdvanceSalary.where(employee_id: @employees)
    else
      @advance_salaries = AdvanceSalary.all
    if @advance_salaries.empty?
      flash[:alert] = "Salary not available for this month and year"
      redirect_to new_reports_advance_salary_path
    else
      #flash[:notice] = "Downloaded successfully."
      #render 'reports/salaries/new'
    end
  end
end
end