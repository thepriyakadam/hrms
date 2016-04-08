class Reports::AdvanceSalariesController < ApplicationController
  def new
  end

  def advance_salary_report
   @location = params[:salary][:company_location_id]
   if current_user.class == Group
    if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
      @advance_salaries = AdvanceSalary.all
    else
      @employees = Employee.where(company_location_id: @location.to_i)
      @advance_salaries = AdvanceSalary.where(employee_id: @employees)
    end 
    elsif current_user.class == Member
      if current_user.role.name == "Company"
        if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
          @advance_salaries = AdvanceSalary.all
        else
           @employees = Employee.where(company_location_id: @location.to_i)
          @advance_salaries = AdvanceSalary.where(employee_id: @employees)
        end 
      elsif current_user.role.name == "CompanyLocation"
        params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where(employee_id: @employees)
      elsif current_user.role.name == "Department"
        @advance_salaries = AdvanceSalary.where(department_id: current_user.department_id)
      elsif current_user.role.name == "Superviser"
      elsif current_user.role.name == "Employee"
      end
    end  
  end


#    def advance_salary_report
#     @location = params[:salary][:company_location_id]
#     @advance_salaries = []
#     unless @location == ""
#       @employees = Employee.where(company_location_id: @location.to_i)
#       @advance_salaries = AdvanceSalary.where(employee_id: @employees)
#     else
#       @advance_salaries = AdvanceSalary.all
#     if @advance_salaries.empty?
#       flash[:alert] = "Salary not available for this month and year"
#       redirect_to new_reports_advance_salary_path
#     else
#       #flash[:notice] = "Downloaded successfully."
#       #render 'reports/salaries/new'
#     end
#   end
# end
end