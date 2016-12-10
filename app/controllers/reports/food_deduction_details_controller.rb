class Reports::FoodDeductionDetailsController < ApplicationController
  def new
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def food_deduction_detail_report
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)

      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
   end

   def dynamic_report
    # byebug
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
          @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i,company_id: @company.to_i)
          @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:food_deduction][:company_location_id] == '' || params[:food_deduction][:company_id] == ''
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("strftime('%m/%Y', food_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)

      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
   end
   
end
