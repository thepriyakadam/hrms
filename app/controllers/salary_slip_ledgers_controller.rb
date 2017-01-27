require 'query_report/helper'
class SalarySlipLedgersController < ApplicationController
  include QueryReport::Helper

  def cost_unit_wise
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"
  end

  def employee_salary_ledger
  end

  def employee_ctc
  end

  def show_employee
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalaryReport"

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

  # def monthly_ctc_form
    
  # end

  def show_monthly_ctc
    @month, @year, @department = params[:salary][:month], params[:salary][:year], params[:salary][:department_id]
    @reports = []
    rolewise_employee = Employee.collect_rolewise(current_user)
    if @month.blank? or @year.blank? or @department.blank?
      #@employees = Employee.all
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

  def dynamic_report
    @month = params[:pf_detail][:month]
    @year = params[:pf_detail][:year]
    @company = params[:pf_detail][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)                                              
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def pf_detail_xls
    # byebug
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "PF").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/pf_detail_xls.xls.erb'}
    end
  end

  def pf_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'pf_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/pf.pdf.erb',
                  # show_as_html: params[:debug].present?,
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


  def esic_dynamic_report
    # byebug
    @month = params[:esic][:month]
    @year = params[:esic][:year]
    @company = params[:esic][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def esic_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/esic_xls.xls.erb'}
    end
  end

  def esic_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "ESIC").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'esic_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/esic_pdf.pdf.erb',
                  # show_as_html: params[:debug].present?,
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

  def professional_tax_master_dynamic_report
    @month = params[:proff_tax][:month]
    @year = params[:proff_tax][:year]
    @company = params[:proff_tax][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def proff_tax_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/proff_tax.xls.erb'}
    end
  end

  def proff_tax_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Prof. Tax").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'proff_tax_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/proff_tax.pdf.erb',
                  # show_as_html: params[:debug].present?,
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

  def retention_dynamic_report
    @month = params[:retention_money][:month]
    @year = params[:retention_money][:year]
    @company = params[:retention_money][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def retention_money_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/retention_money.xls.erb'}
    end
  end

  def retention_money_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Retention").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'retention_money_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/retention_money.pdf.erb',
                  # show_as_html: params[:debug].present?,
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

  def wellfair_dynamic_report
    @month = params[:wellfair][:month]
    @year = params[:wellfair][:year]
    @company = params[:wellfair][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Well Faire").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def wellfair_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/wellfair.xls.erb'}
    end
  end

  def wellfair_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "WelFare").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'retention_money_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/wellfair.pdf.erb',
                  # show_as_html: params[:debug].present?,
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



  def soc_membership_dynamic_report
    @month = params[:soc_membership][:month]
    @year = params[:soc_membership][:year]
    @company = params[:soc_membership][:company_id]
    # byebug
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def soc_membership_xls
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/soc_membership.xls.erb'}
    end
  end

  def soc_membership_pdf
    @month = params[:month]
    @year = params[:year]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
          @employees = Employee.where(company_id: @company.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
          @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
          @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Society").pluck(:salaryslip_id)
          @salaryslips = Salaryslip.where(id:  @salaryslip_components)
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
            render pdf: 'retention_money_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'salary_slip_ledgers/soc_membership.pdf.erb',
                  # show_as_html: params[:debug].present?,
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


  def salary_ledger
    @reports = []
    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date
    @employee = params[:employee_id]
    @salaryslips = Salaryslip.where(employee_id: params[:employee_id], month_year: @start_date..@end_date)
    @salaryslips.try(:each) do |s|
      employee = Employee.find(s.employee_id)
      joining = JoiningDetail.find_by_employee_id(employee.id)
      #workingday = Workingday.find_by_employee_id(employee.id)
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
        #margin:  { top:1,bottom:1,left:1,right:1 }
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
        # byebug
        sr = SalaryReport.collect_data(e,j,sl1)
        @reports << sr
        # @next = sr.next
      end
    end
    # byebug
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
    # byebug
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
    # byebug
    @employees = Employee.where(id: aaa)
    @employees.try(:each) do |e|
        j = JoiningDetail.find_by_employee_id(e.id)
        #wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
        sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
        
        if j.nil? or e.nil? or sl1.nil?
        else
            # byebug
            sr = SalaryReport.collect_data(e,j,sl1)
            @reports << sr
            # @next = sr.next
        end
      end
    @sum = SalaryReport.create_sum(@reports)
    respond_to do |format|
      format.xls {render template: 'salary_slip_ledgers/print_xls.xls.erb'}
    end
  end

  def monthly_deduction_report
  end

  def monthly_deduction
    @month = params[:salary_slip_ledger][:month]
    @year = params[:salary_slip_ledger][:year]
    @company = params[:salary_slip_ledger][:company_id]
    @location = params[:salary_slip_ledger][:company_location_id]

    @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i)
    @salaryslips1 = Salaryslip.where('month = ? and year = ?', @month, @year).where(employee_id: @employees).pluck(:id)
    @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslips1,other_component_name: "Advance").pluck(:salaryslip_id)
    @salaryslips = Salaryslip.where(id:  @salaryslip_components)
    
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