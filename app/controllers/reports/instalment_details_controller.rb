class Reports::InstalmentDetailsController < ApplicationController
  def new
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def instalment_detail_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @advances = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
          @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @advances = AdvanceSalary.where(employee_id: @employees)
          @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advances = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
      elsif current_user.role.name == 'SalaryAccount'
        params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @advances = AdvanceSalary.where(employee_id: @employees)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(advance_salary_id: @advances)
      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end
