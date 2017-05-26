class PfMastersController < ApplicationController
  before_action :set_pf_master, only: [:show, :edit, :update, :destroy]

  # GET /pf_masters
  # GET /pf_masters.json
  def index

  end

  # GET /pf_masters/1
  # GET /pf_masters/1.json
  def show
  end

  # GET /pf_masters/new
  def new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PayrollMaster"
    @pf_master = PfMaster.new
    @pf_masters = PfMaster.all
  end

  # GET /pf_masters/1/edit
  def edit
  end

  # POST /pf_masters
  # POST /pf_masters.json

 
  # def create
  #   @components = params[:components]
  #   @pf_masters = PfMaster.all
  #   @pf_master = PfMaster.new(pf_master_params)
  #   @pf_master.base_component = PfMaster.create_string(@components)
  #   if @pf_master.save
  #     @flag = true
  #     @pf_master = PfMaster.new
  #   else
  #     @flag = false
  #   end
  # end

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
    @pf_master = PfMaster.new(pf_master_params)
    @pf_master.base_component = str
    @pf_masters = PfMaster.all
    @pf_master.save
    @pf_master = PfMaster.new
  end



  # PATCH/PUT /pf_masters/1
  # PATCH/PUT /pf_masters/1.json
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
    @pf_master.base_component = str
    @pf_master.update(pf_master_params)
    @pf_masters = PfMaster.all
    @pf_master = PfMaster.new

  end

  # DELETE /pf_masters/1
  # DELETE /pf_masters/1.json

  def destroy
    @pf_master.destroy
    @pf_masters = PfMaster.all
  end

  def is_confirm
    @pf_master = PfMaster.find(params[:pf_master])
    PfMaster.find(@pf_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_pf_master_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pf_master
    @pf_master = PfMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pf_master_params
    params.require(:pf_master).permit(:is_confirm,:is_pf, :is_da,:percentage, :date_effective, :min_limit, :base_component, :is_active)
  end
end
