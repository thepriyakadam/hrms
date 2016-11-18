class EmployerInsurancesController < ApplicationController
  before_action :set_employer_insurance, only: [:show, :edit, :update, :destroy]

  # GET /employer_insurances
  # GET /employer_insurances.json
  def index
   
  end

  # GET /employer_insurances/1
  # GET /employer_insurances/1.json
  def show
  end

  # GET /employer_insurances/new
  def new
    @employer_insurance = EmployerInsurance.new
    @employer_insurances = EmployerInsurance.all
  end

  # GET /employer_insurances/1/edit
  def edit
  end

  # POST /employer_insurances
  # POST /employer_insurances.json
  def create
   components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end

    @employer_insurance = EmployerInsurance.new(employer_insurance_params)
    @employer_insurance.base_component = str
    @employer_insurances = EmployerInsurance.all
    @employer_insurance.save
    @employer_insurance = EmployerInsurance.new
    end

  # PATCH/PUT /employer_insurances/1
  # PATCH/PUT /employer_insurances/1.json
  def update
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @employer_insurance.base_component = str
    @employer_insurance.update(employer_insurance_params)
    @employer_insurances = EmployerInsurance.all
    @employer_insurance = EmployerInsurance.new

  end

  # DELETE /employer_insurances/1
  # DELETE /employer_insurances/1.json
  def destroy
    @employer_insurance.destroy
    @employer_insurance = EmployerInsurance.new
    @employer_insurances = EmployerInsurance.all

    
  end

  def is_confirm
    @employer_insurance = EmployerInsurance.find(params[:employer_insurance])
    EmployerInsurance.find(@employer_insurance.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_employer_insurance_path
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
