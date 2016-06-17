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
    session[:active_tab] ="master"
    session[:active_tab1] ="payrollcomponents"
    @pf_master = PfMaster.new
    @pf_masters = PfMaster.all
  end

  # GET /pf_masters/1/edit
  def edit
  end

  # POST /pf_masters
  # POST /pf_masters.json
  def create
    @components = params[:components]
    @pf_masters = PfMaster.all
    @pf_master = PfMaster.new(pf_master_params)
    @pf_master.base_component = PfMaster.create_string(@components)
    if @pf_master.save
      @flag = true
      @pf_master = PfMaster.new
    else
      @flag = false
    end
  end

  # PATCH/PUT /pf_masters/1
  # PATCH/PUT /pf_masters/1.json
  def update
    respond_to do |format|
      if @pf_master.update(pf_master_params)
        format.html { redirect_to pf_masters_path, notice: 'PF Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @pf_master }
      else
        format.html { render :edit }
        format.json { render json: @pf_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_masters/1
  # DELETE /pf_masters/1.json
  def destroy
    @pf_master.destroy
    respond_to do |format|
      format.html { redirect_to pf_masters_url, notice: 'Pf master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pf_master
    @pf_master = PfMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pf_master_params
    params.require(:pf_master).permit(:is_pf, :percentage, :date_effective, :min_limit, :base_component, :is_active)
  end
end
