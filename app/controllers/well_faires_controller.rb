class WellFairesController < ApplicationController
  before_action :set_well_faire, only: [:show, :edit, :update, :destroy]

  # GET /well_faires/new
  def new
    @well_faire = WellFaire.new
    @well_faires = WellFaire.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PayrollMaster"
  end

  # GET /well_faires/1/edit
  def edit
  end

  # POST /well_faires
  def create
     @well_faire = WellFaire.new(well_faire_params)
     @well_faires = WellFaire.all
      if @well_faire.save
        @well_faire = WellFaire.new
      end
      flash[:notice] = 'Wellfare saved Successfully.' 
      redirect_to new_well_faire_path    
  end

  def modal
    @well_faire = WellFaire.find(params[:format])
  end
  # PATCH/PUT /well_faires/1
  # PATCH/PUT /well_faires/1.json
  def update
    @well_faire.update(well_faire_params)
    @well_faires = WellFaire.all
    @well_faire = WellFaire.new
     redirect_to new_well_faire_path
  end

  # DELETE /well_faires/1
  # DELETE /well_faires/1.json
  def destroy
    @well_faire.destroy
    @well_faires = WellFaire.all
  end

  def is_confirm
    @well_faire = WellFaire.find(params[:well_faire])
    WellFaire.find(@well_faire.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_well_faire_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_well_faire
    @well_faire = WellFaire.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def well_faire_params
    params.require(:well_faire).permit(:is_confirm,:month, :amount, :status)
  end
end
