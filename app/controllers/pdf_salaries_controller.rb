class PdfSalariesController < ApplicationController

def salary_slip_company_location_department
      @month = params[:month]
      @year = params[:year]
      @company = params[:company_id]
      @company_location = params[:company_location_id]
      @department = params[:department_id]
      @salary1 = params[:salaryslip_ids]
      if @salary1.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to select_month_year_form_pdf_salaries_path
      else
      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)

      respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_salary_slip_cost_unitwise',
        layout: '/layouts/pdf.html.erb',
        :template => 'pdf_salaries/salary_slip_company_location_department.pdf.erb',
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

    def print_salary_slip_monthwise
      # byebug
      @month = params[:salary][:month]
      @year = params[:salary][:year]
      @company = params[:employee][:company_id]
      @company_location = params[:employee][:company_location_id]
      @department = params[:employee][:department_id]

      @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
       
      if current_user.class == Group
      if @company_location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      elsif  @department == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
      end

      elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        # byebug
         if @company_location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        elsif  @department == ""
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else 
          # byebug
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Admin'
         if @company_location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @company_location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'Branch'
         if @company_location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @company_location.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
        elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
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
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "SalarySlip"
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
  session[:active_tab] ="PayrollManagement"
  session[:active_tab1] ="SalaryProcess"
  session[:active_tab2] = "SalarySlip"
  end

end
