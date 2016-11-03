class FpMastersController < ApplicationController
  before_action :set_fp_master, only: [:show, :edit, :update, :destroy]

  # GET /fp_masters
  # GET /fp_masters.json
  def index
  end

  # GET /fp_masters/1
  # GET /fp_masters/1.json
  def show
  end

  # GET /fp_masters/new
  def new
    @fp_master = FpMaster.new
    @fp_masters = FpMaster.all

  end

  # GET /fp_masters/1/edit
  def edit
  end

  # POST /fp_masters
  # POST /fp_masters.json
  def create
    @fp_master = FpMaster.new(fp_master_params)
    @fp_masters = FpMaster.all   
    respond_to do |format|
      if @fp_master.save
        fp_master = FpMaster.new
     format.js { @flag = true }

      else
        flash.now[:alert] = 'PF Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /fp_masters/1
  # PATCH/PUT /fp_masters/1.json
  def update
    @fp_master.update(fp_master_params)
    @fp_master = FpMaster.new
    @fp_masters = FpMaster.all  
  end

  # DELETE /fp_masters/1
  # DELETE /fp_masters/1.json
  def destroy
    @fp_master.destroy
    @fp_masters = FpMaster.all
  end
  
  def is_confirm
    @fp_master = FpMaster.find(params[:fp_master])
    FpMaster.find(@fp_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_fp_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fp_master
      @fp_master = FpMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fp_master_params
      params.require(:fp_master).permit(:is_fp, :min_limit, :percentage, :base_component, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
