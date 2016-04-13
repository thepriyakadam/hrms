class PdfSalariesController < ApplicationController

     def print_salary_slip_monthwise
      @employees = params[:employee_ids]
      @salaryslips = Salaryslip.where(month: params[:month],year: params[:year],employee_id: @employees)
            respond_to do |format|
            format.html
            format.pdf do
            render :pdf => 'print_multiple_sal_slip_monthwise',
            layout: '/layouts/pdf.html.erb',
            :template => 'pdf_salaries/print_multiple_salary_slip.pdf.erb',
            :show_as_html => params[:debug].present?
          end
        end
    end

    def show_employee
       @employees = Employee.all
    end

    def show_unsaved_employee
	    # @month = params[:month]
	    # @year = params[:year]
	    # @workingdays = Workingday.where(month_name: @month, year: @year).pluck(:employee_id)
	    # @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
	    # emp_ids = @workingdays - @salaryslips
	    @employees = Employee.all
    end

    def employee_list_pdf
      @employees = Employee.all
    end

end
