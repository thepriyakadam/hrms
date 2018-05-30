class ExcelExportsController < ApplicationController
  def payroll
    @salaryslips = Salaryslip.all
    # @addable_salary_items = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",false,304)
    # @deducted_salary_items = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",true,304)
    # @working_day = Workingday.find(@salaryslip.workingday_id)
    # @employee = Employee.find(@salaryslip.employee_id)
    respond_to do |format|
      format.xls
    end
  end
end
