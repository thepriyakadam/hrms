class CompanyLeavsController < ApplicationController
  before_action :set_company_leav, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  # GET /company_leavs
  # GET /company_leavs.json
  def index
    @company_leavs = CompanyLeav.all
  end

  # GET /company_leavs/1
  # GET /company_leavs/1.json
  def show
  end

  # GET /company_leavs/new
  def new
    @company_leav = CompanyLeav.new
  end

  # GET /company_leavs/1/edit
  def edit
  end

  # POST /company_leavs
  # POST /company_leavs.json
  def create
    @company_leav = CompanyLeav.new(company_leav_params)

    respond_to do |format|
      if @company_leav.save
        format.html { redirect_to @company_leav, notice: 'Company leav was successfully created.' }
        format.json { render :show, status: :created, location: @company_leav }
      else
        format.html { render :new }
        format.json { render json: @company_leav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_leavs/1
  # PATCH/PUT /company_leavs/1.json
  def update
    respond_to do |format|
      if @company_leav.update(company_leav_params)
        format.html { redirect_to @company_leav, notice: 'Company leav was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_leav }
      else
        format.html { render :edit }
        format.json { render json: @company_leav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_leavs/1
  # DELETE /company_leavs/1.json
  def destroy
    @company_leav.destroy
    respond_to do |format|
      format.html { redirect_to company_leavs_url, notice: 'Company leav was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_leav
      @company_leav = CompanyLeav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_leav_params
      params.require(:company_leav).permit(:employee_grade_id, :leav_category_id, :no_of_leave, :expire_date)
    end
end
