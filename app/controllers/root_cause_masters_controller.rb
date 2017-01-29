class RootCauseMastersController < ApplicationController
  before_action :set_root_cause_master, only: [:show, :edit, :update, :destroy]

  # GET /root_cause_masters
  # GET /root_cause_masters.json
  def index
    @root_cause_masters = RootCauseMaster.all
  end

  # GET /root_cause_masters/1
  # GET /root_cause_masters/1.json
  def show
  end

  # GET /root_cause_masters/new
  def new
    @root_cause_master = RootCauseMaster.new
    @root_cause_masters = RootCauseMaster.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "HSE"
  end

  # GET /root_cause_masters/1/edit
  def edit
  end

  # POST /root_cause_masters
  # POST /root_cause_masters.json
  def create
    @root_cause_master = RootCauseMaster.new(root_cause_master_params)
    @root_cause_masters = RootCauseMaster.all
    respond_to do |format|
      if @root_cause_master.save
        @root_cause_master = RootCauseMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Root Cause Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  

   def update
    @root_cause_master.update(root_cause_master_params)
    @root_cause_masters = RootCauseMaster.all
    @root_cause_master = RootCauseMaster.new
  end


   def destroy
    @root_cause_master.destroy
    @root_cause_masters = RootCauseMaster.all
  end

  def is_confirm
    @root_cause_master = RootCauseMaster.find(params[:root_cause_master])
    RootCauseMaster.find(@root_cause_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_root_cause_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_cause_master
      @root_cause_master = RootCauseMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def root_cause_master_params
      params.require(:root_cause_master).permit(:is_confirm,:code, :name, :description)
    end
end
