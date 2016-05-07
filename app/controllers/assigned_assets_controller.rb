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
  end

  # GET /assigned_assets/1/edit
  def edit
  end

  # POST /assigned_assets
  # POST /assigned_assets.json
  def create
    @assigned_asset = AssignedAsset.new(assigned_asset_params)

    respond_to do |format|
      if @assigned_asset.save
        format.html { redirect_to @assigned_asset, notice: 'Assigned asset was successfully created.' }
        format.json { render :show, status: :created, location: @assigned_asset }
      else
        format.html { render :new }
        format.json { render json: @assigned_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigned_assets/1
  # PATCH/PUT /assigned_assets/1.json
  def update
    respond_to do |format|
      if @assigned_asset.update(assigned_asset_params)
        format.html { redirect_to @assigned_asset, notice: 'Assigned asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @assigned_asset }
      else
        format.html { render :edit }
        format.json { render json: @assigned_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_assets/1
  # DELETE /assigned_assets/1.json
  def destroy
    @assigned_asset.destroy
    respond_to do |format|
      format.html { redirect_to assigned_assets_url, notice: 'Assigned asset was successfully destroyed.' }
      format.json { head :no_content }
    end
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
