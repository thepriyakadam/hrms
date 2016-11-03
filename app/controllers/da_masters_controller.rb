class DaMastersController < ApplicationController
  before_action :set_da_master, only: [:show, :edit, :update, :destroy]

  # GET /da_masters
  # GET /da_masters.json
  def index
  end

  # GET /da_masters/1
  # GET /da_masters/1.json
  def show
  end

  # GET /da_masters/new
  def new
    @da_master = DaMaster.new
    @da_masters = DaMaster.all

  end

  # GET /da_masters/1/edit
  def edit
  end

  # POST /da_masters
  # POST /da_masters.json
  def create
    @da_master = DaMaster.new(da_master_params)
    @da_masters = DaMaster.all

    respond_to do |format|
      if @da_master.save
         @da_master = DaMaster.new
         format.js { @flag = true }

      else
        flash.now[:alert] = 'DA Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /da_masters/1
  # PATCH/PUT /da_masters/1.json
  def update
   @da_master.update(da_master_params)
    @da_master = DaMaster.new
    @da_masters = DaMaster.all
  end
 
  # DELETE /da_masters/1
  # DELETE /da_masters/1.json
  def destroy
    @da_master.destroy
    @da_masters = DaMaster.all
  end

  def is_confirm
    @da_master = DaMaster.find(params[:da_master])
    DaMaster.find(@da_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_da_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_da_master
      @da_master = DaMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def da_master_params
      params.require(:da_master).permit(:is_da, :minimum_wages, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
