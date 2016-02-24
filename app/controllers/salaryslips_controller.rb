class SalaryslipsController < ApplicationController
  def save_data
    @employee = Employee.find(params[:employee])
    @month = params[:month]
    @year = params[:year]
    if @employee.nil?
      @flag = false
    else
      working_day = Workingday.find_by_employee_id(@employee.id)
      
      current_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee.id,true).take
      addable_salary_items = current_template.employee_salary_templates.where("is_deducted = ?",false)
      deducted_salary_items = current_template.employee_salary_templates.where("is_deducted = ?",true)

      addable_total_actual_amount = 0
      addable_total_calculated_amount = 0
      basic_actual_amount = 0
      basic_calculated_amount = 0
      da_actual_amount = 0
      da_calculated_amount = 0
      @salaryslip_component_array = []
      @instalment_array = []
      addable_salary_items.try(:each) do |item|
        addable_calculated_amount = 0
        @template_id = item.salary_template_id
        addable_actual_amount = item.monthly_amount
        unless addable_actual_amount.nil?
          addable_calculated_amount = addable_actual_amount / working_day.day_in_month * working_day.payable_day
        else
          addable_actual_amount = 0
          addable_calculated_amount = 0
        end
        addable_total_actual_amount = addable_total_actual_amount + addable_actual_amount
        addable_total_calculated_amount = addable_total_calculated_amount + addable_calculated_amount

        if item.salary_component.name == "Basic"
          basic_actual_amount = addable_actual_amount
          basic_calculated_amount = addable_calculated_amount
        elsif item.salary_component.name == "DA"
          da_actual_amount = addable_actual_amount
          da_calculated_amount = addable_calculated_amount
        end
        @addable_salaryslip_item = SalaryslipComponent.new do |sc|
          sc.salary_component_id = item.salary_component_id
          sc.actual_amount = addable_actual_amount
          sc.calculated_amount = addable_calculated_amount
          sc.is_deducted = false
        end
        @salaryslip_component_array << @addable_salaryslip_item
      end

      formula_item_actual_amount = 0
      formula_item_calculated_amount = 0
      formula_total_actual_amount = 0
      formula_total_calculated_amount = 0
      deducted_actual_amount = 0
      deducted_calculated_amount = 0
      deducted_total_actual_amount = 0
      deducted_total_calculated_amount = 0
      deducted_salary_items.try(:each) do |item|
        deducted_item_name = item.salary_component.name
        case deducted_item_name
        when "ESIC"
          master_esic = EsicMaster.first
          if master_esic.esic and addable_total_calculated_amount <= master_esic.max_limit and @employee.joining_detail.have_esic
            formula_string = master_esic.base_component.split(",")
            formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount = formula_total_actual_amount + formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount = formula_total_calculated_amount + formula_item_calculated_amount
            end
            deducted_actual_amount = formula_total_actual_amount / 100 * master_esic.percentage
            deducted_calculated_amount = (formula_total_calculated_amount / 100 * master_esic.percentage).ceil
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          else
            deducted_actual_amount = 0
            deducted_calculated_amount = 0
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          end
          
        when "Prof. Tax"
          if addable_total_actual_amount > 15000
            if @month == "March"
              deducted_actual_amount = 212
              deducted_calculated_amount = 212
              @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
            else
              deducted_actual_amount = 208
              deducted_calculated_amount = 208
              @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
            end
          else
            deducted_actual_amount = 0
            deducted_calculated_amount = 0
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          end

        when "PF"
          direct_allowence_id = SalaryComponent.find_by_name("DA").id
          direct_allowence = addable_salary_items.where(salary_component_id: direct_allowence_id).take.monthly_amount.to_f
          if direct_allowence.nil? or direct_allowence == 0
            if @employee.joining_detail.select_pf == "Yes"
              deducted_actual_amount = basic_actual_amount / 100 * 12
              deducted_calculated_amount = basic_calculated_amount / 100 * 12
              @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
            elsif @employee.joining_detail.select_pf == "Limit"
              deducted_actual_amount = @employee.joining_detail.pf_max_amount.to_f / 100 * 12
              deducted_calculated_amount = deducted_actual_amount
              @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
              @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
            end
          else
            deducted_actual_amount = (basic_actual_amount + da_actual_amount) / 100 * 12
            deducted_calculated_amount = (basic_calculated_amount + da_calculated_amount) / 100 * 12
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          end
        else
          if item.monthly_amount.nil?
            deducted_actual_amount = 0
            deducted_calculated_amount = 0
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          else
            deducted_actual_amount = item.monthly_amount
            deducted_calculated_amount = deducted_actual_amount
            @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
          end
        end
        deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
        deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount    
      end #deducted_salary_items loop

      @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
      @advance_salaries.try(:each) do |a|
        @instalments = a.instalments
        @instalments.try(:each) do |i|
          unless i.instalment_date.nil?
            if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
              @instalment_array << i
            end
          end
        end
      end

      @instalment_array.try(:each) do |ia|
        ia.update(is_complete: true)
        deducted_actual_amount = ia.advance_salary.instalment_amount
        deducted_calculated_amount = deducted_actual_amount
        deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
        deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount
      end

      @retention = RetentionMoney.first
      unless @retention.nil?
        if @retention.have_retention and @employee.joining_detail.have_retention
          unless @employee.employee_type.name == "Confirmed"
            deducted_actual_amount = 0
            deducted_calculated_amount = @retention.amount
            deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
            deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount
          end
        end
      end

      Salaryslip.new do |ss|
        ss.employee_id = @employee.id
        ss.workingday_id = working_day.id
        ss.employee_template_id = current_template.id
        ss.actual_gross_salary = addable_total_actual_amount
        ss.actual_total_deduction = deducted_total_actual_amount
        ss.actual_net_salary = addable_total_actual_amount - deducted_total_actual_amount
        ss.salary_template_id = @template_id
        ss.month = @month
        ss.year = @year
        ss.month_year = "01 #{@month} #{@year}".to_date
        ss.calculated_gross_salary = addable_total_calculated_amount
        ss.calculated_total_deduction = deducted_total_calculated_amount
        ss.calculated_net_salary = addable_total_calculated_amount - deducted_total_calculated_amount
        ss.save!
      end

      @salaryslip = Salaryslip.last

      @salaryslip_component_array.each do |sa|
        sa.salaryslip_id = @salaryslip.id
        sa.employee_template_id = current_template.id
        sa.save!
      end

      @instalment_array.try(:each) do |ia|
        deducted_actual_amount = ia.advance_salary.instalment_amount
        deducted_calculated_amount = deducted_actual_amount
        SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: "Advance")
      end

      @retention = RetentionMoney.first
      unless @retention.nil?
        if @retention.have_retention and @employee.joining_detail.have_retention
          unless @employee.employee_type.name == "Confirmed"
            deducted_actual_amount = 0
            deducted_calculated_amount = @retention.amount
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: "Retention")
          end
        end
      end
      
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

        @arrear_items.try(:each) do |ai|
          arrear_calculated_amount = ((ai.actual_amount/30) * @total_payable_days).round
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: ai.actual_amount ,calculated_amount: arrear_calculated_amount, is_deducted: ai.is_deducted, is_arrear: true)
        end
      end
    end
    flash[:notice] = "Salary processed."
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
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",false,@salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where("is_deducted = ? and salaryslip_id = ?",true,@salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
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

  def select_month_year_form
    
  end

  def show_unsaved_employee
    @month = params[:month]
    @year = params[:year]
    @employees = []
    @workingdays = Workingday.joins("LEFT JOIN salaryslips on workingdays.employee_id = salaryslips.employee_id where salaryslips.employee_id is null and workingdays.month_name = '#{params[:month]}' and workingdays.year = '#{params[:year]}'").pluck(:employee_id)
    @employees = Workingday.find_by_role(@workingdays, current_user)
    # employee_ids.each do |e|
    #   emp = Employee.find(e)
    #   @employees << emp
    # end
  end

  def save_all_data
    employee_ids = params[:employee_ids]
    @month = params[:month]
    @year = params[:year]
    # @salaryslip_array = []
    # @salaryslip_component_array = []
    @instalment_array = []
    if employee_ids.empty?
      flash[:notice] = "Please select employees."
      redirect_to root_url
    else
      ActiveRecord::Base.transaction do
      employee_ids.each do |eid|
        @instalment_array = []
        @salaryslip_component_array = []
        @employee = Employee.find(eid)
        working_day = Workingday.find_by_employee_id(eid)
        
        current_template = EmployeeTemplate.where("employee_id = ? and is_active = ?",@employee.id,true).take
        unless current_template.nil?  
          addable_salary_items = current_template.employee_salary_templates.where("is_deducted = ?",false)
          deducted_salary_items = current_template.employee_salary_templates.where("is_deducted = ?",true)

          addable_total_actual_amount = 0
          addable_total_calculated_amount = 0
          basic_actual_amount = 0
          basic_calculated_amount = 0
          da_actual_amount = 0
          da_calculated_amount = 0

          addable_salary_items.try(:each) do |item|
            addable_calculated_amount = 0
            @template_id = item.salary_template_id
            addable_actual_amount = item.monthly_amount
            unless addable_actual_amount.nil?
              addable_calculated_amount = addable_actual_amount / working_day.day_in_month * working_day.payable_day
            else
              addable_actual_amount = 0
              addable_calculated_amount = 0
            end
            addable_total_actual_amount = addable_total_actual_amount + addable_actual_amount
            addable_total_calculated_amount = addable_total_calculated_amount + addable_calculated_amount

            if item.salary_component.name == "Basic"
              basic_actual_amount = addable_actual_amount
              basic_calculated_amount = addable_calculated_amount
            elsif item.salary_component.name == "DA"
              da_actual_amount = addable_actual_amount
              da_calculated_amount = addable_calculated_amount
            end
            @addable_salaryslip_item = SalaryslipComponent.new do |sc|
              sc.salary_component_id = item.salary_component_id
              sc.actual_amount = addable_actual_amount
              sc.calculated_amount = addable_calculated_amount
              sc.is_deducted = false
            end
            @salaryslip_component_array << @addable_salaryslip_item
          end

          formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0
          deducted_actual_amount = 0
          deducted_calculated_amount = 0
          deducted_total_actual_amount = 0
          deducted_total_calculated_amount = 0
          deducted_salary_items.try(:each) do |item|
            deducted_item_name = item.salary_component.name
            case deducted_item_name
            when "ESIC"
              master_esic = EsicMaster.first
              if master_esic.esic and addable_total_calculated_amount <= master_esic.max_limit and @employee.joining_detail.have_esic
                formula_string = master_esic.base_component.split(",")
                formula_string.try(:each) do |f|
                  formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
                  formula_item_actual_amount = formula_item.monthly_amount
                  formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
                  formula_total_actual_amount = formula_total_actual_amount + formula_item_actual_amount
                  formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
                  formula_total_calculated_amount = formula_total_calculated_amount + formula_item_calculated_amount
                end
                deducted_actual_amount = formula_total_actual_amount / 100 * master_esic.percentage
                deducted_calculated_amount = (formula_total_calculated_amount / 100 * master_esic.percentage).ceil
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              else
                deducted_actual_amount = 0
                deducted_calculated_amount = 0
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              end
              
            when "Prof. Tax"
              if addable_total_actual_amount > 15000
                if @month == "March"
                  deducted_actual_amount = 212
                  deducted_calculated_amount = 212
                  @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
                else
                  deducted_actual_amount = 208
                  deducted_calculated_amount = 208
                  @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
                end
              else
                deducted_actual_amount = 0
                deducted_calculated_amount = 0
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              end

            when "PF"
              direct_allowence_id = SalaryComponent.find_by_name("DA").id
              direct_allowence = addable_salary_items.where(salary_component_id: direct_allowence_id).take.monthly_amount.to_f
              if direct_allowence.nil? or direct_allowence == 0
                if @employee.joining_detail.select_pf == "Yes"
                  deducted_actual_amount = basic_actual_amount / 100 * 12
                  deducted_calculated_amount = basic_calculated_amount / 100 * 12
                  @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
                elsif @employee.joining_detail.select_pf == "Limit"
                  deducted_actual_amount = @employee.joining_detail.pf_max_amount.to_f / 100 * 12
                  deducted_calculated_amount = deducted_actual_amount
                  @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
                else
                  deducted_actual_amount = 0
                  deducted_calculated_amount = 0
                  @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
                end
              else
                deducted_actual_amount = (basic_actual_amount + da_actual_amount) / 100 * 12
                deducted_calculated_amount = (basic_calculated_amount + da_calculated_amount) / 100 * 12
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              end
            else
              if item.monthly_amount.nil?
                deducted_actual_amount = 0
                deducted_calculated_amount = 0
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              else
                deducted_actual_amount = item.monthly_amount
                deducted_calculated_amount = deducted_actual_amount
                @salaryslip_component_array << create_salaryslip_component(item.salary_component_id, deducted_actual_amount, deducted_calculated_amount)
              end
            end
            deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
            deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount    
          end #deducted_salary_items loop

          @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
          @advance_salaries.try(:each) do |a|
            @instalments = a.instalments
            @instalments.try(:each) do |i|
              unless i.instalment_date.nil?
                if i.try(:instalment_date).strftime("%B") == params["month"] and i.try(:instalment_date).strftime("%Y") == params["year"]
                  @instalment_array << i
                end
              end
            end
          end

          @instalment_array.try(:each) do |ia|
            deducted_actual_amount = ia.advance_salary.instalment_amount
            deducted_calculated_amount = deducted_actual_amount
            deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
            deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount
          end

          @retention = RetentionMoney.first
          unless @retention.nil?
            if @retention.have_retention and @employee.joining_detail.have_retention
              unless @employee.employee_type.name == "Confirmed"
                deducted_actual_amount = 0
                deducted_calculated_amount = @retention.amount
                deducted_total_actual_amount = deducted_total_actual_amount + deducted_actual_amount
                deducted_total_calculated_amount = deducted_total_calculated_amount + deducted_calculated_amount
              end
            end
          end

          Salaryslip.new do |ss|
            ss.employee_id = @employee.id
            ss.workingday_id = working_day.id
            ss.employee_template_id = current_template.id
            ss.actual_gross_salary = addable_total_actual_amount
            ss.actual_total_deduction = deducted_total_actual_amount
            ss.actual_net_salary = addable_total_actual_amount - deducted_total_actual_amount
            ss.salary_template_id = @template_id
            ss.month = @month
            ss.year = @year
            ss.month_year = "01 #{@month} #{@year}".to_date
            ss.calculated_gross_salary = addable_total_calculated_amount 
            ss.calculated_total_deduction = deducted_total_calculated_amount
            ss.calculated_net_salary = addable_total_calculated_amount - deducted_total_calculated_amount
            ss.save!
          end
          @salaryslip = Salaryslip.last
          @salaryslip_component_array.each do |sa|
            sa.salaryslip_id = @salaryslip.id
            sa.employee_template_id = current_template.id
            sa.save!
          end

          @instalment_array.try(:each) do |ia|
            deducted_actual_amount = ia.advance_salary.instalment_amount
            deducted_calculated_amount = deducted_actual_amount
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: "Advance")
          end

          @retention = RetentionMoney.first
          unless @retention.nil?
            if @retention.have_retention and @employee.joining_detail.have_retention
              unless @employee.employee_type.name == "Confirmed"
                deducted_actual_amount = 0
                deducted_calculated_amount = @retention.amount
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: "Retention")
              end
            end
          end
        end # current template nil
      end #employee_ids loop
      end
    end # if for employee_ids.nil?
    flash[:notice] = "All Salary processed."
    redirect_to select_month_year_form_salaryslips_path
  end # action end

  def create_salaryslip_component(salary_component_id, actual_amount, calculated_amount)
    salaryslip_component = SalaryslipComponent.new do |sc|
      sc.salary_component_id = salary_component_id
      sc.actual_amount = actual_amount
      sc.calculated_amount = calculated_amount
      sc.is_deducted = true
    end
    salaryslip_component
  end
end