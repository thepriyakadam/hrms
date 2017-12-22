class AboutCompaniesController < ApplicationController
  before_action :set_about_company, only: [:show, :edit, :update, :destroy]

  # GET /about_companies
  # GET /about_companies.json
  def index
    @about_companies = AboutCompany.all
  end

  # GET /about_companies/1
  # GET /about_companies/1.json
  def show
  end

  # GET /about_companies/new
  def new
    @about_company = AboutCompany.new
    @about_companies = AboutCompany.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Resignation"
  end

  # GET /about_companies/1/edit
  def edit
  end

  # POST /about_companies
  # POST /about_companies.json
  def create
    @about_company = AboutCompany.new(about_company_params)
    @about_companies = AboutCompany.all
    respond_to do |format|
      if @about_company.save
         @about_company = AboutCompany.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Company Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /about_companies/1
  # PATCH/PUT /about_companies/1.json
  def update
    @about_company.update(about_company_params)
    @about_companies = AboutCompany.all
    @about_company = AboutCompany.new
  end

  # DELETE /about_companies/1
  # DELETE /about_companies/1.json
  def destroy
    @about_company.destroy
    @about_companies = AboutCompany.all
  end

 
     def about_company_master
      @about_companies = AboutCompany.all
      respond_to do |f|
      f.js
      f.xls {render template: 'about_companies/about_company_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'about_company_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'about_companies/about_company_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

    def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_about_companies_path
      else
     AboutCompany.import(params[:file])
     redirect_to import_xl_about_companies_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_company
      @about_company = AboutCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_company_params
      params.require(:about_company).permit(:is_confirm,:code, :name, :description, :status)
    end
end
