class Reports::PfDetailsController < ApplicationController
  def new
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def pf_detail_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)

      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end
