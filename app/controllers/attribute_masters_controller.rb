class AttributeMastersController < ApplicationController
  before_action :set_attribute_master, only: [:show, :edit, :update, :destroy]

  # GET /attribute_masters
  # GET /attribute_masters.json
  def index
    @attribute_master = AttributeMaster.new
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
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Performance"
  end

  # GET /attribute_masters/1/edit
  def edit
  end

  # POST /attribute_masters
  # POST /attribute_masters.json
  def create
     @attribute_master = AttributeMaster.new(attribute_master_params)
    @attribute_masters = AttributeMaster.all
    respond_to do |format|
      if @attribute_master.save
         @attribute_master = AttributeMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Attribute Already Exist.'
        format.js { @flag = false }
      end
    end
  end


  # PATCH/PUT /attribute_masters/1
  # PATCH/PUT /attribute_masters/1.json
  def update
      @attribute_master.update(attribute_master_params)
      @attribute_masters = AttributeMaster.all 
      @attribute_master = AttributeMaster.new 
  end

  # DELETE /attribute_masters/1
  # DELETE /attribute_masters/1.json
  def destroy
    @attribute_master.destroy
    @attribute_masters = AttributeMaster.all
  end

  def modal
    @attribute_master = AttributeMaster.find(params[:format])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_master
      @attribute_master = AttributeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_master_params
      params.require(:attribute_master).permit(:attribute_weightage,:from,:to,:is_confirm,:code, :name, :definition, :status)
    end
end
