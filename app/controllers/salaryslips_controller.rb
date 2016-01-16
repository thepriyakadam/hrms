class SalaryslipsController < ApplicationController
  def save_data
    # @employee = params[:employee]
    # @working_day = params[:working_day]
    # @addable_salary_components = params[:addable_salary_components]
    # @deducted_salary_components = params[:deducted_salary_components]
    # @addable_total = params[:addable_total]
    # @deducted_total = params[:deducted_total]
    # @instalment_array = params[:instalment_array]

    # byebug

    # id = Salaryslip.create(employee_id: @employee, workingday_id: @working_day, gross_salary: @addable_total, total_deduction: @deducted_total).id
    # @addable_salary_components.try(:each) do |a|
    #   SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: false)
    # end
    # @deducted_salary_components.try(:each) do |a|
    #   SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: true)
    # end

    @employee = Employee.find(params[:employee])
    if @employee.nil?
      @flag = false
    else
      @addable_salary_components = EmployeeSalaryTemplate.where("employee_id = ? and is_deducted = ?",@employee.id,false)
      @deducted_salary_components = EmployeeSalaryTemplate.where("employee_id = ? and is_deducted = ?",@employee.id,true)
      @working_day = Workingday.where("employee_id = ?", @employee.id).take
      unless @addable_salary_components.nil?
        @addable_total = @addable_salary_components.sum('monthly_amount').to_f
        unless @addable_total.nil?
            @deducted_total = (@deducted_salary_components.sum('monthly_amount')).to_f
        end
      end
      id = Salaryslip.create(employee_id: @employee.id, workingday_id: @working_day.id, gross_salary: @addable_total, total_deduction: @deducted_total,net_salary: params[:net_salary],month: params["month"],year: params["year"]).id
      @addable_salary_components.try(:each) do |a|
        SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: false)
      end
      @deducted_salary_components.try(:each) do |a|
        SalaryslipComponent.create(salaryslip_id: id, salary_component_id: a.salary_component_id, amount: a.monthly_amount, is_deducted: true)
      end

      @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
      unless @advance_salary.nil?
        @instalments = @advance_salary.instalments
        @instalment_array = []
        @instalments.try(:each) do |i|
          unless i.instalment_date.nil?
            if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
              SalaryslipComponent.create(salaryslip_id: id, amount: i.instalment_amount, is_deducted: true,other_component_name: "Instalment")
              @instalment_array << i
            end
          end
        end
      end
      @flag = true
    end

    
    redirect_to salary_template_employee_salary_templates_path
  end
end