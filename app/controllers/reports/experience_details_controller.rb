class Reports::ExperienceDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def experience_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @experiences = Experience.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @experiences = Experience.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @experiences = Experience.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @experiences = Experience.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @experiences = Experience.where(employee_id: @employees)
      elsif current_user.role.name == 'Department'
        @experiences = Experience.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
      end
  end
end
