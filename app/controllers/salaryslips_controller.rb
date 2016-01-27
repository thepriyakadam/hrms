class SalaryslipsController < ApplicationController
  def save_data
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
        unless @instalment_array.empty?
          @instalment_array.each do |i|
            Instalment.find(i).update(is_complete: true)
          end
        end
      end
      @flag = true
    end
    redirect_to salary_template_employee_salary_templates_path
  end

  def employee_salary_list
    @employees =Employee.all
  end

  def salary_slip_list
    @employee = Employee.find(params[:format])
    @salray_slips = Salaryslip.where("employee_id= ?",@employee.id)
  end

  def show_salaryslip
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",false,@salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",true,@salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    unless @advance_salary.nil?
      @instalments = @advance_salary.instalments
      @instalment_array = []
      @instalments.try(:each) do |i|
        unless i.instalment_date.nil?
          if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
            @instalment_array << i
          end
        end
      end
    end
  end

  def select_month_year_form
    
  end

  def show_unsaved_employee
    @month = params[:month]
    @year = params[:year]
    @employees = []
    employee_ids = Workingday.joins("LEFT JOIN salaryslips on workingdays.employee_id = salaryslips.employee_id where salaryslips.employee_id is null and workingdays.month_name = '#{params[:month]}' and workingdays.year = '#{params[:year]}'").pluck('employee_id')
    employee_ids.each do |e|
      emp = Employee.find(e)
      @employees << emp
    end
  end

  def save_all_data
    @employee_ids = params[:employee_ids]
    @employee_ids.each do |e_id|
      @employee = Employee.find(e_id)
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
          unless @instalment_array.empty?
            @instalment_array.each do |i|
              Instalment.find(i).update(is_complete: true)
            end
          end
        end
        @flag = true
      end
    end
    flash[:notice] = "All data saved successfully."
    redirect_to select_month_year_form_salaryslips_path
  end
end