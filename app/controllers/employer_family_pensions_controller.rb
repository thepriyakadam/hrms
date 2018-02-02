class EmployerFamilyPensionsController < ApplicationController
  before_action :set_employer_family_pension, only: [:show, :edit, :update, :destroy]

  # GET /employer_family_pensions
  # GET /employer_family_pensions.json
  def index
    
  end

  # GET /employer_family_pensions/1
  # GET /employer_family_pensions/1.json
  def show
  end

  # GET /employer_family_pensions/new
  def new
    @employer_family_pension = EmployerFamilyPension.new
    @employer_family_pensions = EmployerFamilyPension.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /employer_family_pensions/1/edit
  def edit
  end

  # POST /employer_family_pensions
  # POST /employer_family_pensions.json
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

    @employer_family_pension = EmployerFamilyPension.new(employer_family_pension_params)
    @employer_family_pension.base_component = str
    @employer_family_pensions = EmployerFamilyPension.all
    @employer_family_pension.save
    @employer_family_pension = EmployerFamilyPension.new
    end

  # PATCH/PUT /employer_family_pensions/1
  # PATCH/PUT /employer_family_pensions/1.json
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
    @employer_family_pension.base_component = str
    @employer_family_pension.update(employer_family_pension_params)
    @employer_family_pensions = EmployerFamilyPension.all
    @employer_family_pension = EmployerFamilyPension.new

  end

  def is_confirm
    @employer_family_pension = EmployerFamilyPension.find(params[:employer_family_pension])
    EmployerFamilyPension.find(@employer_family_pension.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_employer_family_pension_path
  end

  def employer_family_pensions_modal
    @employer_family_pension = EmployerFamilyPension.find(params[:format])
  end

  # DELETE /employer_family_pensions/1
  # DELETE /employer_family_pensions/1.json
  def destroy
    @employer_family_pension.destroy
    @employer_family_pension = EmployerFamilyPension.new
    @employer_family_pensions = EmployerFamilyPension.all
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
