class ListedCompaniesController < ApplicationController
  before_action :set_listed_company, only: [:show, :edit, :update, :destroy]

  # GET /listed_companies
  # GET /listed_companies.json
  def index
    @listed_companies = ListedCompany.all
  end

  # GET /listed_companies/1
  # GET /listed_companies/1.json
  def show
  end

  # GET /listed_companies/new
  def new
    @listed_company = ListedCompany.new
  end

  # GET /listed_companies/1/edit
  def edit
  end

  def view_company
    company_id = params[:format]
    @listed_company = ListedCompany.find(company_id)
  end

  # POST /listed_companies
  # POST /listed_companies.json
  def create
    @listed_company = ListedCompany.new(listed_company_params)

    respond_to do |format|
      if @listed_company.save
        format.html { redirect_to @listed_company, notice: 'Listed company was successfully created.' }
        format.json { render :show, status: :created, location: @listed_company }
      else
        format.html { render :new }
        format.json { render json: @listed_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listed_companies/1
  # PATCH/PUT /listed_companies/1.json
  def update
    respond_to do |format|
      if @listed_company.update(listed_company_params)
        format.html { redirect_to @listed_company, notice: 'Listed company was successfully updated.' }
        format.json { render :show, status: :ok, location: @listed_company }
      else
        format.html { render :edit }
        format.json { render json: @listed_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listed_companies/1
  # DELETE /listed_companies/1.json
  def destroy
    @listed_company.destroy
    respond_to do |format|
      format.html { redirect_to listed_companies_url, notice: 'Listed company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listed_company
      @listed_company = ListedCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listed_company_params
      params.require(:listed_company).permit(:name, :contact_no, :email, :location)
    end
end
