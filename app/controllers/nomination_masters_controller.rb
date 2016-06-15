class NominationMastersController < ApplicationController
  before_action :set_nomination_master, only: [:show, :edit, :update, :destroy]

  # GET /nomination_masters
  # GET /nomination_masters.json
  def index
    @nomination_masters = NominationMaster.all
  end

  # GET /nomination_masters/1
  # GET /nomination_masters/1.json
  def show
  end

  # GET /nomination_masters/new
  def new
    @nomination_master = NominationMaster.new
    @nomination_masters = NominationMaster.all
    session[:active_tab] ="master"
    session[:active_tab1] ="employeeprofilesetup"
  end

  # GET /nomination_masters/1/edit
  def edit
  end

  # POST /nomination_masters
  # POST /nomination_masters.json
  def create
    @nomination_master = NominationMaster.new(nomination_master_params)

      if @nomination_master.save
        @flag = true
        @nomination_master = NominationMaster.new
        @nomination_masters = NominationMaster.all
      else
        @flag = false
      end
  end

  # PATCH/PUT /nomination_masters/1
  # PATCH/PUT /nomination_masters/1.json
  def update
    if @nomination_master.update(nomination_master_params)
      @flag = true
      @nomination_master = NominationMaster.new
      @nomination_masters = NominationMaster.all
    else
      @flag = false
    end
  end

  # DELETE /nomination_masters/1
  # DELETE /nomination_masters/1.json
  def destroy
   @nomination_master.destroy
    @nomination_masters = NominationMaster.all
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination_master
      @nomination_master = NominationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_master_params
      params.require(:nomination_master).permit(:code, :name, :description)
    end
end
