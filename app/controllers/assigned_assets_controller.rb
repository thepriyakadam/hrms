class AssignedAssetsController < ApplicationController
  before_action :set_assigned_asset, only: [:show, :edit, :update, :destroy]

  # GET /assigned_assets
  # GET /assigned_assets.json
  def index
    @assigned_assets = AssignedAsset.all
  end

  # GET /assigned_assets/1
  # GET /assigned_assets/1.json
  def show
  end

  # GET /assigned_assets/new
  def new
    @assigned_asset = AssignedAsset.new
    @assigned_assets = AssignedAsset.all
  end

  # GET /assigned_assets/1/edit
  def edit
  end

  # POST /assigned_assets
  # POST /assigned_assets.json
  def create
    @assigned_asset = AssignedAsset.new(assigned_asset_params)
    @assigned_assets = AssignedAsset.all
    respond_to do |format|
      if @assigned_asset.save
        @assigned_asset = AssignedAsset.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Asset Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /assigned_assets/1
  # PATCH/PUT /assigned_assets/1.json
  def update
    
      if @assigned_asset.update(assigned_asset_params)
        @flag = true
        @assigned_asset = AssignedAsset.new
        @assigned_assets = AssignedAsset.all
      else
        @flag = false
      end
  end

  # DELETE /assigned_assets/1
  # DELETE /assigned_assets/1.json
  def destroy
    @assigned_asset.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to new_assigned_asset_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigned_asset
      @assigned_asset = AssignedAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assigned_asset_params
      params.require(:assigned_asset).permit(:employee_id, :asset_type_id, :assets_detail, :assets_id, :assets_value, :assest_status, :issue_date, :valid_till, :returned_on, :remarks)
    end
end
