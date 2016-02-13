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
        format.js { @flag = false }
      end
    end
  end

  def find_template
    @employee_id = params[:employee_id]
    unless params[:id] == ""
      @current_employee_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",params[:employee_id],true).take
      @current_salary_components = @current_employee_template.employee_salary_templates unless @current_employee_template.nil?
    	@salary_template = SalaryTemplate.find(params[:id])
      unless @salary_template.nil?
        @employee_salary_templates = @salary_template.salary_component_templates
        @flag = true
      end
    else
      @flag = false  
  	end
  end

  def show_employee_list
    @employees =Employee.all
  end
  
  def show_employee_salary_template
    @current_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",params[:format],true).take
    @employee_salary_templates = @current_template.employee_salary_templates
  end

  def show_employee_salary_slip
    @current_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",params[:format],true).take
    @employee_salary_templates = @current_template.employee_salary_templates
  end

  def create_employee_template
    arrays = params[:is_deducted].keys
    @employee_id = params[:employee][:employee_id]
    @template_id = params[:template][:template_id]
    
    @previous_employee_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee_id,true).take
      if @previous_employee_template.nil?
        @employee_template = EmployeeTemplate.new do |et|
          et.employee_id = @employee_id
          et.salary_template_id = @template_id
          et.is_active = true
          et.start_date = Date.today
        end
        arrays.each do |a|
          @employee_template.employee_salary_templates.build(employee_id: @employee_id, \
                                      salary_template_id: @template_id, \
                                      salary_component_id: params[:salary_component_id][a], \
                                      is_deducted: params[:is_deducted][a], \
                                      parent_salary_component_id: params[:parent_salary_component_id][a], \
                                      percentage: params[:percentage][a], \
                                      to_be_paid: params[:to_be_paid][a], \
                                      monthly_amount: params[:monthly_amount][a], \
                                      annual_amount: params[:annual_amount][a])
        end
        @employee_template.save!

        flash[:notice] = "Employee template created successfully."
        redirect_to template_list_employee_template_path(@employee_id)
      else
        arrears_array = params[:old_salary_component_id].keys
        increement_date = params[:increement][:date]

        @employee_template = EmployeeTemplate.find_or_initialize_by(employee_id: @employee_id, is_active: false, start_date: nil)
        if @employee_template.id.nil?
          arrays.each do |a|
            @employee_template.employee_salary_templates.build(employee_id: @employee_id, \
                                        salary_template_id: @template_id, \
                                        salary_component_id: params[:salary_component_id][a], \
                                        is_deducted: params[:is_deducted][a], \
                                        parent_salary_component_id: params[:parent_salary_component_id][a], \
                                        percentage: params[:percentage][a], \
                                        to_be_paid: params[:to_be_paid][a], \
                                        monthly_amount: params[:monthly_amount][a], \
                                        annual_amount: params[:annual_amount][a])
          end
          
          @employee_arrear = EmployeeArrear.new do |ea|
            ea.employee_id = @employee_id
            ea.start_date = increement_date
          end
          arrears_array.each do |aa|
            @employee_arrear.employee_arrear_items.build(salary_component_id: params[:old_salary_component_id][aa], actual_amount: params[:difference][aa])
          end
          ActiveRecord::Base.transaction do
            @employee_template.save!          
            @employee_arrear.save!
          end
          
          flash[:notice] = "Employee template created successfully."
          redirect_to template_list_employee_template_path(@employee_id)
        else
          flash[:alert] = "Template already assigned. Activate it."
          redirect_to template_list_employee_template_path(@employee_id)
        end  
    end  
    
  end

  def salary_template
    
  end

  def find_employee_for_salary
    @addable_salary_items = nil
    @deducted_salary_items = nil
    @month = params["month"]
    @year = params["year"]
    @instalment_array = []
    @employee = Employee.find_by_manual_employee_code(params[:employee_code])
    
    if @employee.nil?
      @flag = false
    else
      @record = Salaryslip.where("month = ? and year = ? and employee_id = ?",params["month"],params["year"],@employee.id).take
      if @record.nil?
        @current_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee.id,true).take
        unless @current_template.nil?
          @addable_salary_items = @current_template.employee_salary_templates.where("is_deducted = ?",false)
          @deducted_salary_items = @current_template.employee_salary_templates.where("is_deducted = ?",true)

          unless params["month"].nil? and params["year"].nil?
            @working_day = Workingday.where("employee_id = ? and month_name = ? and year = ?", @employee.id, params["month"], params["year"]).take
          end

          @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
          @advance_salaries.try(:each) do |a|
            @instalments = a.instalments
            @instalments.try(:each) do |i|
              unless i.instalment_date.nil?
                if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
                  @instalment_array << i
                end # date
              end #instalment nil
            end #instalment each
          end #advance salaries loop


        end # template nil  
      end # record nil
      @arrear = EmployeeArrear.where("employee_id = ? and is_paid = ?", @employee.id,false).take
      unless @arrear.nil?
        arrear_start_date = @arrear.start_date
        arrear_start_month = arrear_start_date.strftime("%-m").to_i
        arrear_start_year = arrear_start_date.strftime("%Y").to_i
        arrear_end_month = Workingday.months[@month]
        arrear_end_year = params["year"].to_i
        arrear_working_days = Workingday.where(employee_id: @employee.id, month: arrear_start_month..arrear_end_month, year: arrear_start_year..arrear_end_year)
        @total_payable_days = arrear_working_days.sum('payable_day')
        @arrear_items = @arrear.employee_arrear_items
      end
      @flag = true
    end
  end

  def modal
    
  end

  def new
    @employee = Employee.find(params[:id])
    @employee_template = EmployeeTemplate.where("employee_id = ? and is_active = ?", @employee.id, true).take
  end
end