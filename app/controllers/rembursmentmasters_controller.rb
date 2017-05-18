class RembursmentmastersController < ApplicationController
  before_action :set_rembursmentmaster, only: [:show, :edit, :update, :destroy]

  # GET /rembursmentmasters
  # GET /rembursmentmasters.json
  def index
    @rembursmentmaster = Rembursmentmaster.new
    @rembursmentmasters = Rembursmentmaster.all
  end

  # GET /rembursmentmasters/1
  # GET /rembursmentmasters/1.json
  def show
  end

  # GET /rembursmentmasters/new
  def new
    @rembursmentmaster = Rembursmentmaster.new
    @rembursmentmasters = Rembursmentmaster.all
  end

  # GET /rembursmentmasters/1/edit
  def edit
  end

  # POST /rembursmentmasters
  # POST /rembursmentmasters.json
  def create
    @rembursmentmaster = Rembursmentmaster.new(rembursmentmaster_params)
    @rembursmentmasters = Rembursmentmaster.all
    respond_to do |format|
      if @rembursmentmaster.save
         @rembursmentmaster = Rembursmentmaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /rembursmentmasters/1
  # PATCH/PUT /rembursmentmasters/1.json
  def update
    @rembursmentmaster.update(rembursmentmaster_params)
    @rembursmentmasters = Rembursmentmaster.all
    @rembursmentmaster = Rembursmentmaster.new
       
  end

  # DELETE /rembursmentmasters/1
  # DELETE /rembursmentmasters/1.json
  def destroy
    @rembursmentmaster.destroy
    @rembursmentmasters = Rembursmentmaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rembursmentmaster
      @rembursmentmaster = Rembursmentmaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rembursmentmaster_params
      params.require(:rembursmentmaster).permit(:code, :name, :description, :status)
    end
end