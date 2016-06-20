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
  end

  # GET /attribute_masters/1/edit
  def edit
  end

  # POST /attribute_masters
  # POST /attribute_masters.json
  def create
    @attribute_master = AttributeMaster.new(attribute_master_params)

    respond_to do |format|
      if @attribute_master.save
        format.html { redirect_to @attribute_master, notice: 'Attribute master was successfully created.' }
        format.json { render :show, status: :created, location: @attribute_master }
      else
        format.html { render :new }
        format.json { render json: @attribute_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribute_masters/1
  # PATCH/PUT /attribute_masters/1.json
  def update
    respond_to do |format|
      if @attribute_master.update(attribute_master_params)
        format.html { redirect_to @attribute_master, notice: 'Attribute master was successfully updated.' }
        format.json { render :show, status: :ok, location: @attribute_master }
      else
        format.html { render :edit }
        format.json { render json: @attribute_master.errors, status: :unprocessable_entity }
      end
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
      params.require(:attribute_master).permit(:code, :name, :definition, :status)
    end
end
