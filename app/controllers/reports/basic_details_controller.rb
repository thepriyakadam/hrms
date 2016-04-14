class Reports::BasicDetailsController < ApplicationController
  def new

  end

  def collect_departments
    @company_location = CompanyLocation.find(params[:id])
    @department = @company_location.departments 
  end 

  def employee_basic_report
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.all
      else
        @employees = Employee.where(company_location_id: params[:salary][:company_location_id])
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @employees = Employee.all
        else
          @employees = Employee.where(company_location_id: params[:salary][:company_location_id])
        end
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Department'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end
