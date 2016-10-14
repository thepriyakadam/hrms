class PdfSalariesController < ApplicationController

    def print_salary_slip_monthwise
      @month = params[:month]
      @year = params[:year]
      @cost_center = params[:cost_center]
      @salary1 = params[:salaryslip_ids]
      if @salary1.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to select_month_year_form_pdf_salaries_path
      else
      @joining_details = JoiningDetail.where(cost_center_id: @cost_center).pluck(:employee_id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @salary1)

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
    end

  def print_salary_slip_cost_unitwise
      @month = params[:month]
      @year = params[:year]
      @cost_center = params[:cost_center]
      @salary1 = params[:salaryslip_ids]
      if @salary1.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to select_month_year_form_pdf_salaries_path
      else
      @joining_details = JoiningDetail.where(cost_center_id: @cost_center).pluck(:employee_id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @salary1)
      
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
end

  def show_employee_costunit_wise
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryreport"
      @month = params[:month]
      @year = params[:year]
      @cost_center = params[:cost_center]
      # @employees = params[:employee_ids]
      # @salaryslips = Salaryslip.where(month:  @month,year: @year)
      @joining_details = JoiningDetail.where(cost_center_id: @cost_center).pluck(:employee_id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @joining_details)
  end

  def show_employee
      @month = params[:month]
      @year = params[:year]
      @department = params[:department_id]
      # @employees = params[:employee_ids]
      # @salaryslips = Salaryslip.where(month:  @month,year: @year)
      @employees = Employee.where(department_id: @department).pluck(:id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
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
