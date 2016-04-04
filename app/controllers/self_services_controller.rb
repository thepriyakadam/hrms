class SelfServicesController < ApplicationController
  def employee
    @employees = Employee.where(id: current_user.employee_id)
  end

  def employee_template
    @employee = Employee.find(current_user.employee_id)
    @employee_templates = @employee.employee_templates
  end

  def attendance
    @attendances = Attendance.where(employee_id: current_user.employee_id)
  end

  def salaryslip
    #@employee = Employee.find(current_user.employee_id)
    @salray_slips = Salaryslip.where(employee_id: current_user.employee_id)
  end

  def advance
    @advance_salary = AdvanceSalary.find_by_employee_id(current_user.employee_id)
    if @advance_salary.nil? 
      flash[:alert] = "Advance Salary not taken."
      redirect_to root_url
    else
      @instalments = @advance_salary.instalments
    end
  end
end
