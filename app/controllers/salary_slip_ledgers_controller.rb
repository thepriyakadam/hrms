
# require 'query_report/helper'
class SalarySlipLedgersController < ApplicationController
  # include QueryReport::Helper

  def cost_unit_wise
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"
  end

  def employee_salary_ledger
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def employee_ctc
  end

  def select_month_year_form
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def bank_wise_net_amount
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="SalaryProcess"
    session[:active_tab2] = "SalaryReport"
  end

  def welfare_detail_report
     session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def show_employee
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"

    @pdf = "category"
    @bank = Bank.find(params[:bank_id])
    @category = params[:category]
    @month, @year = params[:month], params[:year]
    # byebug
    joining_array = JoiningDetail.where(employee_category_id: @category).pluck(:employee_id)
    emp_array = EmployeeBankDetail.where(bank_id: @bank.id).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    if joining_array.empty?
      final_emp_array = emp_array & emp_user_array
    else
      final_emp_array = emp_array & emp_user_array & joining_array
    end
    @reports = []
    @employees = Employee.where(id: final_emp_array)
    @employees.try(:each) do |e|
      j = JoiningDetail.find_by_employee_id(e.id)
      #wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or sl1.nil?
        
      else
        sr = SalaryReport.collect_data(e,j,sl1)
        @reports << sr
      end
    end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |format|
      format.js
      format.html
      format.xls {render template: 'salary_slip_ledgers/show_employee.xls.erb'}
      format.pdf do
        render pdf: 'bank_wise_salary',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'salary_slip_ledgers/bank_wise_salary.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def cost_unit_wise
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"  
  end

  def cost_unit_wise_salary
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"

    @pdf = "cost_center"
    @bank = params[:bank_id]
    @cost_center = params[:cost_center]
    @category = params[:category]
    @month, @year = params[:month], params[:year]
    category_array = JoiningDetail.where(employee_category_id: @category).pluck(:employee_id)
    bank_array = EmployeeBankDetail.where(bank_id: @bank).pluck(:employee_id)
    cost_center_array = JoiningDetail.where(cost_center_id: params[:cost_center]).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    if bank_array.empty? and category_array.empty?
      final_emp_array = emp_user_array & cost_center_array
    elsif bank_array.present? and category_array.present?
      final_emp_array = emp_user_array & cost_center_array & category_array & bank_array
    elsif category_array.empty? and bank_array.present?
      final_emp_array = emp_user_array & cost_center_array & bank_array
    elsif category_array.present? and bank_array.blank?
      final_emp_array = emp_user_array & cost_center_array & category_array
    else
      final_emp_array = []
    end
    @reports = []
    @employees = Employee.where(id: final_emp_array)
    @employees.try(:each) do |e|
      j = JoiningDetail.find_by_employee_id(e.id)
      #wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or sl1.nil?
      else
        sr = SalaryReport.collect_data(e,j,sl1)
        @reports << sr
      end
    end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |format|
      format.js
      format.xls {render template: 'salary_slip_ledgers/show_employee.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'cost_center_wise_salary',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'salary_slip_ledgers/bank_wise_salary.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  {top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def employee_salary_ledger
  end

  def collect_salary
    @month, @year, @bank = params[:month], params[:year], params[:bank_id]
    employee_bank_array = EmployeeBankDetail.where(bank_id: @bank).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    final_emp_array = employee_bank_array & emp_user_array
    @slips = Salaryslip.where(month: @month, year: @year.to_s, employee_id: final_emp_array)
    @total_net_salary = @slips.sum(:calculated_net_salary).round

    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/collect_salary.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'net_salary',
        layout: 'pdf.html',
        template: 'salary_slip_ledgers/collect_salary.pdf.erb',
        show_as_html: params[:debug].present?,
        margin:  { top:13,bottom:13,left:13,right:13 }
      end
    end
  end

  def employee_ctc
  end

  def show_employee_ctc
    @reports = []
    @department = params[:salary][:department_id]
    rolewise_employee = Employee.collect_rolewise(current_user)
    @employees = if @department.blank?
                Employee.where(id: rolewise_employee)
              else
                Employee.where(department_id: params[:salary][:department_id], id: rolewise_employee)
              end
    @employees.try(:each) do |e|
      employee = Employee.find(e.id)
      template = EmployeeTemplate.where(employee_id: e.id, is_active: true).take
      if employee.nil? or template.nil?
      else
        ctc = SalaryReport.collect_ctc(employee,template)
        @reports << ctc
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/collect_ctc.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'ctc',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/collect_ctc.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def show_monthly_ctc
    @month, @year, @department = params[:salary][:month], params[:salary][:year], params[:salary][:department_id]
    @reports = []
    rolewise_employee = Employee.collect_rolewise(current_user)
    if @month.blank? or @year.blank? or @department.blank?
    else
      @employees = Employee.where(department_id: @department, id: rolewise_employee)
    end
    @employees.try(:each) do |e|
      employee = Employee.find(e.id)
      salaryslip = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if employee.nil? or salaryslip.nil?
      else
        ctc = SalaryReport.collect_monthly_ctc(employee,salaryslip)
        @reports << ctc
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/collect_ctc.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'salary_ledger',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/collect_ctc.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def pf_detail_report
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def dynamic_report
    @month = params[:pf_detail] ? params[:pf_detail][:month] : params[:month]
    @year = params[:pf_detail] ? params[:pf_detail][:year] : params[:year]
    @company = params[:pf_detail] ? params[:pf_detail][:company_id] : params[:company_id]
    @location = params[:food_deduction] ? params[:food_deduction][:company_location_id] : params[:company_location_id]
    if current_user.class == Group
       if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/pf_detail_xls.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/pf.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

    def export_pf_report_to_text
      @month = params[:pf_detail] ? params[:pf_detail][:month] : params[:month]
      @year = params[:pf_detail] ? params[:pf_detail][:year] : params[:year]
      @company = params[:pf_detail] ? params[:pf_detail][:company_id] : params[:company_id]
      @location = params[:food_deduction] ? params[:food_deduction][:company_location_id] : params[:company_location_id]
      if current_user.class == Group
         if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
          respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
          respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
          respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
        end
      elsif current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          if @company == ""
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          elsif @location == ""
            @employees = Employee.where(company_id: @company.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          else
            @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          end
        elsif current_user.role.name == 'Admin'
          if @company == ""
            @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          elsif @location == ""
            @employees = Employee.where(company_id: @company.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          else
            @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          end
        elsif current_user.role.name == 'Branch'
          if @company == "" || @location == ""
            @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          else
            @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          end
        elsif current_user.role.name == 'HOD'
          if @company == "" || @location == ""
            @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          else
            @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          end
        elsif current_user.role.name == 'Superviser'
          if @company == "" || @location == ""
            @emp = Employee.find(current_user.employee_id)
            @employees = @emp.subordinates
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          else
            @emp = Employee.find(current_user.employee_id)
            @employees = @emp.subordinates
            @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
            @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name:   "Provident Fund").pluck(:salaryslip_id)
            @salaryslips = Salaryslip.where(id:  @salaryslip_components)
            respond_to do |format|
            format.html
            # format.csv { send_data @salaryslips.to_text,filename: "employee_pf_report-#{Date.today}.txt" }
          end
          end
        elsif current_user.role.name == 'Employee'
        end
      end
    end


  def esic_report
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def esic_dynamic_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    
    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/esic_xls.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'esic_dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/esic_pdf.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def proff_tax_report
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def professional_tax_master_dynamic_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Professional Tax"  ).pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/proff_tax.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'professional_tax_master_dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/proff_tax.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def retention_money_report
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def retention_dynamic_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/retention_money.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'retention_dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/retention_money.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def wellfair_detail_report
  end

  def wellfair_dynamic_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/wellfair.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'wellfair_dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/wellfair.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def soc_membership_report
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def soc_membership_dynamic_report
    @month = params[:food_deduction][:month]
    @year = params[:food_deduction][:year]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/soc_membership.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'soc_membership_dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/soc_membership.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def salary_ledger
    @reports = []
    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date
    @employee = params[:employee_id]
    @salaryslips = Salaryslip.where(employee_id: params[:employee_id], month_year: @start_date.to_date..@end_date.to_date)
    @salaryslips.try(:each) do |s|
      employee = Employee.find(s.employee_id)
      joining = JoiningDetail.find_by_employee_id(employee.id)
      sr = SalaryReport.collect_data(employee,joining,s)
      @reports << sr
    end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/collect_employee_salary_ledger.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'salary_ledger',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'salary_slip_ledgers/collect_employee_salary_ledger.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def select_bank_wise
  end
  def show_employee_list
    rep=params[:report_ids]
    @pdf = "category"
    @bank = Bank.find(params[:bank_id])
    @category = params[:category]
    @month, @year = params[:month], params[:year]
    joining_array = JoiningDetail.where(employee_category_id: @category).pluck(:employee_id)
    emp_array = EmployeeBankDetail.where(bank_id: @bank.id).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    if joining_array.empty?
      final_emp_array = emp_array & emp_user_array
    else
      final_emp_array = emp_array & emp_user_array & joining_array
    end
    @reports = []
    @employees = Employee.where(id: final_emp_array)
    @employees.try(:each) do |e|
      j = JoiningDetail.find_by_employee_id(e.id)
      #wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or sl1.nil?
      else
        sr = SalaryReport.collect_data(e,j,sl1)
        @reports << sr
        # @next = sr.next
      end
    end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |format|
      format.js
      format.html
      format.xls {render template: 'salary_slip_ledgers/show_employee.xls.erb'}
      format.pdf do
        render pdf: 'bank_wise_salary',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'salary_slip_ledgers/bank_wise_salary.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def print_xls
    rep=params[:report_ids]
    @pdf = "category"
    @bank = Bank.find(params[:bank_id])
    @category = params[:category]
    @month, @year = params[:month], params[:year]
    joining_array = JoiningDetail.where(employee_category_id: @category).pluck(:employee_id)
    emp_array = EmployeeBankDetail.where(bank_id: @bank.id).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    if joining_array.empty?
      final_emp_array = emp_array & emp_user_array
    else
      final_emp_array = emp_array & emp_user_array & joining_array
    end
    @reports = []
    check_array = Employee.where(manual_employee_code: rep).pluck(:id)
    aaa = final_emp_array & check_array 
    @employees = Employee.where(id: aaa)
    @employees.try(:each) do |e|
        j = JoiningDetail.find_by_employee_id(e.id)
        #wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
        sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
        if j.nil? or e.nil? or sl1.nil?
        else
            sr = SalaryReport.collect_data(e,j,sl1)
            @reports << sr
        end
      end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/print_xls.xls.erb'}
    end
  end

  def monthly_deduction_report
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def monthly_deduction
    # byebug
    @month = params[:salary_slip_ledger][:month]
    @year = params[:salary_slip_ledger][:year]
    @company = params[:salary_slip_ledger][:company_id]
    @location = params[:salary_slip_ledger][:company_location_id]

    if current_user.class == Group
      if @company == ""
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
        @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
        @salaryslips = Salaryslip.where(id:  @salaryslip_components)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id: @salaryslip_components)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
      respond_to do |f|
        f.js
        f.xls {render template: 'salary_slip_ledgers/monthly_deduction.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'monthly_deduction',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'salary_slip_ledgers/monthly_deduction.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
    end
    
end