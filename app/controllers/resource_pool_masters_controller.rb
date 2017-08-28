class ResourcePoolMastersController < ApplicationController
  before_action :set_resource_pool_master, only: [:show, :edit, :update, :destroy]

  # GET /resource_pool_masters
  # GET /resource_pool_masters.json
  def index
    @resource_pool_master = ResourcePoolMaster.new
    @resource_pool_masters = ResourcePoolMaster.all
  end

  # GET /resource_pool_masters/1
  # GET /resource_pool_masters/1.json
  def show
  end

  # GET /resource_pool_masters/new
  def new
    @resource_pool_master = ResourcePoolMaster.new
    @resource_pool_masters = ResourcePoolMaster.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /resource_pool_masters/1/edit
  def edit
  end

  # POST /resource_pool_masters
  # POST /resource_pool_masters.json
  def create
    @resource_pool_master = ResourcePoolMaster.new(resource_pool_master_params)
    @resource_pool_masters = ResourcePoolMaster.all
    respond_to do |format|
      if @resource_pool_master.save
         @resource_pool_master = ResourcePoolMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /resource_pool_masters/1
  # PATCH/PUT /resource_pool_masters/1.json
  def update
    @resource_pool_master.update(resource_pool_master_params)
    @resource_pool_master = ResourcePoolMaster.new
    @resource_pool_masters = ResourcePoolMaster.all
  end

  # DELETE /resource_pool_masters/1
  # DELETE /resource_pool_masters/1.json
  def destroy
    @resource_pool_master.destroy
    @resource_pool_masters = ResourcePoolMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_pool_master
      @resource_pool_master = ResourcePoolMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_pool_master_params
      params.require(:resource_pool_master).permit(:code, :name, :description, :status)
    end
end
