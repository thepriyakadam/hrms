class AttributeMastersController < ApplicationController
  before_action :set_attribute_master, only: [:show, :edit, :update, :destroy]

  # GET /attribute_masters
  # GET /attribute_masters.json
  def index
    @attribute_masters = AttributeMaster.all
  end

  # GET /attribute_masters/1
  # GET /attribute_masters/1.json
  def show
  end

  # GET /attribute_masters/new
  def new
    @attribute_master = AttributeMaster.new
    @attribute_masters = AttributeMaster.all
    session[:active_tab] ="master"
    session[:active_tab1] ="performancemaster"
  end

  # GET /attribute_masters/1/edit
  def edit
  end

  # POST /attribute_masters
  # POST /attribute_masters.json
  def create
    @attribute_master = AttributeMaster.new(attribute_master_params)
    if @attribute_master.save
      @flag = true
      @attribute_master = AttributeMaster.new
      @attribute_masters = AttributeMaster.all
    else
      @flag = false
    end
  end

  # PATCH/PUT /attribute_masters/1
  # PATCH/PUT /attribute_masters/1.json
  def update
    if @attribute_master.update(attribute_master_params)
      @flag = true
      @attribute_master = AttributeMaster.new
      @attribute_masters = AttributeMaster.all
    else
      @flag = false
    end
  end

  # DELETE /attribute_masters/1
  # DELETE /attribute_masters/1.json
  def destroy
    @attribute_master.destroy
    respond_to do |format|
      format.html { redirect_to attribute_masters_url, notice: 'Attribute master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attribute_master
    @attribute_master = AttributeMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attribute_master_params
    params.require(:attribute_master).permit(:name)
  end
end
