class Reports::WelfareDetailsController < ApplicationController
  def new
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def welfare_detail_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
        elsif @location = params[:salary][:company_location_id]
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,is_deducted: true,other_component_name: "Well Faire").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(id: @salaryslip_components)
        else
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
        elsif @location = params[:salary][:company_location_id]
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,is_deducted: true,other_component_name: "Well Faire").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(id: @salaryslip_components)
        else
        end
      elsif current_user.role.name == 'Branch'
        if @location == ""
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year)
        elsif @location = params[:salary][:company_location_id]
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,is_deducted: true,other_component_name: "Well Faire").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(id: @salaryslip_components)
        else
        end
      elsif current_user.role.name == 'HOD'
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end
end
