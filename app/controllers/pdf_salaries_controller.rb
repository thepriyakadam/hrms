class PdfSalariesController < ApplicationController

    def print_salary_slip_monthwise
      @month = params[:month]
      @year = params[:year]
      @employees = params[:employee_ids]
      @salaryslips = Salaryslip.where(month: params[:month],year: params[:year],employee_id: @employees)
            respond_to do |format|
            format.html
            format.pdf do
            render :pdf => 'print_multiple_sal_slip_monthwise',
            layout: '/layouts/pdf.html.erb',
            :template => 'pdf_salaries/print_multiple_salary_slip.pdf.erb',
            :orientation      => 'Landscape', # default , Landscape
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

  def print_salary_slip_cost_unitwise
      @month = params[:month]
      @year = params[:year]
      @cost_center = params[:cost_center]
      @employees = params[:employee_ids]
      @salaryslips = Salaryslip.where(month: params[:month],year: params[:year],employee_id: @employees)
      @joining_details = JoiningDetail.where(cost_center_id: @cost_center).pluck(:employee_id)
      @employees = Employee.where(id: @joining_details)
      @employees.try(:each) do |e|
      j = JoiningDetail.find_by_employee_id(e.id)
    end
        respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_salary_slip_cost_unitwise',
        layout: '/layouts/pdf.html.erb',
        :template => 'pdf_salaries/print_salary_slip_cost_unitwise.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def show_employee_costunit_wise
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryreport"
       @pdf = "cost_center"
    @bank = params[:bank_id]
    @cost_center = params[:cost_center]
    @category = params[:category]
    @month, @year = params[:month], params[:year]
    category_array = JoiningDetail.where(employee_category_id: @category).pluck(:employee_id)
    bank_array = EmployeeBankDetail.where(bank_id: @bank).pluck(:employee_id)
    cost_center_array = JoiningDetail.where(cost_center_id: params[:cost_center]).pluck(:employee_id)
    @salaryslips = Salaryslip.where('employee_id = ? and month = ? and year = ?', e.id, @month, @year.to_s).take
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

  end



  def show_employee
    @month = params[:month]
    @year = params[:year]
    department = params[:department_id]
    @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    @employees = Employee.where(id: @salaryslips, department_id: department)
    #byebug
  end
  
  def print_salary_slip_excel
    @salaryslips = Salaryslip.all
  end

  def employee_list_pdf
    # @employees = Employee.all
  end

  def select_month_year_form
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryreport"
  end

end
