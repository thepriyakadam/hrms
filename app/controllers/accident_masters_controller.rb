class AccidentMastersController < ApplicationController
  before_action :set_accident_master, only: [:show, :edit, :update, :destroy]

  # GET /accident_masters
  # GET /accident_masters.json
  def index
    @accident_masters = AccidentMaster.all
  end

  # GET /accident_masters/1
  # GET /accident_masters/1.json
  def show
  end

  # GET /accident_masters/new
  def new
    @accident_master = AccidentMaster.new
    @accident_masters = AccidentMaster.all
  end

  # GET /accident_masters/1/edit
  def edit
  end

  # POST /accident_masters
  # POST /accident_masters.json
  def create
    @accident_master = AccidentMaster.new(accident_master_params)
    @accident_masters = AccidentMaster.all
    respond_to do |format|
      if @accident_master.save
         @accident_master = AccidentMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Accident Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /accident_masters/1
  # PATCH/PUT /accident_masters/1.json
  def update
    @accident_master.update(accident_master_params)
    @accident_masters = AccidentMaster.all
    @accident_master = AccidentMaster.new
  end

  # DELETE /accident_masters/1
  # DELETE /accident_masters/1.json
  def destroy
    @accident_master.destroy
    @accident_masters = AccidentMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accident_master
      @accident_master = AccidentMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accident_master_params
      params.require(:accident_master).permit(:code, :name, :description)
    end
end
