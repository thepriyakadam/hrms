class EmployerFamilyPensionsController < ApplicationController
  before_action :set_employer_family_pension, only: [:show, :edit, :update, :destroy]

  # GET /employer_family_pensions
  # GET /employer_family_pensions.json
  def index
    @employer_family_pensions = EmployerFamilyPension.all
  end

  # GET /employer_family_pensions/1
  # GET /employer_family_pensions/1.json
  def show
  end

  # GET /employer_family_pensions/new
  def new
    @employer_family_pension = EmployerFamilyPension.new
  end

  # GET /employer_family_pensions/1/edit
  def edit
  end

  # POST /employer_family_pensions
  # POST /employer_family_pensions.json
  def create
    @employer_family_pension = EmployerFamilyPension.new(employer_family_pension_params)

    respond_to do |format|
      if @employer_family_pension.save
        format.html { redirect_to @employer_family_pension, notice: 'Employer family pension was successfully created.' }
        format.json { render :show, status: :created, location: @employer_family_pension }
      else
        format.html { render :new }
        format.json { render json: @employer_family_pension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employer_family_pensions/1
  # PATCH/PUT /employer_family_pensions/1.json
  def update
    respond_to do |format|
      if @employer_family_pension.update(employer_family_pension_params)
        format.html { redirect_to @employer_family_pension, notice: 'Employer family pension was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer_family_pension }
      else
        format.html { render :edit }
        format.json { render json: @employer_family_pension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_family_pensions/1
  # DELETE /employer_family_pensions/1.json
  def destroy
    @employer_family_pension.destroy
    respond_to do |format|
      format.html { redirect_to employer_family_pensions_url, notice: 'Employer family pension was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer_family_pension
      @employer_family_pension = EmployerFamilyPension.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_family_pension_params
      params.require(:employer_family_pension).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
