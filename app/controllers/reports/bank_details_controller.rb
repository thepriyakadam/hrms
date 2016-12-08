class Reports::BankDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def bank_detail_report
   @employee_bank_details = EmployeeBankDetail.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end

  # def bank_detail_report
  #  @employee_bank_details = EmployeeBankDetail.all
  # end
  def bank_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employee_bank_details = EmployeeBankDetail.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @employee_bank_details = EmployeeBankDetail.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'Department'
        @employee_bank_details = EmployeeBankDetail.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end