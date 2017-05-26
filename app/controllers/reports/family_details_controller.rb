class Reports::FamilyDetailsController < ApplicationController
  def new
   session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
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
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @families = Family.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @families = Family.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @families = Family.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @families = Family.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
      end
  end
end
