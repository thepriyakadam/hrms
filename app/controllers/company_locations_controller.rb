class CompanyLocationsController < ApplicationController
  before_action :set_company_location, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource
  # GET /company_locations
  # GET /company_locations.json
  def index
    @company_locations = CompanyLocation.all
    session[:active_tab] = "company"
  end

  # GET /company_locations/1
  # GET /company_locations/1.json
  def show
  end

  # GET /company_locations/new
  def new
    @company_location = CompanyLocation.new
  end

  # GET /company_locations/1/edit
  def edit
    @country = @company_location.country
    @states = @country.states
    @state = @company_location.state
    @cities = @state.districts
    @form = 'company_location'
  end

  # POST /company_locations
  # POST /company_locations.json
  def create
    @company_location = CompanyLocation.new(company_location_params)
    # @company_location.district = params['company']['district']
    respond_to do |format|
      if @company_location.save
        format.html { redirect_to @company_location, notice: 'Company location was successfully created.' }
        format.json { render :show, status: :created, location: @company_location }
      else
        format.html { render :new }
        format.json { render json: @company_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_locations/1
  # PATCH/PUT /company_locations/1.json
  def update
    respond_to do |format|
      if @company_location.update(company_location_params)
        format.html { redirect_to @company_location, notice: 'Company location was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_location }
      else
        format.html { render :edit }
        format.json { render json: @company_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_locations/1
  # DELETE /company_locations/1.json
  def destroy
    @company_location.destroy
    respond_to do |format|
      format.html { redirect_to company_locations_url, notice: 'Company location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company_location
    @company_location = CompanyLocation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_location_params
    params.require(:company_location).permit(:manual_company_location_code, :company_id, :name, :email, :address, :country_id, :state_id, :district_id, :city, :pin_code, :contact_no)
  end
end
