class EmployeeSalaryTemplatesController < ApplicationController
  def index
  end

  def find_employee_for_assign_template
  	@employee = Employee.find_by_manual_employee_code(params[:employee_code]) 
    respond_to do |format|
      if @employee.nil?
        format.js { @flag = true }
      else
        @employee_id = @employee.id
        if EmployeeSalaryTemplate.exists?(employee_id: @employee_id)
          @salary_template = EmployeeSalaryTemplate.find_by_employee_id(@employee_id)
          @employee_salary_templates = EmployeeSalaryTemplate.where("employee_id = ?",@employee_id)
          @array_of_id = []
          @employee_salary_templates.each do |e|
            @array_of_id << e.id
          end
        end
        format.js { @flag = false }
      end
    end
  end

  def find_template
    @employee_id = params[:employee_id]
  	@salary_template = SalaryTemplate.find(params[:id])
  	@employee_salary_templates = @salary_template.salary_component_templates
  end

  def show_employee_list
    @employees =Employee.all
  end
  
  def show_employee_salary_template
    @employee_salary_templates = EmployeeSalaryTemplate.where("employee_id=?",params[:format])
  end

  def show_employee_salary_slip
    @employee_salary_templates = EmployeeSalaryTemplate.where("employee_id=?",params[:format])
  end

  def create_employee_template
    arrays = params[:is_deducted].keys
    arrays.each do |a|
      EmployeeSalaryTemplate.create(employee_id: params[:employee][:employee_id], \
                                    salary_template_id: params[:template][:template_id], \
                                    salary_component_id: params[:salary_component_id][a], \
                                    is_deducted: params[:is_deducted][a], \
                                    parent_salary_component_id: params[:parent_salary_component_id][a], \
                                    percentage: params[:percentage][a], \
                                    to_be_paid: params[:to_be_paid][a], \
                                    monthly_amount: params[:monthly_amount][a], \
                                    annual_amount: params[:annual_amount][a])
    end
    flash[:notice] = "Employee template created successfully."
    redirect_to show_employee_list_employee_salary_templates_path
  end

  def salary_template
    
  end

  def find_employee_for_salary
    @addable_salary_items = nil
    @deducted_salary_items = nil
    @month = params["month"]
    @year = params["year"]
    @instalment_array = []
    @salary_slip_component = []
    @employee = Employee.find_by_manual_employee_code(params[:employee_code])
    
    if @employee.nil?
      @flag = false
    else
      @record = Salaryslip.where("month = ? and year = ? and employee_id = ?",params["month"],params["year"],@employee.id).take
      if @record.nil?
        @salaryslip = Salaryslip.new
        @addable_salary_items = EmployeeSalaryTemplate.where("employee_id = ? and is_deducted = ?",@employee.id,false)
        @deducted_salary_items = EmployeeSalaryTemplate.where("employee_id = ? and is_deducted = ?",@employee.id,true)
        unless params["month"].nil? and params["year"].nil?
          @working_day = Workingday.where("employee_id = ? and month_name = ? and year = ?", @employee.id, params["month"], params["year"]).take
        end

        unless @addable_salary_items.nil?
          @addable_total = @addable_salary_items.sum('monthly_amount').to_f
          unless @addable_total.nil?
              @deducted_total = (@deducted_salary_items.sum('monthly_amount')).to_f
          end
        end
        @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
        unless @advance_salary.nil?
          @instalments = @advance_salary.instalments
          @instalments.try(:each) do |i|
            unless i.instalment_date.nil?
            if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
              @instalment_array << i
            end
            end
          end
        end
      end
      @flag = true
    end
  end

  def modal
    
  end
end