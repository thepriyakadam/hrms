class CertificatesController < ApplicationController
  def show
  end
  
  def new
     session[:active_tab] ="Reports"
  end

  def show_joining_date
    @employee = Employee.find(params[:employee_id])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

  def certificate_print
    @employee = Employee.find(params[:salary][:employee_id])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

 def address_proof
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_address.pdf.erb',
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

  def character_certificate
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_character.pdf.erb',
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


  def display_certificate
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_display.pdf.erb',
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


  def service_certificate
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_service.pdf.erb',
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

  def joining_letter
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_joining_letter.pdf.erb',
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

def offer_letter
    @employee = Employee.find(params[:employee_id])
    @certificate = [:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'certificates/certificate_print_offer_letter.pdf.erb',
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
