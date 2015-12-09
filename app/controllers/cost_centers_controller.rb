class CostCentersController < ApplicationController
  before_action :set_cost_center, only: [:show, :edit, :update, :destroy]

  # GET /cost_centers
  # GET /cost_centers.json
  def index
    @cost_centers = CostCenter.all
  end

  # GET /cost_centers/1
  # GET /cost_centers/1.json
  def show
  end

  # GET /cost_centers/new
  def new
    @cost_center = CostCenter.new
  end

  # GET /cost_centers/1/edit
  def edit
  end

  # POST /cost_centers
  # POST /cost_centers.json
  def create
    @cost_center = CostCenter.new(cost_center_params)

    respond_to do |format|
      if @cost_center.save
        format.html { redirect_to @cost_center, notice: 'Cost center was successfully created.' }
        format.json { render :show, status: :created, location: @cost_center }
      else
        format.html { render :new }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_centers/1
  # PATCH/PUT /cost_centers/1.json
  def update
    respond_to do |format|
      if @cost_center.update(cost_center_params)
        format.html { redirect_to @cost_center, notice: 'Cost center was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost_center }
      else
        format.html { render :edit }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_centers/1
  # DELETE /cost_centers/1.json
  def destroy
    @cost_center.destroy
    respond_to do |format|
      format.html { redirect_to cost_centers_url, notice: 'Cost center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost_center
      @cost_center = CostCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_center_params
      params.require(:cost_center).permit(:name)
    end
end
