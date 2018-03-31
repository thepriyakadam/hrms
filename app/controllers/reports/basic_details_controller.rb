class Reports::BasicDetailsController < ApplicationController
  def new
  end


  def employee_list
    @employees = Employee.column_names
    @joining_details = JoiningDetail.column_names
    @employee_physicals = EmployeePhysical.column_names
    @qualifications = Qualification.column_names
    @experiences = Experience.column_names
    @skillsets = Skillset.column_names
    @certifications = Certification.column_names
    @employee_bank_details = EmployeeBankDetail.column_names
    @families = Family.column_names
    @awards = Award.column_names
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def collect_departments
    @company_location = CompanyLocation.find(params[:id])
    @department = @company_location.departments 
  end 

  def show_basic_detail
    @company_location = params[:salary][:company_location]
    @employees = Employee.where(company_location_id: @company_location)

  end

  def employee_contact_report
    @company_location = params[:company_location]
    @employees = Employee.where(company_location_id: @company_location)
  end

  def employee_contact_report_pdf
    @company_location = params[:company_location_id]
    @employees = Employee.where(company_location_id: @company_location)
     respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'employee_contact_report_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'reports/basic_details/employee_contact_report_pdf.pdf.erb',
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

  def employee_basic_info
  end
  
  def select_department
  end

  def list_of_employee
    @company_location_id = params[:salary][:company_location_id]
    @employees = Employee.where(company_location_id: @company_location_id)
  end

end
