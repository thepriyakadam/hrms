class Reports::BasicDetailsController < ApplicationController
  def new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end


  def employee_list
    @employees = Employee.column_names
    @joining_details = JoiningDetail.column_names
    @employee_physicals = EmployeePhysical.column_names
    @qualifications = Qualification.column_names
    @experiences = Experience.column_names
    @skillsets = Skillset.column_names
    @certifications = Certification.column_names
    @employee_bank_details = EmployeeBankDetail.column_names
    @families = Family.column_names
    @awards = Award.column_names
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
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

  def employee_basic_info
  end
  
  def select_department
  end

  def list_of_employee
    @company_location_id = params[:salary][:company_location_id]
    @employees = Employee.where(company_location_id: @company_location_id)
  end

end
