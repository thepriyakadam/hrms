class ProfessionalTaxMastersController < ApplicationController
  before_action :set_professional_tax_master, only: [:show, :edit, :update, :destroy]

  # GET /professional_tax_masters
  # GET /professional_tax_masters.json
  def index
    
  end

  # GET /professional_tax_masters/1
  # GET /professional_tax_masters/1.json
  def show
  end

  # GET /professional_tax_masters/new
  def new
    @professional_tax_master = ProfessionalTaxMaster.new
    @professional_tax_masters = ProfessionalTaxMaster.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PayrollMaster"
  end

  # GET /professional_tax_masters/1/edit
  def edit
  end

  # POST /professional_tax_masters
  # POST /professional_tax_masters.json
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

    @professional_tax_master = ProfessionalTaxMaster.new(professional_tax_master_params)
    @professional_tax_master.base_component = str
    @professional_tax_masters = ProfessionalTaxMaster.all
    @professional_tax_master.save
    @professional_tax_master = ProfessionalTaxMaster.new
    end

  # PATCH/PUT /professional_tax_masters/1
  # PATCH/PUT /professional_tax_masters/1.json
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
    @professional_tax_master.base_component = str
    @professional_tax_master.update(professional_tax_master_params)
    @professional_tax_masters = ProfessionalTaxMaster.all
    @professional_tax_master = ProfessionalTaxMaster.new

  end

  # DELETE /professional_tax_masters/1
  # DELETE /professional_tax_masters/1.json
  def destroy
    @professional_tax_master.destroy
    @professional_tax_master = ProfessionalTaxMaster.new
    @professional_tax_masters = ProfessionalTaxMaster.all
    
    end

  def is_confirm
    @professional_tax_master = ProfessionalTaxMaster.find(params[:professional_tax_master])
    ProfessionalTaxMaster.find(@professional_tax_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_professional_tax_master_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_tax_master
      @professional_tax_master = ProfessionalTaxMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_tax_master_params
      params.require(:professional_tax_master).permit(:base_component, :min_amount, :max_amount, :basis_actual_amount, :company_location_id, :for_month, :march_amount, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
