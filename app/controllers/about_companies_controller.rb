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
  end

  # GET /about_companies/1/edit
  def edit
  end

  # POST /about_companies
  # POST /about_companies.json
  def create
    @about_company = AboutCompany.new(about_company_params)

    respond_to do |format|
      if @about_company.save
        format.html { redirect_to @about_company, notice: 'About company was successfully created.' }
        format.json { render :show, status: :created, location: @about_company }
      else
        format.html { render :new }
        format.json { render json: @about_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /about_companies/1
  # PATCH/PUT /about_companies/1.json
  def update
    respond_to do |format|
      if @about_company.update(about_company_params)
        format.html { redirect_to @about_company, notice: 'About company was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_company }
      else
        format.html { render :edit }
        format.json { render json: @about_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_companies/1
  # DELETE /about_companies/1.json
  def destroy
    @about_company.destroy
    respond_to do |format|
      format.html { redirect_to about_companies_url, notice: 'About company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_company
      @about_company = AboutCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_company_params
      params.require(:about_company).permit(:code, :name, :description, :status)
    end
end
