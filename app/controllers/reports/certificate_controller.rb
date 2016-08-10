class Reports::CertificateController < ApplicationController


  def new
  end

def show_joining_date
    @employee = Employee.find(params[:salary][:employee])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end
end

def certificate_print
  # byebug
    @employee = Employee.find(params[:salary][:employee])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
     respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'reports/certificate/certificate_print.pdf.erb',
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