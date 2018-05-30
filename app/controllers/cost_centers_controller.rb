class CostCentersController < ApplicationController
  before_action :set_cost_center, only: [:show, :edit, :update, :destroy]

  def new
    @cost_center = CostCenter.new
    @cost_centers = CostCenter.all
    session[:active_tab] = "company"
  end

  # GET /cost_centers/1/edit
  def edit
  end

  # POST /cost_centers
  # POST /cost_centers.json
  def create
    @cost_center = CostCenter.new(cost_center_params)
    @cost_centers = CostCenter.all
    respond_to do |format|
      if @cost_center.save
        @cost_center = CostCenter.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Cost Center Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /cost_centers/1
  # PATCH/PUT /cost_centers/1.json
  def update
    @cost_center.update(cost_center_params)
    @cost_centers = CostCenter.all
    @cost_center = CostCenter.new
  end

  # DELETE /cost_centers/1
  # DELETE /cost_centers/1.json
  def destroy
    @cost_center.destroy
    @cost_centers = CostCenter.all
  end

  def is_confirm
    @cost_center = CostCenter.find(params[:cost_center])
    CostCenter.find(@cost_center.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_cost_center_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cost_center
    @cost_center = CostCenter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cost_center_params
    params.require(:cost_center).permit(:is_confirm,:name)
  end
end
