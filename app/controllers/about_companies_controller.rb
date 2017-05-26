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

  def is_confirm
    @about_company = AboutCompany.find(params[:about_company])
    AboutCompany.find(@about_company.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_about_company_path
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
