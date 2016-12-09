class Reports::SalariesController < ApplicationController
  def new
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"
  end

  def download
    @payments = Salaryslip.all
    # respond_to do |format|
    #   format.xlsx {render xlsx: 'download',filename: "payments.xlsx"}
    # end
    #render xlsx: "create", template: "api/reports/create"
  end

  def date_range_report
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

  def show
  end

  def department_wise
    @month = params[:salary][:month]
    @year = params[:salary][:year]

    @department = params[:salary][:department_id]
    @salaryslips = []
    if @department == ''
      @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
    else
      @employees = Employee.where(department_id: @department.to_i)
      @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
    end

    if @salaryslips.empty?
      flash[:alert] = 'Salary not available for this month and year'
      redirect_to show_reports_salary_path
    end
  end

  def ctc_yearly_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employee_salary_templates = EmployeeSalaryTemplate.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @employee_salary_templates = EmployeeSalaryTemplate.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employees)
      elsif current_user.role.name == 'Department'
        @employee_salary_templates = EmployeeSalaryTemplate.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end
