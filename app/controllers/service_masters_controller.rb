class ServiceMastersController < ApplicationController
  before_action :set_service_master, only: [:show, :edit, :update, :destroy]

  # GET /service_masters
  # GET /service_masters.json
  def index
    @service_master = ServiceMaster.new
    @service_masters = ServiceMaster.all
  end

  # GET /service_masters/1
  # GET /service_masters/1.json
  def show
  end

  # GET /service_masters/new
  def new
    @service_master = ServiceMaster.new
    @service_masters = ServiceMaster.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /service_masters/1/edit
  def edit
  end

  # POST /service_masters
  # POST /service_masters.json
  def create
    @service_master = ServiceMaster.new(service_master_params)
    @service_masters = ServiceMaster.all
    respond_to do |format|
      if @service_master.save
         @service_master = ServiceMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /service_masters/1
  # PATCH/PUT /service_masters/1.json
  def update
    @service_master.update(service_master_params)
    @service_master = ServiceMaster.new
    @service_masters = ServiceMaster.all
  end

  # DELETE /service_masters/1
  # DELETE /service_masters/1.json
  def destroy
    @service_master.destroy
    @service_masters = ServiceMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_master
      @service_master = ServiceMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_master_params
      params.require(:service_master).permit(:code, :name, :description, :status)
    end
end
