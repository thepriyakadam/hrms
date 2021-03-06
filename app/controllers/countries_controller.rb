
# require 'query_report/helper'  # need to require the helper
class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
   # include QueryReport::Helper  # need to include it
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

  def list_country
    reporter(Country.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:ID, sortable: true) { |country| country.id }
      column(:Code, sortable: true) { |country| country.code }
      column(:Name, sortable: true) { |country| country.name }
    end
  end

  def print_all_country
    @countries = Country.all
    respond_to do |f|
      f.js
      f.xls {render template: 'countries/print_all_country.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'print_all_country',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'countries/print_all_country.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_xl_countries_path
    else
      Country.import(params[:file])
      redirect_to new_country_path, notice: "File imported."
    end
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
