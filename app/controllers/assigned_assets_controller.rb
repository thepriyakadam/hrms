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
    @employee = @assigned_asset.employee
  end

  # GET /assigned_assets/new
  def new
    @assigned_asset = AssignedAsset.new
    @employee = Employee.find(params[:id])
  end

  # GET /assigned_assets/1/edit
  def edit
     # @form = 'assigned_asset'
     @employee = @assigned_asset.employee
  end

  # POST /assigned_assets
  # POST /assigned_assets.json
  def create
    @assigned_asset = AssignedAsset.new(assigned_asset_params)
    @employee = Employee.find(params[:assigned_asset][:employee_id])
    respond_to do |format|
      if @assigned_asset.save
        # EmployeeMailer.asset_detail_create(@employee,@assigned_asset).deliver_now
        format.html { redirect_to @assigned_asset, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @assigned_asset }
        @assigned_assets = @employee.assigned_assets
        format.js { @flag = true }
      else
        ormat.html { render :new }
        format.json { render json: @assigned_asset.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /assigned_assets/1
  # PATCH/PUT /assigned_assets/1.json

  def update
    @employee = Employee.find(params['assigned_asset']['employee_id'])
    respond_to do |format|
      if @assigned_asset.update(assigned_asset_params)
        # format.html { redirect_to @assigned_asset, notice: 'assigned asset was successfully updated.' }
        # format.json { render :show, status: :ok, location: @assigned_asset }
        @assigned_assets = @employee.assigned_assets
        EmployeeMailer.asset_detail_create(@employee,@assigned_asset).deliver_now
        format.js { @flag = true }
         EmployeeMailer.asset_detail_create(@employee,@assigned_asset).deliver_now
      else
        # format.html { render :edit }
        # format.json { render json: @assigned_asset.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  

  # DELETE /assigned_assets/1
  # DELETE /assigned_assets/1.json
  def destroy
    @assigned_asset.destroy
    respond_to do |format|
      format.html { redirect_to assigned_assets_url, notice: 'assigned asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_asset
     @assigned_asset = AssignedAsset.find(params[:id])
    @employee = Employee.find(@assigned_asset.employee_id)
    if @assigned_asset.update(assigned_asset_params)
      @assigned_assets = AssignedAsset.where(employee_id:@employee.id)
      @flag = true
    else
      @assigned_assets = AssignedAsset.where(employee_id:@employee.id)
      @flag = false 
    end
  end

  def modal
    @assigned_asset = AssignedAsset.find(params[:format])
  end

  def import_xl
    @assigned_assets = AssignedAsset.all
    respond_to do |format|
    format.html
    format.csv { send_data @assigned_assets.to_csv }
    format.xls
     session[:active_tab] = "import"
   end   
  end

  def import
    # byebug
    AssignedAsset.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  def asset_modal
    @assigned_asset = AssignedAsset.find(params[:format])
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
