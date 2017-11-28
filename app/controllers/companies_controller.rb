class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  # ##load_and_authorize_resource

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    session[:active_tab] = "company"
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company_type = CompanyType.all
    # @states = CS.states(params[:id])
    # @cities = CS.cities(params[:id],:in)
  end

  # GET /companies/1/edit
  def edit
    @country = @company.country
    @states = @country.states
    @state = @company.state
    @cities = @state.districts
    @form = 'company'
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

   def download_company_logo
    @company = Company.find(params[:id])
    send_file @company.company_logo.path,
              filename: @company.company_logo_file_name,
              type: @company.company_logo_content_type,
              disposition: 'attachment'
   end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_states
    @country = Country.find(params[:id])
    @states = @country.states
    @form = params[:form]
  end

  def collect_cities
    @state = State.find(params[:id])
    @cities = @state.districts
    @form = params[:form]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:company_logo,:manual_company_code, :group_id, :name, :company_type_id, :registration_no, :description, :pan_card_no, :tax_no, :professional_tax_no, :address, :city, :district_id, :country_id, :pin_code, :state_id, :email, :contact_no, :web_site, :starting_date, :ceo_name)
  end
end