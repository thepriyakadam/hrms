class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
    @countries = Country.all
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)
    @countries = Country.all
    respond_to do |format|
      if @country.save
        @country = Country.new
       format.js { @flag = true }
      else
        flash.now[:alert] = 'Country Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
     @country.update(country_params)
     @countries = Country.all
     @country = Country.new

  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    @countries = Country.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def country_params
    params.require(:country).permit(:code, :name)
  end
end
