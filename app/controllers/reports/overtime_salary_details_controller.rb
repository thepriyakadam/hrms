class Reports::OvertimeSalaryDetailsController < ApplicationController
  def new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="Overtime"
  end


  def overtime_montly_detail_report
  	@month = params[:salary][:month]
    @year = params[:salary][:year]
    @location = params[:salary][:company_location_id]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y'))
      else
        @employees = Employee.where(company_location_id: @location.to_i)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
           @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y'))
        else
          @employees = Employee.where(company_location_id: @location.to_i)
           @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'CompanyLocation'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
         @overtime_salaries = OvertimeSalary.where("strftime('%m/%Y', ot_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)

      elsif current_user.role.name == 'Department'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def daily
  	
  end

  def overtime_daily_detail_report
    @start_date = params[:overtime][:start_date]
    @end_date = params[:overtime][:end_date]
    @location = params[:overtime][:company_location_id]
    
    if @start_date == "" || @start_date.nil?
      flash[:alert] = "Please select start date."
      redirect_to reports_overtime_salary_details_daily_path
    else
      if @end_date == "" || @end_date.nil?
        flash[:alert] = "Please select end date."
        redirect_to reports_overtime_salary_details_daily_path
      else
        if @location == "" || @location.nil?
          flash[:alert] = "Please select company location."
          redirect_to reports_overtime_salary_details_daily_path
        else
          if current_user.class == Group
            @overtime_daily_records = OvertimeDailyRecord.where(ot_daily_date: @start_date..@end_date)
          else
            if current_user.role.name == "Company"
              @overtime_daily_records = OvertimeDailyRecord.where(ot_daily_date: @start_date..@end_date)
            elsif current_user.role.name == "CompanyLocation"
              @employees = Employee.find(company_location_id: current_user.company_location_id)
              @overtime_daily_records = OvertimeDailyRecord.where(ot_daily_date: @start_date..@end_date, employee_id: @employees)
            elsif current_user.role.name == "Employee"
              @overtime_daily_records = OvertimeDailyRecord.where(ot_daily_date: @start_date..@end_date, employee_id: current_user.employee_id)
            end
          end

        end
      end
    end

  end
end

