class TargetCompaniesController < ApplicationController
  before_action :set_target_company, only: [:show, :edit, :update, :destroy]

  # GET /target_companies
  # GET /target_companies.json
  def index
    @target_company = TargetCompany.new
    @target_companies = TargetCompany.all
  end

  # GET /target_companies/1
  # GET /target_companies/1.json
  def show
  end

  # GET /target_companies/new
  def new
    @target_company = TargetCompany.new
    @target_companies = TargetCompany.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Recruitment"
  end

  # GET /target_companies/1/edit
  def edit
  end

  # POST /target_companies
  # POST /target_companies.json
  def create
    @target_company = TargetCompany.new(target_company_params)
    @target_companies = TargetCompany.all
    respond_to do |format|
      if @target_company.save
         @target_company = TargetCompany.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Target Company Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /target_companies/1
  # PATCH/PUT /target_companies/1.json
  def update
    @target_company.update(target_company_params)
    @target_company = TargetCompany.new
    @target_companies = TargetCompany.all

  end

  # DELETE /target_companies/1
  # DELETE /target_companies/1.json
  def destroy
    @target_company.destroy
    @target_companies = TargetCompany.all

  end

     def target_company_master
      @target_companies = TargetCompany.all
      respond_to do |f|
      f.js
      f.xls {render template: 'target_companies/target_company_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'target_company_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'target_companies/target_company_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_target_companies_path
      else
     TargetCompany.import(params[:file])
     redirect_to import_xl_target_companies_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_company
      @target_company = TargetCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_company_params
      params.require(:target_company).permit(:code, :name, :description, :status)
    end
end
