class Reports::InstalmentDetailsController < ApplicationController
  def new
  end

  def instalment_detail_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @instalments = Instalment.where("strftime('%m/%Y', instalment_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)

      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end