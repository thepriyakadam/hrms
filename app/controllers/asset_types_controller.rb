class AssetTypesController < ApplicationController
  before_action :set_asset_type, only: [:show, :edit, :update, :destroy]

  
  def new
    @asset_type = AssetType.new
    @asset_types = AssetType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="OnBording"
  end

  # GET /asset_types/1/edit
  def edit
  end

  # POST /asset_types
  # POST /asset_types.json
  def create
    @asset_type = AssetType.new(asset_type_params)

      if @asset_type.save
        @flag = true
        @asset_type = AssetType.new
        @asset_types = AssetType.all
      else
        @flag = false
      end
  end

  # PATCH/PUT /asset_types/1
  # PATCH/PUT /asset_types/1.json
  def update
      if @asset_type.update(asset_type_params)
        @flag = true
        @asset_type = AssetType.new
        @asset_types = AssetType.all
      else
        @flag = false
      end
  end

  # DELETE /asset_types/1
  # DELETE /asset_types/1.json
  def destroy
    @asset_type.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to new_asset_type_path
  end

  def is_confirm
    @asset_type = AssetType.find(params[:asset_type])
    AssetType.find(@asset_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_asset_type_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_type
      @asset_type = AssetType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_type_params
      params.require(:asset_type).permit(:is_confirm,:code, :name, :description)
    end
end
