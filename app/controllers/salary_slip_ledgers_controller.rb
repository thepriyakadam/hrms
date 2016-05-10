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
    @bank = Bank.find(params[:bank_id])
    @category = params[:cost_center]
    @month, @year = params[:month], params[:year]
    cost_center_array = JoiningDetail.where(cost_center_id: params[:cost_center]).pluck(:employee_id)
    emp_array = EmployeeBankDetail.where(bank_id: @bank.id).pluck(:employee_id)
    emp_user_array = Employee.collect_rolewise(current_user)
    if cost_center_array.empty?
      final_emp_array = emp_array & emp_user_array
    else
      final_emp_array = emp_array & emp_user_array & cost_center_array
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

  def salary_report
    @month, @year = "January", 2016
    @slips = []
    @employees = Employee.first(10)
    @employees.try(:each) do |e|
      j = JoiningDetail.find_by_employee_id(e.id)
      wd1 = Workingday.where('employee_id = ? and month_name = ? and year = ?', e.id, @month, @year.to_s).take
      sl1 = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
      if j.nil? or e.nil? or wd1.nil? or sl1.nil?
      else
        sr = SalaryReport.collect_data(e,j,wd1,sl1)
        @slips << sr
      end
    end
    @sum = SalaryReport.create_sum(@slips)
    
    reporter(@slips, template_class: PdfReportTemplate) do
      filter :employee_name, type: :string
      # filter(:current_status, :enum, :select => [["Pending",0], ["FirstApproved",2], ["SecondApproved",3], ["FirstRejected",4],["SecondRejected",5],["Cancelled",1]])
      column :employee_name
      column :department_name
      #column(:company_location, sortable: true) { |employee_leav_request| employee_leav_request.employee.try(:company_location).try(:name) }
    end
  end
end