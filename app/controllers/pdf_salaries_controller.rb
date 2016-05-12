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

    def show_employee
      @month = params[:month]
      @year = params[:year]
      department = params[:department_id]
      @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
      @employees = Employee.where(id: @salaryslips, department_id: department)
    end
  

    def employee_list_pdf
      # @employees = Employee.all
    end

end
