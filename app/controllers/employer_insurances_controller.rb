class EmployerInsurancesController < ApplicationController
  before_action :set_employer_insurance, only: [:show, :edit, :update, :destroy]

  # GET /employer_insurances
  # GET /employer_insurances.json
  def index
    @employer_insurances = EmployerInsurance.all
  end

  # GET /employer_insurances/1
  # GET /employer_insurances/1.json
  def show
  end

  # GET /employer_insurances/new
  def new
    @employer_insurance = EmployerInsurance.new
  end

  # GET /employer_insurances/1/edit
  def edit
  end

  # POST /employer_insurances
  # POST /employer_insurances.json
  def create
    @employer_insurance = EmployerInsurance.new(employer_insurance_params)

    respond_to do |format|
      if @employer_insurance.save
        format.html { redirect_to @employer_insurance, notice: 'Employer insurance was successfully created.' }
        format.json { render :show, status: :created, location: @employer_insurance }
      else
        format.html { render :new }
        format.json { render json: @employer_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employer_insurances/1
  # PATCH/PUT /employer_insurances/1.json
  def update
    respond_to do |format|
      if @employer_insurance.update(employer_insurance_params)
        format.html { redirect_to @employer_insurance, notice: 'Employer insurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer_insurance }
      else
        format.html { render :edit }
        format.json { render json: @employer_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_insurances/1
  # DELETE /employer_insurances/1.json
  def destroy
    @employer_insurance.destroy
    respond_to do |format|
      format.html { redirect_to employer_insurances_url, notice: 'Employer insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer_insurance
      @employer_insurance = EmployerInsurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_insurance_params
      params.require(:employer_insurance).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
