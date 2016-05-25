class WellFairesController < ApplicationController
  before_action :set_well_faire, only: [:show, :edit, :update, :destroy]

  # GET /well_faires/new
  def new
    @well_faire = WellFaire.new
    @well_faires = WellFaire.all
    session[:active_tab] ="master"
    session[:active_tab1] ="payrollcomponents"
  end

  # GET /well_faires/1/edit
  def edit
  end

  # POST /well_faires
  # POST /well_faires.json
  def create
    @well_faire = WellFaire.new(well_faire_params)
    @well_faires = WellFaire.all
    respond_to do |format|
      if @well_faire.save
        @well_faire = WellFaire.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'wellfaire is Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /well_faires/1
  # PATCH/PUT /well_faires/1.json
  def update
    @well_faire.update(well_faire_params)
    @well_faires = WellFaire.all
    @well_faire = WellFaire.new
  end

  # DELETE /well_faires/1
  # DELETE /well_faires/1.json
  def destroy
    @well_faire.destroy
    @well_faires = WellFaire.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_well_faire
    @well_faire = WellFaire.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def well_faire_params
    params.require(:well_faire).permit(:month, :amount, :status)
  end
end
