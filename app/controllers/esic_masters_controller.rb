class EsicMastersController < ApplicationController
  before_action :set_esic_master, only: [:show, :edit, :update, :destroy]

  def new
    @esic_master = EsicMaster.new
    @esic_masters = EsicMaster.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PayrollMaster"
  end

  # GET /esic_masters/1/edit
  def edit
  end

  # POST /esic_masters
  # POST /esic_masters.json
  def create
    components = params[:components]
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @esic_master = EsicMaster.new(esic_master_params)
    @esic_master.base_component = str
    @esic_masters = EsicMaster.all
    @esic_master.save
    @esic_master = EsicMaster.new
  end

  # PATCH/PUT /esic_masters/1
  # PATCH/PUT /esic_masters/1.json
  def update
    components = params[:components]
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @esic_master.base_component = str
    @esic_master.update(esic_master_params)
    @esic_masters = EsicMaster.all
    @esic_master = EsicMaster.new
  end

  # DELETE /esic_masters/1
  # DELETE /esic_masters/1.json
  def destroy
    @esic_master.destroy
    @esic_masters = EsicMaster.all
  end

  def is_confirm
    @esic_master = EsicMaster.find(params[:esic_master])
    EsicMaster.find(@esic_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_esic_master_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_esic_master
    @esic_master = EsicMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def esic_master_params
    params.require(:esic_master).permit(:is_confirm,:esic, :percentage, :date_effective, :max_limit, :base_component)
  end
end
