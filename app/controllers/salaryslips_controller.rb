class SalaryslipsController < ApplicationController
  def save_data
    @employee = Employee.find(params[:employee])
    @month = params[:month]
    @year = params[:year]
    if @employee.nil?
      @flag = false
    else
      ActiveRecord::Base.transaction do
        working_day = Workingday.where(employee_id: @employee.id, month_name: @month, year: @year).take

        current_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
        addable_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', false)
        deducted_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', true)
        employee_contribution_items = current_template.employee_salary_templates.where(is_deducted: nil)

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
          if addable_actual_amount.nil?
            addable_actual_amount = 0
            addable_calculated_amount = 0
          else
            addable_calculated_amount = addable_actual_amount / working_day.day_in_month * working_day.payable_day
          end
          addable_total_actual_amount += addable_actual_amount
          addable_total_calculated_amount += addable_calculated_amount

          if item.salary_component.name == 'Basic'
            basic_actual_amount = addable_actual_amount
            basic_calculated_amount = addable_calculated_amount
          elsif item.salary_component.name == 'DA'
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

        deducted_actual_amount = 0
        deducted_calculated_amount = 0
        deducted_total_actual_amount = 0
        deducted_total_calculated_amount = 0

        if addable_total_actual_amount > 15_000
          if @month == 'March'
            deducted_actual_amount = 212
            deducted_calculated_amount = 212
          else
            deducted_actual_amount = 208
            deducted_calculated_amount = 208
          end
          deducted_total_actual_amount += deducted_actual_amount
          deducted_total_calculated_amount += deducted_calculated_amount
        end

        @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
        @advance_salaries.try(:each) do |a|
          @instalments = a.instalments
          @instalments.try(:each) do |i|
            unless i.instalment_date.nil?
              if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
                @instalment_array << i
              end
            end
          end
        end

        @instalment_array.try(:each) do |ia|
          ia.update(is_complete: true)
          deducted_actual_amount = ia.advance_salary.instalment_amount
          deducted_calculated_amount = deducted_actual_amount
          deducted_total_actual_amount += deducted_actual_amount
          deducted_total_calculated_amount += deducted_calculated_amount
        end

        # @retention = RetentionMoney.first
        # unless @retention.nil?
        #   if @retention.have_retention && @employee.joining_detail.have_retention
        #     unless @employee.employee_type.name == 'Confirmed'
        #       deducted_actual_amount = 0
        #       deducted_calculated_amount = @retention.amount
        #       deducted_total_actual_amount += deducted_actual_amount
        #       deducted_total_calculated_amount += deducted_calculated_amount
        #     end
        #   end
        # end

        date = Date.new(@year.to_i, Workingday.months[@month])
        @food_deductions = FoodDeduction.where(food_date: date..date.at_end_of_month, employee_id: @employee.id)
        unless @food_deductions.empty?
          @food_deductions.each do |f|
            f.update(is_paid: true)
            deducted_actual_amount = 0
            deducted_calculated_amount = f.amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end
        end

        @monthly_expences = MonthlyExpence.where(employee_id: @employee.id, expence_date: date.all_month)
        @monthly_expences.try(:each) do |m|
          m.update(is_paid: true)
          deducted_actual_amount = 0
          deducted_calculated_amount = m.amount
          deducted_total_actual_amount += deducted_actual_amount
          deducted_total_calculated_amount += deducted_calculated_amount
        end

        society = SocietyMemberShip.find_by_employee_id(@employee.id)
        unless society.nil?
          if society.is_society_member
            deducted_actual_amount = 0
            deducted_calculated_amount = society.amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end
        end

        @well_faires = WellFaire.all
        @well_faires.try(:each) do |w|
          if @month == w.month
            deducted_actual_amount = 0
            deducted_calculated_amount = w.amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end
        end

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0

        @pf_master = PfMaster.where(is_active: true).take
        if @pf_master.nil?
        else
          if @pf_master.is_pf
            formula_string = @pf_master.base_component.split(',')
            formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
            end

            if @employee.joining_detail.select_pf == 'Yes'
              deducted_actual_amount = (formula_total_actual_amount / 100 * @pf_master.percentage).round
              deducted_calculated_amount = (formula_total_calculated_amount / 100 * @pf_master.percentage).round
            elsif @employee.joining_detail.select_pf == 'Limit'
             deducted_actual_amount = (@employee.joining_detail.pf_max_amount.to_f / 100 * @pf_master.percentage).round
             deducted_calculated_amount = deducted_actual_amount
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
            end
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end
        end

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0

        master_esic = EsicMaster.first
        unless master_esic.nil?
          if master_esic.esic && addable_total_calculated_amount <= master_esic.max_limit && @employee.joining_detail.have_esic
            formula_string = master_esic.base_component.split(',')
            formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
            end
            deducted_actual_amount = (formula_total_actual_amount / 100 * master_esic.percentage).ceil
            deducted_calculated_amount = (formula_total_calculated_amount / 100 * master_esic.percentage).ceil
          else
            deducted_actual_amount = 0
            deducted_calculated_amount = 0
          end
          deducted_total_actual_amount += deducted_actual_amount
          deducted_total_calculated_amount += deducted_calculated_amount
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
        SlipInformation.create_salaryslip_information(@salaryslip, @employee, working_day)
        @salaryslip_component_array.each do |sa|
          sa.salaryslip_id = @salaryslip.id
          sa.employee_template_id = current_template.id
          sa.save!
        end

        if addable_total_actual_amount > 15_000
          if @month == 'March'
            deducted_actual_amount = 212
            deducted_calculated_amount = 212
          else
            deducted_actual_amount = 208
            deducted_calculated_amount = 208
          end
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Prof. Tax')
        end

        unless @instalment_array.empty?
          deducted_calculated_amount = 0
          @instalment_array.each do |ia|
            deducted_actual_amount = deducted_actual_amount + ia.advance_salary.instalment_amount
            deducted_calculated_amount = deducted_calculated_amount + deducted_actual_amount          
            Instalment.find(ia).update(is_complete: true)
          end
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Advance')
        end

        # @retention = RetentionMoney.first
        # unless @retention.nil?
        #   if @retention.have_retention && @employee.joining_detail.have_retention
        #     unless @employee.employee_type.name == 'Confirmed'
        #       deducted_actual_amount = 0
        #       deducted_calculated_amount = @retention.amount
        #       SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Retention')
        #     end
        #   end
        # end

        date = Date.new(@year.to_i, Workingday.months[@month])
        @food_deductions = FoodDeduction.where(food_date: date..date.at_end_of_month, employee_id: @employee.id)
        deducted_calculated_amount = 0
        unless @food_deductions.empty?
          @food_deductions.each do |f|
            f.update(is_paid: true)
            deducted_actual_amount = 0
            deducted_calculated_amount = deducted_calculated_amount + f.amount
          end
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Food Deduction')
        end

        @monthly_expences = MonthlyExpence.where(employee_id: @employee.id, expence_date: date.all_month)
        @monthly_expences.try(:each) do |m|
          deducted_actual_amount = 0
          deducted_calculated_amount = m.amount
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: m.expencess_type.name)
        end

        @well_faires = WellFaire.all
        unless @well_faires.empty?
          deducted_calculated_amount = 0
          @well_faires.try(:each) do |w|
            if @month == w.month
              deducted_actual_amount = 0
              deducted_calculated_amount = deducted_calculated_amount + w.amount
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: w.amount, calculated_amount: w.amount, is_deducted: true, other_component_name: 'Well Faire')
            end
          end
        end

        society = SocietyMemberShip.find_by_employee_id(@employee.id)
        unless society.nil?
          if society.is_society_member
            deducted_actual_amount = 0
            deducted_calculated_amount = society.amount
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Society')
          end
        end


        formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0

          @retention = RetentionMoney.first
          # if @retention.is_persent == "Yes"
          if @retention.have_retention == true
            unless @retention.nil?

            # if @retention.have_retention == true  && @employee.joining_detail.have_retention
            if @retention.have_retention && addable_total_calculated_amount <= @retention.max_limit.to_f && @employee.joining_detail.have_retention
              formula_string = @retention.base_component.split(',')
              formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
              end
              deducted_actual_amount = (formula_total_actual_amount / 100 * @retention.persent).ceil
              deducted_calculated_amount = (formula_total_calculated_amount / 100 * @retention.persent).ceil
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
            end
            @salary_component = SalaryComponent.find_by(name: "Retention")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
          end 
          else  
          unless @retention.nil?

            # if @retention.is_persent == "Yes"  && @employee.joining_detail.have_retention
          if @retention.have_retention == false
             @retention1 = RetentionMoney.where(have_retention: false).take 
            @salary_component = SalaryComponent.find_by(name: "Retention")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: @retention1.try(:amount), calculated_amount: @retention1.try(:amount), is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
           end
         end
       end
      

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0
        formula_minimum_wages = 0
        
        @da = DaMaster.first
        if @da.is_da == true
          unless @da.nil?

          if @da.is_da && @employee.joining_detail.is_da
            formula_string = @da.base_component.split(',')
            formula_string.try(:each) do |f|
            formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
            formula_item_actual_amount = formula_item.monthly_amount
            formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
            formula_total_actual_amount += formula_item_actual_amount
            formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
            formula_minimum_wages = @da.minimum_wages.to_f / working_day.try(:day_in_month) * working_day.try(:payable_day)
            formula_total_calculated_amount += formula_item_calculated_amount
            end
            addable_actual_amount = (@da.minimum_wages.to_f - formula_total_actual_amount.to_f)
            addable_calculated_amount = (formula_minimum_wages - formula_total_calculated_amount.to_f)
            else
              addable_actual_amount = 0
              addable_calculated_amount = 0
            end
            if @da.minimum_wages > addable_actual_amount.to_f
            @salary_component = SalaryComponent.find_by(name: "DA")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: addable_actual_amount, calculated_amount: addable_calculated_amount, is_deducted: false, other_component_name: 'DA',salary_component_id: @salary_component.try(:id))
          end
            # else
            if addable_actual_amount.to_f < 0
              @salary_component = SalaryComponent.find_by(name: "DA")
              SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: 0, calculated_amount: 0, is_deducted: false, other_component_name: 'DA',salary_component_id: @salary_component.try(:id))
              end
            end
          end

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0

        @pf_master = PfMaster.where(is_active: true).take
        if @pf_master.nil?
        else
          if @pf_master.is_pf
            formula_string = @pf_master.base_component.split(',')
            formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
            end

            if @employee.joining_detail.select_pf == 'Yes'
              deducted_actual_amount = (formula_total_actual_amount / 100 * @pf_master.percentage).round
              deducted_calculated_amount = (formula_total_calculated_amount / 100 * @pf_master.percentage).round
            elsif @employee.joining_detail.select_pf == 'Limit'
              deducted_actual_amount = (@employee.joining_detail.pf_max_amount.to_f / 100 * @pf_master.percentage).round
              deducted_calculated_amount = deducted_actual_amount
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
            end
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'PF')
          end
        end

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0

        master_esic = EsicMaster.first
        unless master_esic.nil?
          if master_esic.esic && addable_total_calculated_amount <= master_esic.max_limit && @employee.joining_detail.have_esic
            formula_string = master_esic.base_component.split(',')
            formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
            end
            deducted_actual_amount = (formula_total_actual_amount / 100 * master_esic.percentage).ceil
            deducted_calculated_amount = (formula_total_calculated_amount / 100 * master_esic.percentage).ceil
          else
            deducted_actual_amount = 0
            deducted_calculated_amount = 0
          end
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'ESIC')
        end

        employee_contribution_items.try(:each) do |c|
          SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'ESIC')
        end


          @salaryslip = Salaryslip.last
          @salaryslip_component1 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id)
          @salaryslip_component2 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: true)
          @salaryslip_component3 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: false)
          actual_gross_salary = @salaryslip_component3.sum(:actual_amount).to_i
          calculated_gross_salary = @salaryslip_component3.sum(:calculated_amount).to_f
          actual_amount = @salaryslip_component1.sum(:actual_amount).to_i
          calculated_amount = @salaryslip_component1.sum(:calculated_amount).to_i
          actual_total_deduction = @salaryslip_component2.sum(:actual_amount).to_f
          calculated_total_deduction = @salaryslip_component2.sum(:calculated_amount).to_f
          actual_net_salary = actual_gross_salary - actual_total_deduction
          calculated_net_salary = calculated_gross_salary - calculated_total_deduction

          Salaryslip.where(id: @salaryslip.id).update_all(actual_gross_salary: actual_gross_salary,actual_total_deduction: actual_total_deduction,actual_net_salary: actual_net_salary,calculated_gross_salary: calculated_gross_salary,calculated_total_deduction: calculated_total_deduction,calculated_net_salary: calculated_net_salary)
          puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS.............................."


        BonusEmployee.create_bonus(basic_calculated_amount, @employee.id, date)

        @arrear = EmployeeArrear.where('employee_id = ? and is_paid = ?', @employee.id, false).take
        unless @arrear.nil?
          arrear_start_date = @arrear.start_date
          arrear_end_date = @arrear.end_date
          arrear_start_month = arrear_start_date.strftime('%-m').to_i
          arrear_start_year = arrear_start_date.strftime('%Y').to_i
          arrear_end_month = Workingday.months[@month]
          arrear_end_year = params['year'].to_i
          arrear_working_days = Workingday.where(employee_id: @employee.id, month_name: arrear_start_month..arrear_end_month, year: arrear_start_year..arrear_end_year)
          @total_payable_days = arrear_working_days.sum('payable_day')
          @arrear_items = @arrear.employee_arrear_items
          # byebug
          number_of_months = (arrear_end_date.year*12+arrear_end_date.month)-(arrear_start_date.year*12+arrear_start_date.month)

          dates = number_of_months.times.each_with_object([]) do |count, array|
            array << [arrear_start_date.beginning_of_month + count.months,
            arrear_start_date.end_of_month + count.months]
          end

          @arrear_items.try(:each) do |ai|
            dates.each do |start_instance,end_instance|
              arrear_calculated_amount = ((ai.actual_amount / start_instance.end_of_month.day) * @total_payable_days).round
            end
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: ai.actual_amount, calculated_amount: arrear_calculated_amount, is_deducted: ai.is_deducted, is_arrear: true, salary_component_id: ai.salary_component_id)
          end          
        end
      end
    end
    flash[:notice] = 'Salary processed.'
    redirect_to salary_template_employee_salary_templates_path
  end

  def employee_salary_list
    @employees = Employee.find_by_role(current_user)
    # authorize! :show, @employees
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryreport"
  end

  def salary_slip_list
    @employee = Employee.find(params[:format])
    authorize! :show, @employee
    @salray_slips = Salaryslip.where('employee_id= ?', @employee.id)
  end

  def show_salaryslip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id).where(is_arrear: nil)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id).where(is_arrear: nil)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    # @employee_leav_balance = EmployeeLeavBalance.find_by()
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    unless @advance_salary.nil?
      @instalments = @advance_salary.instalments
      @instalments.try(:each) do |i|
        unless i.instalment_date.nil?
          if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
            @instalment_array << i
          end
        end
      end
    end
  end

  def print_salary_slip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:id])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_salary_slip',
              layout: 'pdf.html',
              template: 'salaryslips/print_salary_slip.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end
  end
 
  def select_month_year_form
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryprocess"
  end

  def show_unsaved_employee
    @month = params[:month]
    @year = params[:year]
    @workingdays = Workingday.where(month_name: @month, year: @year).pluck(:employee_id)
    @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    emp_ids = @workingdays - @salaryslips
    if current_user.class == Group
      @employees = Employee.where(id: emp_ids)  
    elsif current_user.class == Member
      if current_user.role.name == "Company"
        @employees = Employee.where(id: emp_ids)
      elsif current_user.role.name == "CompanyLocation"
        location_employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        new_ids = location_employees & emp_ids
        @employees = Employee.where(id: new_ids)
      elsif current_user.role.name == "Department"
        department_employees = Employee.where(department_id: current_user.company_location_id)
        new_ids = department_employees & emp_ids
        @employees = Employee.where(id: new_ids)
      end
    end
  end

  def save_all_data
    employee_ids = params[:employee_ids]
    @month = params[:month]
    @year = params[:year]
    @instalment_array = []
    if employee_ids.nil? || employee_ids.empty?
      flash[:alert] = 'Please select employees.'
      redirect_to select_month_year_form_salaryslips_path
    else
      ActiveRecord::Base.transaction do
        employee_ids.try(:each) do |eid|
          @instalment_array = []
          @salaryslip_component_array = []
          @employee = Employee.find(eid)
          working_day = Workingday.where(employee_id: eid, month_name: @month, year: @year).take

          current_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
          next if current_template.nil?
          addable_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', false)
          deducted_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', true)

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
            if addable_actual_amount.nil?
              addable_actual_amount = 0
              addable_calculated_amount = 0
            else
              addable_calculated_amount = addable_actual_amount / working_day.day_in_month * working_day.payable_day
            end
            addable_total_actual_amount += addable_actual_amount
            addable_total_calculated_amount += addable_calculated_amount

            if item.salary_component.name == 'Basic'
              basic_actual_amount = addable_actual_amount
              basic_calculated_amount = addable_calculated_amount
              # byebug
            elsif item.salary_component.name == 'DA'
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



          deducted_actual_amount = 0
          deducted_calculated_amount = 0
          deducted_total_actual_amount = 0
          deducted_total_calculated_amount = 0

          if addable_total_actual_amount > 15_000
            if @month == 'March'
              deducted_actual_amount = 212
              deducted_calculated_amount = 212
            else
              deducted_actual_amount = 208
              deducted_calculated_amount = 208
            end
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end

          @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
          @advance_salaries.try(:each) do |a|
            @instalments = a.instalments
            @instalments.try(:each) do |i|
              unless i.instalment_date.nil?
                if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
                  @instalment_array << i
                end
              end
            end
          end

          @instalment_array.try(:each) do |ia|
            deducted_actual_amount = ia.advance_salary.instalment_amount
            deducted_calculated_amount = deducted_actual_amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end

          date = Date.new(@year.to_i, Workingday.months[@month])
          @food_deductions = FoodDeduction.where(food_date: date..date.at_end_of_month, employee_id: @employee.id)
          unless @food_deductions.empty?
            @food_deductions.each do |f|
              #byebug
              f.update(is_paid: true)
              deducted_actual_amount = 0
              deducted_calculated_amount = f.amount
              deducted_total_actual_amount += deducted_actual_amount
              deducted_total_calculated_amount += deducted_calculated_amount
            end
          end

          @monthly_expences = MonthlyExpence.where(employee_id: @employee.id, expence_date: date.all_month)
          @monthly_expences.try(:each) do |m|

            m.update(is_paid: true)
            deducted_actual_amount = 0
            deducted_calculated_amount = m.amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end

          society = SocietyMemberShip.find_by_employee_id(@employee.id)
          unless society.nil?
            if society.is_society_member
              deducted_actual_amount = 0
              deducted_calculated_amount = society.amount
              deducted_total_actual_amount += deducted_actual_amount
              deducted_total_calculated_amount += deducted_calculated_amount
            end
          end

           
          formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0

          @pf_master = PfMaster.where(is_active: true).take
          if @pf_master.nil?
          else
            if @pf_master.is_pf
              formula_string = @pf_master.base_component.split(',')
              formula_string.try(:each) do |f|
                begin    
                  formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
                  #byebug if formula_item.nil?
                  formula_item_actual_amount = formula_item.monthly_amount
                  formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
                  formula_total_actual_amount += formula_item_actual_amount

                  formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
                  formula_total_calculated_amount += formula_item_calculated_amount
                rescue NoMethodError
                  flash[:alert] = 'Salary Component is not available in tamplate of #{@employee.manual_employee_code}.'
                  #redirect_to select_month_year_form_salaryslips_path
                end
              end

              if @employee.joining_detail.select_pf == 'Yes'
                deducted_actual_amount = (formula_total_actual_amount / 100 * @pf_master.percentage).round
                deducted_calculated_amount = (formula_total_calculated_amount / 100 * @pf_master.percentage).round
              elsif @employee.joining_detail.select_pf == 'Limit'
               deducted_actual_amount = (@employee.joining_detail.pf_max_amount.to_f / 100 * @pf_master.percentage).round
               deducted_calculated_amount = deducted_actual_amount
              else
                deducted_actual_amount = 0
                deducted_calculated_amount = 0
              end
              deducted_total_actual_amount += deducted_actual_amount
              deducted_total_calculated_amount += deducted_calculated_amount
            end
          end

          Salaryslip.new do |ss|
            ss.employee_id = @employee.id
            ss.workingday_id = working_day.id
            ss.employee_template_id = current_template.id
            # ss.actual_gross_salary = addable_total_actual_amount
            # ss.actual_total_deduction = deducted_total_actual_amount
            # ss.actual_net_salary = addable_total_actual_amount - deducted_total_actual_amount
            ss.salary_template_id = @template_id
            ss.month = @month
            ss.year = @year
            ss.month_year = "01 #{@month} #{@year}".to_date
            # ss.calculated_gross_salary = addable_total_calculated_amount
            # ss.calculated_total_deduction = deducted_total_calculated_amount
            # ss.calculated_net_salary = addable_total_calculated_amount - deducted_total_calculated_amount
            ss.save!
          end
          @salaryslip = Salaryslip.last
          SlipInformation.create_salaryslip_information(@salaryslip, @employee, working_day)
          @salaryslip_component_array.each do |sa|
            sa.salaryslip_id = @salaryslip.id
            sa.employee_template_id = current_template.id
            sa.save!
          end

          formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0

          @pf_master = PfMaster.where(is_active: true).take
          if @pf_master.nil?
          else
            if @pf_master.is_pf
              formula_string = @pf_master.base_component.split(',')
              formula_string.try(:each) do |f|
                begin
                  formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
                  formula_item_actual_amount = formula_item.monthly_amount
                  formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
                  formula_total_actual_amount += formula_item_actual_amount
                  formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
                  formula_total_calculated_amount += formula_item_calculated_amount
                rescue NoMethodError
                  @salary_component = SalaryComponent.find(f.to_i)
                  flash[:alert] = "#{@salary_component.name} is not available in tamplate of #{@employee.manual_employee_code}."
                  #redirect_to select_month_year_form_salaryslips_path
                end
              end
              # c=formula_item_actual_amount
              # d=formula_item_calculated_amount

              if @employee.joining_detail.select_pf == 'Yes'
                deducted_actual_amount = (formula_total_actual_amount / 100 * @pf_master.percentage).round
                deducted_calculated_amount = (formula_total_calculated_amount / 100 * @pf_master.percentage).round
              elsif @employee.joining_detail.select_pf == 'Limit'
                deducted_actual_amount = (@employee.joining_detail.pf_max_amount.to_f / 100 * @pf_master.percentage).round
                deducted_calculated_amount = deducted_actual_amount
              else
                deducted_actual_amount = 0
                deducted_calculated_amount = 0
              end
              @salary_component = SalaryComponent.find_by(name: "PF")
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'PF',salary_component_id: @salary_component.id)
            end
          end
          # byebug

          formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0

          master_esic = EsicMaster.first
          unless master_esic.nil?
            if master_esic.esic && addable_total_calculated_amount <= master_esic.max_limit && @employee.joining_detail.have_esic
              formula_string = master_esic.base_component.split(',')
              formula_string.try(:each) do |f|
                formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
                formula_item_actual_amount = formula_item.monthly_amount
                formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
                formula_total_actual_amount += formula_item_actual_amount
                formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
                formula_total_calculated_amount += formula_item_calculated_amount
              end
              deducted_actual_amount = (formula_total_actual_amount / 100 * master_esic.percentage).ceil
              deducted_calculated_amount = (formula_total_calculated_amount / 100 * master_esic.percentage).ceil
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
            end
            @salary_component = SalaryComponent.find_by(name: "ESIC")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'ESIC',salary_component_id: @salary_component.id)
          end

          formula_item_actual_amount = 0
          formula_item_calculated_amount = 0
          formula_total_actual_amount = 0
          formula_total_calculated_amount = 0

          @retention = RetentionMoney.first
          # if @retention.is_persent == "Yes"
          if @retention.have_retention == true
            unless @retention.nil?

            # if @retention.have_retention == true  && @employee.joining_detail.have_retention
            if @retention.have_retention && addable_total_calculated_amount <= @retention.max_limit.to_f && @employee.joining_detail.have_retention
              formula_string = @retention.base_component.split(',')
              formula_string.try(:each) do |f|
              formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
              formula_item_actual_amount = formula_item.monthly_amount
              formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
              formula_total_actual_amount += formula_item_actual_amount
              formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
              formula_total_calculated_amount += formula_item_calculated_amount
              end
              deducted_actual_amount = (formula_total_actual_amount / 100 * @retention.persent).ceil
              deducted_calculated_amount = (formula_total_calculated_amount / 100 * @retention.persent).ceil
            else
              deducted_actual_amount = 0
              deducted_calculated_amount = 0
            end
            @salary_component = SalaryComponent.find_by(name: "Retention")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
          end 
          else  
          unless @retention.nil?

            # if @retention.is_persent == "Yes"  && @employee.joining_detail.have_retention
          if @retention.have_retention == false
             @retention1 = RetentionMoney.where(have_retention: false).take 
            @salary_component = SalaryComponent.find_by(name: "Retention")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: @retention1.try(:amount), calculated_amount: @retention1.try(:amount), is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
           end
         end
       end
      

        formula_item_actual_amount = 0
        formula_item_calculated_amount = 0
        formula_total_actual_amount = 0
        formula_total_calculated_amount = 0
        formula_minimum_wages = 0

        @da = DaMaster.first
        if @da.is_da == true
          unless @da.nil?

          if @da.is_da && @employee.joining_detail.is_da
            formula_string = @da.base_component.split(',')
            formula_string.try(:each) do |f|
            formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
            formula_item_actual_amount = formula_item.monthly_amount
            formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
            formula_total_actual_amount += formula_item_actual_amount
            formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
            formula_minimum_wages = @da.minimum_wages.to_f / working_day.try(:day_in_month) * working_day.try(:payable_day)
            formula_total_calculated_amount += formula_item_calculated_amount
            end
            addable_actual_amount = (@da.minimum_wages.to_f - formula_total_actual_amount.to_f)
            addable_calculated_amount = (formula_minimum_wages - formula_total_calculated_amount.to_f)
            a=addable_actual_amount.to_f
            # byebug
            if @da.minimum_wages.to_f > a
              @salary_component = SalaryComponent.find_by(name: "DA")
              SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: addable_actual_amount, calculated_amount: addable_calculated_amount, is_deducted: false, other_component_name: 'DA',salary_component_id: @salary_component.try(:id))
            else
              # @salary_component = SalaryComponent.find_by(name: "DA")
              # SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: 100.0, calculated_amount: 100.0, is_deducted: false, other_component_name: 'DA',salary_component_id: @salary_component.try(:id))
              addable_actual_amount = 0
              addable_calculated_amount = 0
            end
            end
          end
        end
        
          if addable_total_actual_amount > 15_000
            if @month == 'March'
              deducted_actual_amount = 212
              deducted_calculated_amount = 212
            else
              deducted_actual_amount = 208
              deducted_calculated_amount = 208
            end
            @salary_component = SalaryComponent.find_by(name: "Prof. Tax")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Prof. Tax',salary_component_id: @salary_component.id)
          end

          @well_faires = WellFaire.all
          unless @well_faires.empty?
            deducted_calculated_amount = 0
            @well_faires.try(:each) do |w|
              if @month == w.month
                deducted_actual_amount = 0
                deducted_calculated_amount = deducted_calculated_amount + w.amount
                @salary_component = SalaryComponent.find_by(name: "WelFare")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: w.amount, calculated_amount: w.amount, is_deducted: true, other_component_name: 'WelFare',salary_component_id: @salary_component.try(:id))
              end
            end
          end

          society = SocietyMemberShip.find_by_employee_id(@employee.id)
          unless society.nil?
            if society.is_society_member
              deducted_actual_amount = 0
              deducted_calculated_amount = society.amount
              @salary_component = SalaryComponent.find_by(name: "Society")
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_calculated_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Society',salary_component_id: @salary_component.id)
            end
          end

          date = Date.new(@year.to_i, Workingday.months[@month])
          @food_deductions = FoodDeduction.where(food_date: date..date.at_end_of_month, employee_id: @employee.id)
          unless @food_deductions.empty?
            deducted_calculated_amount = 0
            @food_deductions.each do |f|
              #byebug
              f.update(is_paid: true)
              deducted_actual_amount = 0
              deducted_calculated_amount = deducted_calculated_amount + f.amount
            end
            @salary_component = SalaryComponent.find_by(name: "Food Deduction")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Food Deduction',salary_component_id: @salary_component.id)
          end

          unless @instalment_array.empty?
            deducted_calculated_amount = 0
            deducted_actual_amount = 0
            @instalment_array.each do |ia|
              deducted_actual_amount = deducted_actual_amount + ia.advance_salary.instalment_amount
              deducted_calculated_amount = deducted_calculated_amount + deducted_actual_amount         
              Instalment.find(ia).update(is_complete: true)
            end
            @salary_component = SalaryComponent.find_by(name: "Advance")
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: 'Advance',salary_component_id: @salary_component.id)
          end

          @monthly_expences = MonthlyExpence.where(employee_id: @employee.id, expence_date: date.all_month)
          @salary_component=SalaryComponent.find_by(name: "Mobile Deduction")
          @salary_comp=SalaryComponent.find_by(name: "Other Deduction")
          @salary_compon=SalaryComponent.find_by(name: "Income Tax")

          @monthly_expences.try(:each) do |m|
            deducted_actual_amount = 0
            deducted_calculated_amount = m.amount

            if m.expencess_type.name == @salary_component.name
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: m.expencess_type.name,salary_component_id:  @salary_component.id)
            elsif m.expencess_type.name == @salary_comp.name
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: m.expencess_type.name,salary_component_id:  @salary_comp.id)
            elsif m.expencess_type.name == @salary_compon.name
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount, is_deducted: true, other_component_name: m.expencess_type.name,salary_component_id:  @salary_compon.id)
            end
          end
          

          @salary_component = SalaryComponent.find_by(name: "DA")
          @salslip_comp = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,salary_component_id: @salary_component.id).take
          if @salslip_comp.actual_amount.to_f < 0
            SalaryslipComponent.where(salary_component_id: @salary_component.id).update_all(actual_amount: 0, calculated_amount: 0)
            puts "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT.............................."
          else
          end

          @salaryslip = Salaryslip.last
          @salaryslip_component1 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id)
          @salaryslip_component2 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: true)
          @salaryslip_component3 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: false)
          actual_gross_salary = @salaryslip_component3.sum(:actual_amount).to_f
          calculated_gross_salary = @salaryslip_component3.sum(:calculated_amount).to_f
          actual_amount = @salaryslip_component1.sum(:actual_amount).to_f
          calculated_amount = @salaryslip_component1.sum(:calculated_amount).to_f
          actual_total_deduction = @salaryslip_component2.sum(:actual_amount).to_f
          calculated_total_deduction = @salaryslip_component2.sum(:calculated_amount).to_f
          actual_net_salary = actual_gross_salary - actual_total_deduction
          calculated_net_salary = calculated_gross_salary - calculated_total_deduction

          Salaryslip.where(id: @salaryslip.id).update_all(actual_gross_salary: actual_gross_salary,actual_total_deduction: actual_total_deduction,actual_net_salary: actual_net_salary,calculated_gross_salary: calculated_gross_salary,calculated_total_deduction: calculated_total_deduction,calculated_net_salary: calculated_net_salary)
          puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS.............................."

 
          BonusEmployee.create_bonus(basic_calculated_amount, @employee.id, date)
          # byebug
          @fp_master = FpMaster.where(is_active: true).take
          formula_string = @fp_master.base_component.split(',').map {|i| i.to_i}
          # formula_string.try(:each) do |f|
          formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
          @total = formula_item.sum(:calculated_amount)
          formula_item_calculated_amount = (@total / 100 * @fp_master.percentage).ceil
          # formula_item_calculated_amount = @total / working_day.try(:day_in_month) * working_day.try(:payable_day)

          EmployeerPf.create_fp(formula_item_calculated_amount,@employee.id, date)
          puts "ttttttttttttttttttttttttttttttttttttttttttttt..........................."
          # end


          # byebug
          @esic_employer_master = EsicEmployerMaster.where(is_active: true).take
          formula_string = @esic_employer_master.base_component.split(',').map {|i| i.to_i}
          # formula_string.try(:each) do |f|
          formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
          @total = formula_item.sum(:calculated_amount)
          formula_item_calculated_amount = (@total / 100 * @esic_employer_master.percentage).ceil
          # formula_item_calculated_amount = @total / working_day.try(:day_in_month) * working_day.try(:payable_day)

          EmployeerEsic.create_esic(formula_item_calculated_amount,@employee.id, date)
          puts "ggggggggggggggggggggggggggggggg..........................."
          # end

          @arrear = EmployeeArrear.where('employee_id = ? and is_paid = ?', @employee.id, false).take
          next if @arrear.nil?
          arrear_start_date = @arrear.start_date
          arrear_start_month = arrear_start_date.strftime('%-m').to_i
          arrear_start_year = arrear_start_date.strftime('%Y').to_i
          arrear_end_month = Workingday.months[@month]
          arrear_end_year = params['year'].to_i
          arrear_working_days = Workingday.where(employee_id: @employee.id, month: arrear_start_month..arrear_end_month, year: arrear_start_year..arrear_end_year)
          @total_payable_days = arrear_working_days.sum('payable_day')
          @arrear_items = @arrear.employee_arrear_items

          number_of_months = (arrear_end_date.year*12+arrear_end_date.month)-(arrear_start_date.year*12+arrear_start_date.month)

          dates = number_of_months.times.each_with_object([]) do |count, array|
            array << [arrear_start_date.beginning_of_month + count.months,arrear_start_date.end_of_month + count.months]
          end

          @arrear_items.try(:each) do |ai|
            dates.each do |start_instance,end_instance|
              arrear_calculated_amount = ((ai.actual_amount / start_instance.end_of_month.day) * @total_payable_days).round
            end
            SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: ai.actual_amount, calculated_amount: arrear_calculated_amount, is_deducted: ai.is_deducted, is_arrear: true, salary_component_id: ai.salary_component_id)
          end
          

          # current template nil
          
        end # employee_ids loop
      end
      flash[:notice] = 'All Salary processed.'
      redirect_to select_month_year_form_salaryslips_path
    end # if for employee_ids.nil?
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

  def revert_salary
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryprocess"
  end
  
  def salary_slip_report 
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @advance_salary = AdvanceSalary.find(@employee.id)
  end

  def show_employee
    @month = params[:month]
    @year = params[:year]
    if current_user.class == Group
      @salaryslips = Salaryslip.where(month: @month, year: @year.to_s)
    elsif current_user.class == Member
      if current_user.role.name == "Company"
        @salaryslips = Salaryslip.where(month: @month, year: @year.to_s)
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @salaryslips = Salaryslip.where(month: @month, year: @year.to_s, employee_id: @employees)
      end  
    end    
  end

  def display_salaryslip_report
    @month = params[:month]
    @year = params[:year]
    @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s)
    @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s).take
    # @bonus_employees = BonusEmployee.where(employee_id: @salaryslips.employee_id,date: )
    @bonus_employees = BonusEmployee.where("strftime('%m/%Y', bonus_date) = ? and employee_id = ?", date.strftime('%m/%Y'), @salaryslips.employee_id)
    @employeer_pfs = EmployeerPf.where("strftime('%m/%Y', pf_date) = ? and employee_id = ?", date.strftime('%m/%Y'), @salaryslips.employee_id)
    @employeer_esic = EmployeerEsic.where("strftime('%m/%Y', esic_date) = ? and employee_id = ?", date.strftime('%m/%Y'), @salaryslips.employee_id)
  end

  def destroy_salary_slip
    @month = params[:month]
    @year = params[:year]
    date = Date.new(@year.to_i,Workingday.months[@month])
    @salaryslip_ids = params[:salaryslip_ids]
    if @salaryslip_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to revert_salary_salaryslips_path
    else
      @salaryslip_ids.each do |sid|
        @salaryslip = Salaryslip.find(sid)
        @bonus_employees = BonusEmployee.where("strftime('%m/%Y', bonus_date) = ? and employee_id = ?", date.strftime('%m/%Y'), @salaryslip.employee_id)        
        Instalment.where("strftime('%m/%Y' , instalment_date) = ? ", date.strftime('%m/%Y')).update_all(is_complete: false) 
        MonthlyExpence.where("strftime('%m/%Y' , expence_date) = ? ", date.strftime('%m/%Y')).update_all(is_paid: false) 
        FoodDeduction.where("strftime('%m/%Y' , food_date) = ? ", date.strftime('%m/%Y')).update_all(is_paid: false) 
        @bonus_employees.destroy_all
        SalaryslipComponent.where(salaryslip_id: @salaryslip.id).destroy_all
        @salaryslip.destroy
        @workingdays = Workingday.where(employee_id: @salaryslip.employee_id, month_name: date.strftime("%B"), year: date.strftime("%Y"))
        @workingdays.destroy_all
        EmployeeAttendance.where("strftime('%m/%Y', day) = ?", date.strftime('%m/%Y')).update_all(is_confirm: false)
      end
      flash[:notice] = "Revert successfully"
      redirect_to revert_salary_salaryslips_path
    end
  end
end