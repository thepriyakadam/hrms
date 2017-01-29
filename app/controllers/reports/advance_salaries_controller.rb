class Reports::AdvanceSalariesController < ApplicationController
  def new
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def advance_salary_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'AccountAdmin'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
   end
  end
# def advance_salary_report
#  @location = params[:salary][:company_location_id]
#  if current_user.class == Group
#   if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
#     @advance_salaries = AdvanceSalary.all
#   else
#     @employees = Employee.where(company_location_id: @location.to_i)
#     @advance_salaries = AdvanceSalary.where(employee_id: @employees)
#   end
#   elsif current_user.class == Member
#     if current_user.role.name == "Company"
#       if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
#         @advance_salaries = AdvanceSalary.all
#       else
#          @employees = Employee.where(company_location_id: @location.to_i)
#         @advance_salaries = AdvanceSalary.where(employee_id: @employees)
#       end
#     elsif current_user.role.name == "CompanyLocation"
#       params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
#       @employees = Employee.where(company_location_id: current_user.company_location_id)
#       @advance_salaries = AdvanceSalary.where(employee_id: @employees)
#     elsif current_user.role.name == "Department"
#       @advance_salaries = AdvanceSalary.where(department_id: current_user.department_id)
#     elsif current_user.role.name == "Superviser"
#     elsif current_user.role.name == "Employee"
#     end
#   end
# end
# end
