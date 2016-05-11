class Reports::FamilyDetailsController < ApplicationController
  def new
    session[:active_tab] = "employee"
    session[:active_tab1] = "basicreport"
  end

  def family_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @families = Family.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @families = Family.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @families = Family.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @families = Family.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @families = Family.where(employee_id: @employees)
      elsif current_user.role.name == 'Department'
        @families = Family.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
      end
  end
end
