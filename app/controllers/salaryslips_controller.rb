class SalaryslipsController < ApplicationController
  def save_data
    @employee = params[:employee]
    @working_day = params[:working_day]
    @addable_salary_components = params[:addable_salary_components]
    @deducted_salary_components = params[:deducted_salary_components]
    @addable_total = params[:addable_total]
    @deducted_total = params[:deducted_total]
    @instalment_array = params[:instalment_array]

    id = Salaryslip.create(employee_id: @employee, workingday_id: @working_day, gross_salary: @addable_total, total_deduction: @deducted_total).id
    @addable_salary_components.try(:each) do |a|
      SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: false)
    end
    @deducted_salary_components.try(:each) do |a|
      SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: true)
    end
    redirect_to salary_template_employee_salary_templates_path
  end
end