require 'query_report/helper'
class SalarySlipLedgersController < ApplicationController
  include QueryReport::Helper
  def show_employee
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
      wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or wd1.nil? or sl1.nil?
      else
        sr = SalaryReport.collect_data(e,j,wd1,sl1)
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
    
  end

  def cost_unit_wise_salary
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
      wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or wd1.nil? or sl1.nil?
      else
        sr = SalaryReport.collect_data(e,j,wd1,sl1)
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

  def collect_salary
    @month, @year, @bank = params[:month], params[:year], params[:bank_id]
    employee_bank_array = EmployeeBankDetail.where(bank_id: @bank).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    final_array = employee_bank_array & emp_user_array
    @slips = Salaryslip.where(month: @month, year: @year.to_s, employee_id: employee_bank_array)
    respond_to do |f|
      f.js
      f.xls {render template: 'salary_slip_ledgers/collect_salary.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'net_salary',
              layout: 'pdf.html',
              #orientation: 'Landscape',
              template: 'salary_slip_ledgers/collect_salary.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
end