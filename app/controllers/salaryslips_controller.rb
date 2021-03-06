class SalaryslipsController < ApplicationController
  require 'numbers_in_words'
  require 'numbers_in_words/duck_punch'

  def salary_slip_report_form
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def salaryslip_daterange_report
     session[:active_tab] ="PayrollManagement"
     session[:active_tab1] ="SalaryProcess"
     session[:active_tab2] = "SalaryReport"
  end

  def employee_salary_list
     @employees = Employee.find_by_role(current_user)
     # authorize! :show, @employees
     session[:active_tab] ="PayrollManagement"
     session[:active_tab1] ="SalaryProcess"
     session[:active_tab2] = "SalarySlip"
  end

  def salary_slip_list
    @employee = Employee.find(params[:format])
    authorize! :show, @employee
    @salray_slips = Salaryslip.where('employee_id= ?', @employee.id).order('salary_slip_code desc').only(:order, :where)
    # @salray_slips = Salaryslip.where('employee_id= ?', @employee.id).sort_by(&:salary_slip_code)
  end


  def search_by_slip_detail
    reporter(Salaryslip.all, template_class: PdfReportTemplate) do
      # filter :current_status, type: :string
      #column(:Request_ID, sortable: true) { |employee_leav_request| employee_leav_request.id }
      column(:ID, sortable: true) { |salaryslip| salaryslip.id }
      column(:EID, sortable: true) { |salaryslip| salaryslip.employee_id }
      column(:WID, sortable: true) { |salaryslip| salaryslip.workingday_id }
    end
  end

  def show_salaryslip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @leave_details = LeaveDetail.where(salaryslip_id: @salaryslip.id)
    @slip_information = SlipInformation.find_by(salaryslip_id: @salaryslip.id)
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

  def show_salaryslip_rg
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @leave_details = LeaveDetail.where(salaryslip_id: @salaryslip.id)
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

  def show_month_salaryslip_rg
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
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


  def show_salaryslip_formate_3
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    # @employee_leav_balance = EmployeeLeavBalance.find_by()
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    unless @advance_salary.nil?
      @instalments = @advance_salary.instalments
      @instalments.try(:each) do |i|
        unless i.instalment_date.nil?
          if i.try(:instalment_date).DATEFORMAT('%B') == params['month'] && i.try(:instalment_date).DATEFORMAT('%Y') == params['year']
            @instalment_array << i
          end
        end
      end
    end
  end

  def print_salary_slip_formate_3
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
        render pdf: 'print_salary_slip_formate_3',
        layout: 'pdf.html',
        :orientation      => 'Landscape', # default , Landscape
        template: 'salaryslips/print_salary_slip_formate_3.pdf.erb',
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top => 20, :bottom => 30, :left   => 10, :right  => 10},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def emp_contibution_salary_list
    @employees = Employee.find_by_role(current_user)
    # authorize! :show, @employees
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "CTCReport"
  end

  def emp_contribution_slip_list
    @employee = Employee.find(params[:format])
    authorize! :show, @employee
    @salray_slips = Salaryslip.where('employee_id= ?', @employee.id)
  end

  def show_emp_contribution_salaryslip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:format])
    @sal_slip_date = Salaryslip.where(id: @salaryslip.id).pluck(:month_year)
    @emp_contribution = EmployerContribution.where(employee_id: @salaryslip.employee_id,date: @sal_slip_date).take
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
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

  def print_emp_contribution_slip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:id])
    @sal_slip_date = Salaryslip.where(id: @salaryslip.id).pluck(:month_year)
    @emp_contribution = EmployerContribution.where(employee_id: @salaryslip.employee_id,date: @sal_slip_date).take
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
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
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_emp_contribution_slip',
        layout: 'pdf.html',
        :orientation      => 'Landscape', # default , Landscape
        template: 'salaryslips/emp_contribution_slip_pdf.pdf.erb',
        :page_height  => 1000,
        :dpi          => '300',
        :margin       => {:top => 20,:bottom => 30,:left => 20,:right => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def print_salary_slip
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:id])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @leave_details = LeaveDetail.where(salaryslip_id: @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @slip_information = SlipInformation.find_by(salaryslip_id: @salaryslip.id)
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_salary_slip',
        layout: 'pdf.html',
        :orientation      => 'Landscape', # default , Landscape
        template: 'salaryslips/print_salary_slip.pdf.erb',
        :page_height  => 1000,
        :dpi          => '300',
        :margin       => {:top => 20,:bottom => 30,:left => 10,:right => 10},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def print_salary_slip_rg
    @instalment_array = []
    @salaryslip = Salaryslip.find(params[:id])
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    @leave_details = LeaveDetail.where(salaryslip_id: @salaryslip.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_salary_slip_rg',
        layout: 'pdf.html',
        :orientation  => 'Landscape', # default , Landscape
        :page_height  => 1000,
        :dpi          => '300',
        template: 'salaryslips/print_salary_slip_rg.pdf.erb',
        :page_height  => 1000,
        :dpi          => '300',
        :margin       => {:top    => 10, :bottom => 10,:left   => 10,:right  => 10},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def select_month_year_form
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    # session[:active_tab2] ="Advance"
    @employees = JoiningDetail.all
  end

  def show_unsaved_employee
    @month = params[:month]
    @year = params[:year]
    @workingdays = Workingday.where(month_name: @month, year: @year).pluck(:employee_id)
    @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    emp_ids = @workingdays - @salaryslips
      if current_user.class == Group
        @employees = Employee.where(status: "Active",id: emp_ids) 
      elsif current_user.class == Member
        if current_user.role.name == "GroupAdmin"
          @employees = Employee.where(id: emp_ids)
        elsif current_user.role.name == "Admin"
          company_employees = Employee.where(status: "Active",company_id: current_user.company_location.company_id).pluck(:id)
          new_ids = company_employees & emp_ids
          @employees = Employee.where(id: new_ids)
        elsif current_user.role.name == "Branch"
          location_employees = Employee.where(status: "Active",company_location_id: current_user.company_location_id).pluck(:id)
          new_ids = location_employees & emp_ids
          @employees = Employee.where(id: new_ids)
        elsif current_user.role.name == "HOD"
          department_employees = Employee.where(status: "Active",department_id: current_user.company_location_id)
          new_ids = department_employees & emp_ids
          @employees = Employee.where(id: new_ids)
        end
      end
    end

  def save_all_data
    employee_ids = params[:employee_ids]
    @month = params[:month]
    @year = params[:year]
    if employee_ids.nil? || employee_ids.empty?
      flash[:alert] = 'Please select employees.'
      redirect_to select_month_year_form_salaryslips_path
    else
      ActiveRecord::Base.try(:transaction) do
        employee_ids.try(:each) do |eid|
          @instalment_array = []
          @salaryslip_component_array = []
          @employee = Employee.find_by(id: eid)
          working_day = Workingday.where(employee_id: eid, month_name: @month, year: @year).take
          current_template = EmployeeTemplate.where('employee_id = ? and is_active = ?', @employee.id, true).take
          next if current_template.nil?
          addable_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', false)
          deducted_salary_items = current_template.employee_salary_templates.where('is_deducted = ?', true)

          addable_total_actual_amount = 0
          addable_total_calculated_amount = 0
          addable_salary_items.try(:each) do |item|
            addable_calculated_amount = 0
            @template_id = item.salary_template_id
            addable_actual_amount = item.monthly_amount
  #          if item.salary_component_id == 2
  #           if addable_actual_amount.nil?
  #             addable_actual_amount = 0
  #             addable_calculated_amount = 0
  #           else
  #             addable_calculated_amount = addable_actual_amount
  #           end
  #          else
  #           if addable_actual_amount.nil?
  #             addable_actual_amount = 0
  #             addable_calculated_amount = 0
  #           else
  # addable_calculated_amount = addable_actual_amount / working_day.day_in_month * working_day.payable_day
  #           end
  #          end
            addable_total_actual_amount += addable_actual_amount
            addable_total_calculated_amount += addable_calculated_amount.round
            @addable_salaryslip_item = SalaryslipComponent.new do |sc|
              sc.salary_component_id = item.salary_component_id
              sc.actual_amount = addable_actual_amount
              sc.calculated_amount = addable_calculated_amount.round
              sc.is_deducted = false
            end
            @salaryslip_component_array << @addable_salaryslip_item
          end

          deducted_actual_amount = 0
          deducted_calculated_amount = 0
          deducted_total_actual_amount = 0
          deducted_total_calculated_amount = 0

          @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
          @advance_salaries.try(:each) do |a|
            @instalments = a.instalments
            @instalments.try(:each) do |i|
              unless i.instalment_date.nil?
                if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
                   i.update(is_complete: true)
                  @instalment_array << i
                end
              end
            end
          end

          @instalment_array.try(:each) do |ia|
            deducted_actual_amount = ia.instalment_amount
            deducted_calculated_amount = deducted_actual_amount
            deducted_total_actual_amount += deducted_actual_amount
            deducted_total_calculated_amount += deducted_calculated_amount
          end

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

          # date = Date.new(@year.to_i, Workingday.months[@month])
          # @latemark_deductions = LatemarkDeduction.where(latemark_day: date..date.at_end_of_month, employee_id: @employee.id)
          # unless @latemark_deductions.empty?
          #   @latemark_deductions.each do |f|
          #     f.update(paid: true)
          #     deducted_actual_amount = 0
          #     deducted_calculated_amount = f.latemark_amount
          #     deducted_total_actual_amount += deducted_actual_amount
          #     deducted_total_calculated_amount += deducted_calculated_amount
          #   end
          # end

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
          @salaryslip = Salaryslip.last
          @employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employee.id)
            @employee_leav_balances.each do |elb|
              if elb.is_active == true
                @particular_leave_records = ParticularLeaveRecord.where(employee_id: elb.employee_id,leav_category_id: elb.leav_category_id)
               
              leave_count = 0
                @particular_leave_records.each do |plr|
                  @date = plr.leave_date
                  month = @date.strftime("%B")
                  year = @date.strftime("%Y")
                  if @salaryslip.month == month && @salaryslip.year == year
                    leave_count = leave_count + 1
                  end
                end
                 LeaveDetail.create_leave_detail_information(@salaryslip, elb,leave_count)
              end
            end
           
            #texable
            # @texable_amount = TexableAmount.find_by(employee_id: @employee.id)
            # @salaryslip = Salaryslip.where(employee_id: @employee.id,month: @month,year: @year).take
            #   TexableMonthlyDeduction.new do |tmd|
            #     tmd.employee_id = @employee.id
            #     tmd.salayslip_id = @salaryslip.id
            #     tmd.texable_deducted_amount = @texable_amount.try(:monthly).to_f
               
            #     tmd.save!
            #   end
            #   @texable_monthly_deduction = TexableMonthlyDeduction.where(employee_id: @employee.id,salayslip_id: @salaryslip.id).take
            #   @salary_component = SalaryComponent.find_by(name: "Income Tax 1")
            #   SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @texable_monthly_deduction.texable_deducted_amount, calculated_amount: @texable_monthly_deduction.texable_deducted_amount, is_deducted: true, other_component_name: 'Income Tax 1',salary_component_id: @salary_component.id)

              formula_item_actual_amount = 0
              formula_item_calculated_amount = 0
              formula_total_actual_amount = 0
              formula_total_calculated_amount = 0

            if @employee.joining_detail.ot_option == true && working_day.ot_hours != 0
              @payroll_overtime_masters = PayrollOvertimeMaster.where(is_active: true,is_payroll: true)
              @payroll_overtime_masters.try(:each) do |pom|
                formula_string = pom.base_component.split(',').map {|i| i.to_i}
                formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id) 
                @total = formula_item.sum(:calculated_amount)
                @total_actual = formula_item.sum(:actual_amount)
                base_amount = (@total_actual.to_f / working_day.try(:day_in_month).to_f) / pom.company_hrs.to_f
                overtime_payment = working_day.try(:ot_hours).to_f * pom.rate.to_f * base_amount.to_f
                @salary_component = SalaryComponent.find_by(name: "Overtime")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: 0, calculated_amount: overtime_payment,
                  is_deducted: false, other_component_name: 'Overtime',salary_component_id: @salary_component.id)
              end
            end
            transport_allowance = TransportAllowance.find_by_employee_id(@employee.id)
            unless transport_allowance.nil?
              if transport_allowance.option
                addable_actual_amount = 0
                addable_calculated_amount = transport_allowance.amount * working_day.try(:payable_day)/working_day.try(:day_in_month)
                @salary_component = SalaryComponent.find_by(name: "Transport Allowance")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: addable_calculated_amount, calculated_amount: addable_calculated_amount,
                 is_deducted: false, other_component_name: 'Transport Allowance',salary_component_id: @salary_component.id)
              end
            end

            date = Date.new(@year.to_i, Workingday.months[@month])
            @monthly_arrears = MonthlyArrear.where(day: date..date.at_end_of_month, employee_id: @employee.id)
            unless @monthly_arrears.empty?
              addable_calculated_amount = 0
                @monthly_arrears.try(:each) do |m|
                  m.update(is_paid: true)
                  addable_actual_amount = 0
                  addable_calculated_amount = addable_calculated_amount + m.amount
                end
              @salary_component=SalaryComponent.find_by(name: "Monthly Arrear")
              SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: 0, calculated_amount: addable_calculated_amount,
                is_deducted: false,other_component_name: 'Monthly Arrear', salary_component_id:  @salary_component.id)
            end

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
                @salary_component = SalaryComponent.find_by(name: "Provident Fund")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount,
                  is_deducted: true, other_component_name: 'Provident Fund',salary_component_id: @salary_component.id)
              end
            end


            @master_esic = EsicMaster.where(is_active: true).take
            if @master_esic.nil?
            else
              if @master_esic.esic && addable_total_calculated_amount <= @master_esic.max_limit && @employee.joining_detail.have_esic
                formula_string = @master_esic.base_component.split(',').map {|i| i.to_i}
                formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                @total_actual = formula_item.sum(:actual_amount)
                @total = formula_item.sum(:calculated_amount)
                formula_item_actual_amount = @total_actual
                formula_item_calculated_amount = @total
                deducted_actual_amount = (formula_item_actual_amount / 100 * @master_esic.percentage).ceil
                deducted_calculated_amount = (formula_item_calculated_amount / 100 * @master_esic.percentage).ceil
                @salary_component = SalaryComponent.find_by(name: "ESIC")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount,
                  is_deducted: true, other_component_name: 'ESIC',salary_component_id: @salary_component.try(:id))
              end
            end

                formula_item_actual_amount = 0
                formula_item_calculated_amount = 0
                formula_total_actual_amount = 0
                formula_total_calculated_amount = 0
                formula_minimum_wages = 0

              @da = DearnessAllowance.where(is_active: true).take
              if @da.nil?
              else
                if @da.is_active && @employee.joining_detail.is_da
                  formula_string = @da.base_component.split(',')
                    formula_string.try(:each) do |f|
                      formula_item = addable_salary_items.where(salary_component_id: f.to_i).take
                      formula_item_actual_amount = formula_item.try(:monthly_amount)
                      formula_item_actual_amount = 0 if formula_item_actual_amount.nil?
                      formula_total_actual_amount += formula_item_actual_amount
                      formula_item_calculated_amount = formula_item_actual_amount / working_day.try(:day_in_month) * working_day.try(:payable_day)
                      formula_minimum_wages = @da.minimum_wages.to_f / working_day.try(:day_in_month) * working_day.try(:payable_day)
                      formula_total_calculated_amount += formula_item_calculated_amount
                    end
                  addable_actual_amount = (@da.minimum_wages.to_f - formula_total_actual_amount.to_f)
                  addable_calculated_amount = (formula_minimum_wages - formula_total_calculated_amount.to_f)
                  a=addable_actual_amount.to_f
                  if @da.minimum_wages.to_f < a
                  else
                     if @da.minimum_wages.to_f > a
                      @salary_component = SalaryComponent.find_by(name: "DA")
                      b=SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: addable_actual_amount, calculated_amount: addable_calculated_amount,
                       is_deducted: false, other_component_name: 'DA',salary_component_id: @salary_component.try(:id))
                     end
                  end
                  if b.try(:actual_amount).to_f < 0
                     SalaryslipComponent.where(id: b.id).destroy_all
                    else
                  end
                end
              end

              @professional_tax_masters = ProfessionalTaxMaster.where(is_active: true)
              @professional_tax_masters.try(:each) do |s|
                formula_string = s.base_component.split(',').map {|i| i.to_i}
                formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                @total = formula_item.sum(:calculated_amount)
                @total_actual = formula_item.sum(:actual_amount)
                  if s.basis_actual_amount == true
                    if @total_actual.between?(s.min_amount, s.max_amount) && @month != "February" && @employee.company_location_id == s.company_location_id
                      @salary_component = SalaryComponent.find_by(name: "Professional Tax")
                      SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: s.for_month, calculated_amount: s.for_month,
                        is_deducted: true, other_component_name: 'Professional Tax',salary_component_id: @salary_component.id)           
                    elsif @month == 'February' && @total_actual.between?(s.min_amount, s.max_amount) && @employee.company_location_id == s.company_location_id
                      @salary_component = SalaryComponent.find_by(name: "Professional Tax")
                      SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: s.march_amount, calculated_amount: s.march_amount,
                        is_deducted: true, other_component_name: 'Professional Tax',salary_component_id: @salary_component.id)
                    end
                  else
                    if @total.between?(s.min_amount, s.max_amount) && @month != "February" && @employee.company_location_id == s.company_location_id
                      @salary_component = SalaryComponent.find_by(name: "Professional Tax")
                      SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: s.for_month, calculated_amount: s.for_month,
                        is_deducted: true, other_component_name: 'Professional Tax',salary_component_id: @salary_component.id)
                    elsif @month == 'February' && @total.between?(s.min_amount, s.max_amount) && @employee.company_location_id == s.company_location_id
                      @salary_component = SalaryComponent.find_by(name: "Professional Tax")
                      SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: s.march_amount, calculated_amount: s.march_amount,
                        is_deducted: true, other_component_name: 'Professional Tax',salary_component_id: @salary_component.id)
                    end
                end
              end

              if @employee.joining_detail.have_retention == true     
                @retention = RetentionMoney.where(is_active: true).take
                if @retention.nil?
                else
                  if @retention.have_retention == true
                    formula_string = @retention.base_component.split(',').map {|i| i.to_i}
                    formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                    @total = formula_item.sum(:calculated_amount)
                    @total_actual = formula_item.sum(:actual_amount)
                    formula_item_calculated_amount = (@total / working_day.try(:day_in_month) * working_day.try(:payable_day))
                    formula_item_actual_amount = (@total_actual / working_day.try(:day_in_month) * working_day.try(:payable_day))
                    deducted_actual_amount = (formula_item_actual_amount / 100 * @retention.persent).ceil
                    deducted_calculated_amount = (formula_item_calculated_amount / 100 * @retention.persent).ceil
                    @salary_component = SalaryComponent.find_by(name: "Retention")
                    SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount,
                      is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
                  else
                    if @retention.have_retention == false
                      @salary_component = SalaryComponent.find_by(name: "Retention")
                      SalaryslipComponent.create(salaryslip_id: @salaryslip.try(:id), actual_amount: @retention.try(:amount), calculated_amount: @retention.try(:amount),
                        is_deducted: true, other_component_name: 'Retention',salary_component_id: @salary_component.try(:id))
                    end
                  end
                end
              end

              @well_faires = WellFaire.all
              unless @well_faires.empty?
                deducted_calculated_amount = 0
                @well_faires.try(:each) do |w|
                 if @month == w.month and @employee.joining_detail.welfare == true
                    deducted_actual_amount = 0
                    deducted_calculated_amount = deducted_calculated_amount + w.amount
                    @salary_component = SalaryComponent.find_by(name: "WelFare")
                    SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: w.amount, calculated_amount: w.amount,
                      is_deducted: true, other_component_name: 'WelFare',salary_component_id: @salary_component.try(:id))
                  end
                end
              end

              society = SocietyMemberShip.find_by_employee_id(@employee.id)
              unless society.nil?
                if society.is_society_member
                  deducted_actual_amount = 0
                  deducted_calculated_amount = society.amount
                  @salary_component = SalaryComponent.find_by(name: "Society")
                  SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_calculated_amount, calculated_amount: deducted_calculated_amount,
                    is_deducted: true, other_component_name: 'Society',salary_component_id: @salary_component.id)
                end
              end

              date = Date.new(@year.to_i, Workingday.months[@month])
              @food_deductions = FoodDeduction.where(food_date: date..date.at_end_of_month, employee_id: @employee.id)
              unless @food_deductions.empty?
                deducted_calculated_amount = 0
                  @food_deductions.each do |f|
                    f.update(is_paid: true)
                    deducted_actual_amount = 0
                    deducted_calculated_amount = deducted_calculated_amount + f.amount
                  end
                @salary_component = SalaryComponent.find_by(name: "Food Deduction")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount,
                  is_deducted: true, other_component_name: 'Food Deduction',salary_component_id: @salary_component.id)
              end

              date = Date.new(@year.to_i, Workingday.months[@month])
              @latemark_deductions = LatemarkDeduction.where(latemark_day: date..date.at_end_of_month, employee_id: @employee.id)
              unless @latemark_deductions.empty?
                deducted_calculated_amount = 0
                  @latemark_deductions.each do |f|
                    f.update(paid: true)
                    deducted_actual_amount = 0
                    deducted_calculated_amount = deducted_calculated_amount + f.latemark_amount
                  end
                @salary_component = SalaryComponent.find_by(name: "Latemark Deduction")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_calculated_amount,
                  is_deducted: true, other_component_name: 'Latemark Deduction',salary_component_id: @salary_component.id)
              end

              unless @instalment_array.empty?
                deducted_calculated_amount = 0
                deducted_actual_amount = 0
                @instalment_array.each do |ia|
                  deducted_actual_amount = deducted_actual_amount + ia.instalment_amount       
                  Instalment.find(ia).update(is_complete: true)
                end
                @salary_component = SalaryComponent.find_by(name: "Advance")
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: deducted_actual_amount, calculated_amount: deducted_actual_amount,
                  is_deducted: true, other_component_name: 'Advance',salary_component_id: @salary_component.id)
              end


              @monthly_expences = MonthlyExpence.where(employee_id: @employee.id, expence_date: date.all_month)
              @salary_component=SalaryComponent.find_by(name: "Mobile Deduction")
              @salary_comp=SalaryComponent.find_by(name: "Other Deduction")
              @salary_compon=SalaryComponent.find_by(name: "Income Tax")
              @salary_compon1=SalaryComponent.find_by(name: "GMC")
              @bank_loan_compon=SalaryComponent.find_by(name: "Bank Loan")
              @mobile_deduction = 0
              @income_tax_deduction = 0
              @other_deduction = 0
              @gmk_deduction = 0
              @bank_loan = 0
              @latemark_deduction = 0
              @monthly_expences.try(:each) do |m|
                if m.expencess_type.name == @salary_component.name
                 @mobile_deduction = @mobile_deduction + m.amount
                elsif m.expencess_type.name == @salary_comp.name
                  @other_deduction = @other_deduction + m.amount
                elsif m.expencess_type.name == @salary_compon.name
                  @income_tax_deduction = @income_tax_deduction + m.amount
                elsif m.expencess_type.name == @salary_compon1.name
                  @gmk_deduction = @gmk_deduction + m.amount
                elsif m.expencess_type.name == @bank_loan_compon.name
                  @bank_loan = @bank_loan + m.amount
                end

              end
              if @salary_component.name &&  @salary_component.is_active == true
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @mobile_deduction, calculated_amount: @mobile_deduction,
                  is_deducted: true, other_component_name: @salary_component.name,salary_component_id:  @salary_component.id)
              end
              if @salary_comp.name &&  @salary_comp.is_active == true
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @other_deduction, calculated_amount: @other_deduction,
                  is_deducted: true, other_component_name: @salary_comp.name,salary_component_id:  @salary_comp.id)
              end
              if @salary_compon.name && @salary_compon.is_active == true
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @income_tax_deduction, calculated_amount: @income_tax_deduction,
                  is_deducted: true, other_component_name: @salary_compon.name,salary_component_id:  @salary_compon.id)
              end
              if @salary_compon1.name && @salary_compon1.is_active == true
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @gmk_deduction, calculated_amount: @gmk_deduction,
                  is_deducted: true, other_component_name: @salary_compon1.name,salary_component_id:  @salary_compon1.id)
              end

              if @bank_loan_compon.name && @bank_loan_compon.is_active == true
                SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: @bank_loan, calculated_amount: @bank_loan,
                  is_deducted: true, other_component_name: @bank_loan_compon.name,salary_component_id:  @bank_loan_compon.id)
              end
 
              # BonusEmployee.create_bonus(basic_calculated_amount, @employee.id, date)

              if @employee.joining_detail.is_employeer_esic == true || @employee.joining_detail.is_insurance == true || @employee.joining_detail.is_employeer_pf == true ||
                @employee.joining_detail.is_family_pension == true || @employee.joining_detail.is_bonus == true
                a = EmployerContribution.create_contribution(@employee.id)
                  if @employee.joining_detail.is_employeer_esic == true
                    @esic_employer = EsicEmployer.where(is_active: true).take
                    if @esic_employer.nil?
                    else
                      formula_string = @esic_employer.base_component.split(',').map {|i| i.to_i}
                      formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                      @total = formula_item.sum(:calculated_amount)
                      @total_actual = formula_item.sum(:actual_amount)
                      formula_item_calculated_amount = (@total_actual / 100 * @esic_employer.percentage).ceil
                      formula_item_actual_amount = (@total_actual / 100 * @esic_employer.percentage).ceil
                      @e1=EmployerContribution.where(id: a.id).update_all(date: date,esic: formula_item_calculated_amount,actual_esic: formula_item_actual_amount)
                    end
                  end

                  if @employee.joining_detail.is_employeer_pf == true
                    @pf_employer = PfEmployer.where(is_active: true).take
                    if @pf_employer.nil?
                    else
                      formula_string = @pf_employer.base_component.split(',').map {|i| i.to_i}
                      formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                      @total = formula_item.sum(:calculated_amount)
                      @total_actual = formula_item.sum(:actual_amount)
                      formula_item_calculated_amount = (@total / 100 * @pf_employer.percentage).ceil
                      formula_item_actual_amount = (@total_actual / 100 * @pf_employer.percentage).ceil
                      @e1=EmployerContribution.where(id: a.id).update_all(date: date,pf: formula_item_calculated_amount,actual_pf: formula_item_actual_amount)
                    end
                  end

                  if @employee.joining_detail.is_insurance == true
                    @employer_insurance = EmployerInsurance.where(is_active: true).take
                    if @employer_insurance.nil?
                    else
                      formula_string = @employer_insurance.base_component.split(',').map {|i| i.to_i}
                      formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                      @total = formula_item.sum(:calculated_amount)
                      @total_actual = formula_item.sum(:actual_amount)
                      formula_item_calculated_amount = (@total / 100 * @employer_insurance.percentage).ceil
                      formula_item_actual_amount = (@total_actual / 100 * @employer_insurance.percentage).ceil
                      @e1=EmployerContribution.where(id: a.id).update_all(date: date,insurance: formula_item_calculated_amount,actual_insurance: formula_item_actual_amount)
                    end
                  end

                  if @employee.joining_detail.is_family_pension == true
                    @employer_family_pension = EmployerFamilyPension.where(is_active: true).take
                    if @employer_family_pension.nil?
                    else
                      formula_string = @employer_family_pension.base_component.split(',').map {|i| i.to_i}
                      formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                      @total = formula_item.sum(:calculated_amount)
                      @total_actual = formula_item.sum(:actual_amount)
                      formula_item_calculated_amount = (@total / 100 * @employer_family_pension.percentage).ceil
                      formula_item_actual_amount = (@total_actual / 100 * @employer_family_pension.percentage).ceil
                      @e1=EmployerContribution.where(id: a.id).update_all(date: date,fp: formula_item_calculated_amount,actual_fp: formula_item_actual_amount)
                    end
                  end

                if @employee.joining_detail.is_bonus == true
                  @bonus_employer = BonusEmployer.where(is_active: true).take
                  if @bonus_employer.nil?
                  else
                    formula_string = @bonus_employer.base_component.split(',').map {|i| i.to_i}
                    formula_item = SalaryslipComponent.where(salary_component_id: formula_string,salaryslip_id: @salaryslip.id)
                    @total = formula_item.sum(:calculated_amount)
                    @total_actual = formula_item.sum(:actual_amount)
                    if @total <= @bonus_employer.limit_amount && @total_actual <= @bonus_employer.limit_amount
                      formula_item_calculated_amount = (@total / 100 * @bonus_employer.percentage).ceil
                      formula_item_actual_amount = (@total_actual / 100 * @bonus_employer.percentage).ceil
                      @e1=EmployerContribution.where(id: a.id).update_all(date: date,bonus: formula_item_calculated_amount,actual_bonus: formula_item_actual_amount)
                    else
                      formula_item_calculated_amount = (@bonus_employer.limit_amount / 100 * @bonus_employer.percentage).ceil
                      formula_item_actual_amount = (@bonus_employer.limit_amount / 100 * @bonus_employer.percentage).ceil
                      @e2=EmployerContribution.where(id: a.id).update_all(date: date,bonus: formula_item_calculated_amount,actual_bonus: formula_item_actual_amount)
                    end
                  end
                end
              end
              @salaryslip = Salaryslip.last
              @salaryslip_component1 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id)
              @salaryslip_component2 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: true)
              @salaryslip_component3 = SalaryslipComponent.where(salaryslip_id: @salaryslip.id,is_deducted: false)
             
              actual_gross_salary = @salaryslip_component3.sum(:actual_amount).to_f
              calculated_gross_salary = @salaryslip_component3.sum(:calculated_amount)
              actual_amount = @salaryslip_component1.sum(:actual_amount).to_f
              calculated_amount = @salaryslip_component1.sum(:calculated_amount).to_f
              actual_total_deduction = @salaryslip_component2.sum(:actual_amount).to_f
              calculated_total_deduction = @salaryslip_component2.sum(:calculated_amount).to_f
              actual_net_salary = actual_gross_salary - actual_total_deduction
              calculated_net_salary = calculated_gross_salary - calculated_total_deduction

              Salaryslip.where(id: @salaryslip.id).update_all(actual_gross_salary: actual_gross_salary,actual_total_deduction: actual_total_deduction,actual_net_salary: actual_net_salary,calculated_gross_salary: calculated_gross_salary,calculated_total_deduction: calculated_total_deduction,calculated_net_salary: calculated_net_salary)


              Workingday.where(employee_id: eid, month_name: @month, year: @year).update_all(paid: true)


          # @arrear = EmployeeArrear.where('employee_id = ? and is_paid = ?', @employee.id, false).take
          # next if @arrear.nil?
          # arrear_start_date = @arrear.start_date
          # arrear_start_month = arrear_start_date.strftime('%-m').to_i
          # arrear_start_year = arrear_start_date.strftime('%Y').to_i
          # arrear_end_month = Workingday.months[@month]
          # arrear_end_year = params['year'].to_i
          # arrear_working_days = Workingday.where(employee_id: @employee.id, month: arrear_start_month..arrear_end_month, year: arrear_start_year..arrear_end_year)
          # @total_payable_days = arrear_working_days.sum('payable_day')
          # @arrear_items = @arrear.employee_arrear_items

          # number_of_months = (arrear_end_date.year*12+arrear_end_date.month)-(arrear_start_date.year*12+arrear_start_date.month)

          # dates = number_of_months.times.each_with_object([]) do |count, array|
          #   array << [arrear_start_date.beginning_of_month + count.months,arrear_start_date.end_of_month + count.months]
          # end

          # @arrear_items.try(:each) do |ai|
          #   dates.each do |start_instance,end_instance|
          #     arrear_calculated_amount = ((ai.actual_amount / start_instance.end_of_month.day) * @total_payable_days).round
          #   end
          #   SalaryslipComponent.create(salaryslip_id: @salaryslip.id, actual_amount: ai.actual_amount, calculated_amount: arrear_calculated_amount, is_deducted: ai.is_deducted, is_arrear: true, salary_component_id: ai.salary_component_id)
          # end
         
          # current template nil

        end # employee_ids loop
      # end
      flash[:notice] = 'All Salary processed.'
      redirect_to select_month_year_form_salaryslips_path
    end # if for employee_ids.nil?
  end # action end
end

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
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
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

  # def display_salaryslip_report
  #   @month = params[:month]
  #   @year = params[:year]
  #   # byebug
  #   @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s)
  #   @salaryslips1 = Salaryslip.where(month: @month.to_s, year: @year.to_s).take
  #   # @bonus_employees = BonusEmployee.where(employee_id: @salaryslips.employee_id,date: )
  #   @salaryslips.each do |s|
  #   @bonus_employees = BonusEmployee.where(employee_id: s.employee_id).group(:employee_id)
  #   @employeer_pfs = EmployeerPf.where(employee_id: s.employee_id).group(:employee_id)
  #   @employeer_esic = EmployeerEsic.where(employee_id: s.employee_id).group(:employee_id)
  # end
  #   session[:active_tab] ="payroll"
  #   session[:active_tab1] ="salaryreport"
  # end

  def display_salaryslip_report
    @month = params[:month]    
    @year = params[:year]
    @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s)
    @salaryslips.each do |s|
      a=s.employee
    end
    @salaryslips_1 = Salaryslip.where(month: @month.to_s, year: @year.to_s).pluck(:employee_id)
    @salaryslips_1_date = Salaryslip.where(month: @month.to_s, year: @year.to_s).pluck(:month_year)
    @emp_contribution = EmployerContribution.where(employee_id: @salaryslips_1,date: @salaryslips_1_date)
  end

  def pdf_report
    @month = params[:month]
    @year = params[:year]
    @salary1 = params[:slaryslip_ids]
    @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s,id: @salary1).group(:employee_id)
    @salaryslips1 = Salaryslip.where(month: @month.to_s, year: @year.to_s,id: @salary1).take
    # @bonus_employees = BonusEmployee.where(employee_id: @salaryslips.employee_id,date: )
    @bonus_employees = BonusEmployee.where(employee_id: @salaryslips1.try(:employee_id)).group(:employee_id)
    @employeer_pfs = EmployeerPf.where(employee_id: @salaryslips1.try(:employee_id)).group(:employee_id)
    @employeer_esic = EmployeerEsic.where(employee_id: @salaryslips1.try(:employee_id)).group(:employee_id)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'pdf_report',
        layout: '/layouts/pdf.html.erb',
        :template => 'salaryslips/pdf_report.pdf.erb',
        :orientation  => 'Landscape', # default , Landscape
        :page_height  => 1000,
        :dpi          => '300',
        :margin       => {:top => 10, :bottom => 10, :left => 20, :right => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def salaryslip_xls
    @month = params[:month]
    @year = params[:year]
    @salaryslips = Salaryslip.where(month: @month.to_s, year: @year.to_s).group(:employee_id)
    @salaryslips1 = Salaryslip.where(month: @month.to_s, year: @year.to_s).take
    # @bonus_employees = BonusEmployee.where(employee_id: @salaryslips.employee_id,date: )
      @salaryslips.each do |s|
        @bonus_employees = BonusEmployee.where(employee_id: s.employee_id).group(:employee_id)
        @employeer_pfs = EmployeerPf.where(employee_id: s.employee_id).group(:employee_id)
        @employeer_esic = EmployeerEsic.where(employee_id: s.employee_id).group(:employee_id)
      end
      respond_to do |format|
        format.xls {render template: 'salaryslips/salaryslip_xls.xls.erb'}
      end
  end

  def dynamic_report
    @month = params[:salaryslip][:month]
    @year = params[:salaryslip][:year]
    @company = params[:salaryslip][:company_id]
    @company_location = params[:salaryslip][:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s)
      elsif @company_location == ""
        @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Admin'
         if @company == ""
          @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s).where(employee_id: @employees)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Branch'
          if @company == "" || @company_location == ""
          @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
          else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'HOD'
          if @company == "" || @company_location == ""
          @employees = Employee.where(status: 'Active',department_id: current_user.department_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def salary_slip_xls
    @month = params[:salaryslip] ?  params[:salaryslip][:month] : params[:month]
    @year = params[:salaryslip] ?  params[:salaryslip][:year] : params[:year]
    @company = params[:salaryslip] ?  params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ?  params[:salaryslip][:company_location_id] : params[:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s)
      elsif @company_location == ""
        @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
        @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Admin'
         if @company == ""
          @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s).where(employee_id: @employees)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Branch'
          if @company == "" || @company_location == ""
          @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
          else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'HOD'
          if @company == "" || @company_location == ""
          @employees = Employee.where(status: 'Active',department_id: current_user.department_id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
    end
    respond_to do |format|
      format.xls {render template: 'salaryslips/salary_slip_xls.xls.erb'}
    end
  end

  def salary_slip_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
        @employees = Employee.where(status: 'Active',company_id: @company.to_i)
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
      elsif @company == ""
        @employees = Employee.where(status: 'Active',company_location_id: @location.to_i)
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i)
        @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: 'Active',company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: 'Active',company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: 'Active',company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
          @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'salary_slip_pdf',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salaryslips/salary_slip_pdf.pdf.erb',
        :page_height  => 1000,
        :dpi          => '300',
        :margin       => {:top => 10,:bottom => 10,:left => 20,:right => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def dynamic_daterange_report
    start_date = params[:salaryslip][:start_date].to_date
    end_date = params[:salaryslip][:end_date].to_date
    @company = params[:salaryslip][:company_id]
    @location = params[:salaryslip][:company_location_id]
   
    if current_user.class == Group
      if @company == ""
        @salaryslips = Salaryslip.where(month_year: start_date..end_date)
      elsif @location == "" || @location == nil
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if  @company == ""
          @salaryslips = Salaryslip.where(month_year: start_date..end_date)
        elsif @location == "" || @location == nil
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @salaryslips = Salaryslip.where(month_year: start_date..end_date)
        elsif @location == "" || @location == nil
          @employees = Employee.where(status: "Active",company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == ""
          @employees = Employee.where(status: "Active").pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        elsif @location == "" || @location == nil
          @employees = Employee.where(status: "Active",company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
      respond_to do |f|
        f.js
        f.xls {render template: 'salaryslips/salary_slip_xls.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'wellfair_dynamic_report',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'salaryslips/salary_slip.pdf.erb',
          show_as_html: params[:debug].present?
        end
      end
    # respond_to do |format|
    #   format.xls {render template: 'salaryslips/salary_slip_xls.xls.erb'}
    # end
  end

  def daterangewise_salaryslip_xls
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(status: "Active",company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: "Active",company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(status: "Active",company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: "Active",company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(status: "Active",company_id: @company.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: "Active",company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(status: "Active",company_location_id: current_user.company_location_id)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(status: "Active",company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        else
          @employees = Employee.where(status: "Active",company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips = Salaryslip.where(month_year: start_date..end_date).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salaryslips/salary_slip_xls.xls.erb'}
    end
  end

  def show_employee
    @month = params[:month]
    @year = params[:year]
    if current_user.class == Group
      @salaryslips = Salaryslip.where(month: @month, year: @year.to_s,is_confirm: nil)
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @salaryslips = Salaryslip.where(month: @month, year: @year.to_s,is_confirm: nil)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @salaryslips = Salaryslip.where(month: @month, year: @year.to_s, employee_id: @employees,is_confirm: nil)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @salaryslips = Salaryslip.where(month: @month, year: @year.to_s, employee_id: @employees,is_confirm: nil)
      end 
    end   
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
        @bonus_employees = BonusEmployee.where("DATE_FORMAT(bonus_date , '%m/%Y') = ? and employee_id = ?", date.strftime('%m/%Y'), @salaryslip.employee_id)       
        Instalment.where("DATE_FORMAT( instalment_date , '%m/%Y') = ? ", date.strftime('%m/%Y')).update_all(is_complete: false)
        MonthlyExpence.where("DATE_FORMAT(expence_date , '%m/%Y') = ? ", date.strftime('%m/%Y')).update_all(is_paid: false)
        FoodDeduction.where("DATE_FORMAT( food_date , '%m/%Y') = ? ", date.strftime('%m/%Y')).update_all(is_paid: false)
        LatemarkDeduction.where("DATE_FORMAT( latemark_day , '%m/%Y') = ? ", date.strftime('%m/%Y')).update_all(paid: false)
        # MonthlyArrear.where("DATE_FORMAT( day , '%m/%Y') = ? ", date.strftime('%m/%Y')).update_all(paid: false)
        @bonus_employees.destroy_all
        SalaryslipComponent.where(salaryslip_id: @salaryslip.id).destroy_all
        # TexableMonthlyDeduction.where(salayslip_id: @salaryslip.id).destroy_all
        SlipInformation.where(salaryslip_id: @salaryslip.id).destroy_all
        LeaveDetail.where(salaryslip_id: @salaryslip.id).destroy_all
        @salaryslip.destroy
        @workingdays = Workingday.where(employee_id: @salaryslip.employee_id, month_name: date.strftime("%B"), year: date.strftime("%Y"))
        @workingdays.destroy_all
        EmployerContribution.where(employee_id: @salaryslip.employee_id,date: @salaryslip.month_year).destroy_all
        EmployeeAttendance.where("DATE_FORMAT(day , '%m/%Y') = ? AND employee_id = ? ", date.strftime('%m/%Y'),@salaryslip.employee_id).update_all(is_confirm: false)
        EmployeeWeekOff.where("DATE_FORMAT(date , '%m/%Y') = ? AND employee_id = ? ", date.strftime('%m/%Y'),@salaryslip.employee_id).update_all(is_confirm: false)
      end
      flash[:notice] = "Revert successfully"
      redirect_to revert_salary_salaryslips_path
    end
  end

  def confirm_salaryslip
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
  end

  def show_unconfirmed_employee
    @month = params[:month]
    @year = params[:year]
    @salaryslips = Salaryslip.where(month: @month,year: @year,is_confirm: nil)

    if current_user.class == Group
      @salaryslips = Salaryslip.where(month: @month,year: @year,is_confirm: nil) 
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @salaryslips = Salaryslip.where(month: @month,year: @year,is_confirm: nil)
      elsif current_user.role.name == "Admin"
        company_employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: company_employees,is_confirm: nil)
      elsif current_user.role.name == "Branch"
        location_employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: location_employees,is_confirm: nil)
      elsif current_user.role.name == "HOD"
        department_employees = Employee.where(department_id: current_user.company_location_id)
        @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: department_employees,is_confirm: nil)
      end
    end
  end

  def Confirm_salaryslip
    @salaryslip_ids = params[:salaryslip_ids]
    if @salaryslip_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to confirm_salaryslip_salaryslips_path
    else
      @salaryslip_ids.each do |sid|
        @salaryslip = Salaryslip.find(sid)
        @salaryslip.update(is_confirm: true)
      end
      flash[:notice] = "Confirm successfully"
      redirect_to confirm_salaryslip_salaryslips_path
    end
  end

  def statutory_computation
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end
 
  def statutory_computation_report
    @from_date = params[:statutory_report] ? params[:statutory_report][:from_date] : params[:from_date]
    @to_date = params[:statutory_report] ? params[:statutory_report][:to_date] : params[:to_date]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]

    if @company.present? and @company_location.present?
      @employees = Employee.where(company_id: @company.to_i, company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif @company.present? and !@company_location.present?
      @employees = Employee.where(company_id: @company.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif !@company.present? and @company_location.present?
      @employees = Employee.where(company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    else
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # binding.pry
      # @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      # @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      # @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # @total_amt = @employee_statutory_deduction + @total_professional_tax
    end
    @employer_contribution = EmployerContribution.where(date: @from_date.to_date..@to_date.to_date)
    @employer_statutory_contribution = @employer_contribution.sum(:actual_pf)
    @employer_other_charges = (@employer_statutory_contribution.to_f / 100) * 1.61
    @total_amt = @employee_statutory_deduction + @employer_other_charges + @total_professional_tax
    respond_to do |format|
      format.js
      format.xls {render template: 'salaryslips/statutory_computation_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'statutory_computation_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'salaryslips/statutory_computation_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
      end
    end
  end

  def pf_computation
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end
 
  def pf_computation_report
    @from_date = params[:statutory_report] ? params[:statutory_report][:from_date] : params[:from_date]
    @to_date = params[:statutory_report] ? params[:statutory_report][:to_date] : params[:to_date]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]

    if @company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i, company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif @company.present? and !@company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif !@company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    else
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # binding.pry
      # @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      # @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      # @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # @total_amt = @employee_statutory_deduction + @total_professional_tax
    end
    @employer_contribution = EmployerContribution.where(date: @from_date.to_date..@to_date.to_date)
    @employer_statutory_contribution = @employer_contribution.sum(:actual_pf)
    @employer_other_charges = (@employer_statutory_contribution.to_i / 100)*1.61
    @total_amt = @employee_statutory_deduction + @employer_other_charges
    respond_to do |format|
      format.js
      format.xls {render template: 'salaryslips/pf_computation_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'pf_computation_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'salaryslips/pf_computation_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
      end
    end
  end

  def provident_fund
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end
 
  def provident_fund_report
    @from_date = params[:provident_fund] ? params[:provident_fund][:from_date] : params[:from_date]
    @to_date = params[:provident_fund] ? params[:provident_fund][:to_date] : params[:to_date]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]

    if @company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i, company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif @company.present? and !@company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    elsif !@company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
    else
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      @emp_statutory_deduction_twelve_percent_all = (@employee_statutory_deduction.to_i / 12)* 100
      @emp_statutory_deduction_twelve_percent = (@employee_statutory_deduction.to_i / 100)* 12
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # binding.pry
      # @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      # @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
      # @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)
      # @salaryslip_professional_tax = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
      # @total_professional_tax = @salaryslip_professional_tax.sum(:actual_amount)
      # @total_amt = @employee_statutory_deduction + @total_professional_tax
    end
    @employer_contribution = EmployerContribution.where(date: @from_date.to_date..@to_date.to_date)
    @employer_statutory_contribution = @employer_contribution.sum(:actual_pf)

    # @employer_statutory_contribution_all = (@employer_statutory_contribution.to_i / 3.67)* 1000
    @employer_statutory_contribution_eight_point = (@employer_statutory_contribution.to_i / 12)* 8.33
    @employer_statutory_contribution_three_point = (@employer_statutory_contribution.to_i / 12)* 3.67
       
    @employer_other_charges_one_percent = (@employer_statutory_contribution.to_i / 100)* 0.01
    @employer_other_charges_five_percent  = (@employer_statutory_contribution.to_i / 100)* 0.50
    @employer_other_charges_ten_percent = (@employer_statutory_contribution.to_i / 100)* 1.10

    @total_gross_amt = @employee_statutory_deduction + @employer_statutory_contribution_eight_point
    @total_all_percent = @employee_statutory_deduction + @employer_statutory_contribution_eight_point + @employer_statutory_contribution_three_point + @employer_other_charges_one_percent + @employer_other_charges_five_percent + @employer_other_charges_ten_percent
    respond_to do |format|
      format.js
      format.xls {render template: 'salaryslips/provident_fund_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'provident_fund_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'salaryslips/provident_fund_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
      end
    end
  end

  def pf_monthly_statement
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end
 
  def pf_monthly_statement_report
    @from_date = params[:pf_monthly_statement] ? params[:pf_monthly_statement][:from_date] : params[:from_date]
    @to_date = params[:pf_monthly_statement] ? params[:pf_monthly_statement][:to_date] : params[:to_date]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]
    if @company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i, company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
    elsif @company.present? and !@company_location.present?
      @employees = Employee.where(status: "Active",company_id: @company.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
    elsif !@company.present? and @company_location.present?
      @employees = Employee.where(status: "Active",company_location_id: @company_location.to_i).pluck(:id)
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employees).pluck(:id)
    else
      @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date).pluck(:id)
      @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
    end
    respond_to do |format|
      format.js
      format.xls {render template: 'salaryslips/pf_monthly_statement_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'pf_monthly_statement_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'salaryslips/pf_monthly_statement_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
      end
    end
  end

  def form_3A
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end

  def form_3A_report
    @from_date = params[:from_3A] ? params[:from_3A][:from_date] : params[:from_date]
    @to_date = params[:from_3A] ? params[:from_3A][:to_date] : params[:to_date]
    @employee_id = params[:salaryslip] ? params[:salaryslip][:employee_id] : params[:employee_id]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]
    @employee = Employee.find(@employee_id)

    @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employee).pluck(:id)
    @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Provident Fund")
    @employee_statutory_deduction = @salaryslip_components.sum(:actual_amount)

    @employer_contribution = EmployerContribution.where(date: @from_date.to_date..@to_date.to_date, employee_id: @employee_id)
    @employer_statutory_contribution = @employer_contribution.sum(:actual_pf)

     # try(:salaryslip).try(:calculated_gross_salary)

    @salaryslips3 = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date)
    # @year_wise = Salaryslip.where(year: year_from..year_to)
    @month_year = {}
    @salaryslips3.each do |month_year|
      @month_year[month_year.month_year.strftime("%B %Y")] = month_year.salaryslip_components.each { |cat| cat.calculated_amount.round }
    end
  end

  def form_6A
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end

  def form_6A_report
    @from_date = params[:from_6A] ? params[:from_6A][:from_date] : params[:from_date]
    @to_date = params[:from_6A] ? params[:from_6A][:to_date] : params[:to_date]
    @employee_id = params[:salaryslip] ? params[:salaryslip][:employee_id] : params[:employee_id]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]
  end
 
  def form_12A
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end

  def form_12A_report
    @from_date = params[:from_12A] ? params[:from_12A][:from_date] : params[:from_date]
    @to_date = params[:from_12A] ? params[:from_12A][:to_date] : params[:to_date]
    @employee_id = params[:salaryslip] ? params[:salaryslip][:employee_id] : params[:employee_id]
    @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]
  end

  def form_16A
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] ="StatutoryReport"
  end

  def form_16A_report
    @income_tax_master = IncomeTaxMaster.last
    @quarter_income_tax = QuarterIncomeTax.all
    @total_amount_paid = @quarter_income_tax.sum(:paid_amount)
    @total_amount_of_tax_deducted = @quarter_income_tax.sum(:tax_amount_deducted)
    @total_amount_of_tax_deposited = @quarter_income_tax.sum(:tax_amount_deposited)
    @monthly_income_tax = MonthlyIncomeTax.all
    @total_amount_of_tax_deposited = @monthly_income_tax.sum(:tax_deposited)

    @from_date = params[:from_16A] ? params[:from_16A][:from_date] : params[:from_date]
    @to_date = params[:from_16A] ? params[:from_16A][:to_date] : params[:to_date]
    @employee_id = params[:salaryslip] ? params[:salaryslip][:employee_id] : params[:employee_id]
    @employee = Employee.find(@employee_id)

    @from_assessment = @from_date.to_date + 1.year
    @from_assessment_year = @from_assessment.year
    @to_assessment = @to_date.to_date + 1.year
    @to_assessment_year = @to_assessment.year

    # @employees = Employee.where(company_id: @company.to_i, company_location_id: @company_location.to_i).pluck(:id)
    @salaryslips = Salaryslip.where(month_year: @from_date.to_date..@to_date.to_date, employee_id: @employee_id).pluck(:id)
    @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Professional Tax")
    @employee_professional_tax = @salaryslip_components.sum(:actual_amount)

    @tax_on_employment = @employee_professional_tax * 11 + 300

    @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips, other_component_name: "Conveyance Allowance")
    @employee_conveyance_allowance = @salaryslip_components.sum(:actual_amount)

    @current_template = EmployeeTemplate.where(employee_id: @employee_id, is_active: true).take
    @employee_salary_templates = @current_template.employee_salary_templates
    @gross_annual_amount = @employee_salary_templates.sum(:annual_amount)

    @deduct_professional_tax = @gross_annual_amount - @employee_professional_tax
    @deduct_conveyance_allowance = @gross_annual_amount - @employee_conveyance_allowance

    @investment_declaration = InvestmentDeclaration.where(employee_id: @employee_id)
    @aggregate_of_deductible_amount = @investment_declaration.sum(:amount)
    @investment_head_id = @investment_declaration.pluck(:investment_head_id)
    @investment_head = InvestmentHead.where(id: @investment_head_id)
    @section_id = @investment_head.pluck(:section_id)
    @sections = Section.where(id: @section_id)

    @section_code = {}
    @sections.each do |section|
      @section_code[section.code] = @investment_declarations_c = InvestmentDeclaration.select(InvestmentDeclaration.arel_table[Arel.star]).where(Section.arel_table[:code].eq(section.code).and(InvestmentDeclaration.arel_table[:employee_id].eq(@employee))).joins(InvestmentDeclaration.arel_table.join(InvestmentHead.arel_table).on(InvestmentDeclaration.arel_table[:investment_head_id].eq(InvestmentHead.arel_table[:id])).join_sources).joins(InvestmentDeclaration.arel_table.join(Section.arel_table).on(Section.arel_table[:id].eq(InvestmentHead.arel_table[:section_id])).join_sources)
    end

    @income_chargeable_under_the_head = @gross_annual_amount - @tax_on_employment
    @any_other_income = 0
    @gross_total_income = @income_chargeable_under_the_head + @any_other_income
    @total_income = @gross_total_income - @aggregate_of_deductible_amount
    
    if @total_income.present?
      if (1000..250000).include?(@total_income)
        @total_tax = 0
      elsif (250000..500000).include?(@total_income)
        @on_tax = @total_income - 250000
        @total_tax = @on_tax * 5 / 100
      elsif (500000..1000000).include?(@total_income)
        @on_tax = @total_income - 250000
        if (250000..500000).include?(@on_tax)
          @total_tax = @on_tax * 5 / 100
        elsif (500000..1000000).include?(@on_tax)
          @first_slabs = @on_tax - 500000
          @first_slabs_tax = @first_slabs * 20 / 100
          @second_slabs = @on_tax - @first_slabs
          @second_slabs_tax = @second_slabs * 5 / 100
          @total_tax = @first_slabs + @second_slabs
        end
      else 1000000 <= @total_income
        @on_tax = @total_income - 250000
      end
    else
      puts "Total Income not present"        
    end
    # @company = params[:salaryslip] ? params[:salaryslip][:company_id] : params[:company_id]
    # @company_location = params[:salaryslip] ? params[:salaryslip][:company_location_id] : params[:company_location_id]
    respond_to do |format|
      format.js
      format.xls {render template: 'salaryslips/form_16A_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'form_16A_report_pdf',
            layout: 'pdf.html',
            orientation: 'Portrait',
            template: 'salaryslips/form_16A_report_pdf.pdf.erb',
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 10,
                          :right  => 10},
            :show_as_html => params[:debug].present?
      end
    end
  end

  def leave_detail
    @leave_details = LeaveDetail.all
  end

  def import_xl
  end

  def import
   file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_xl_salaryslips_path
    else
    Salaryslip.import(params[:file])
    redirect_to import_xl_salaryslips_path, notice: "File imported."
    end
  end

  def leave_detail_xls
    @leave_details = LeaveDetail.all
    respond_to do |format|
      format.xls {render template: 'salaryslips/leave_detail_xls.xls.erb'}
    end
  end
end


