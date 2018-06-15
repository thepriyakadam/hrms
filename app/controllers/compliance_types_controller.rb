class ComplianceTypesController < ApplicationController
  before_action :set_compliance_type, only: [:show, :edit, :update, :destroy]

  # GET /compliance_types
  # GET /compliance_types.json
  def index
    @compliance_types = ComplianceType.all
    @compliance_type = ComplianceType.new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="complains"
  end

  # GET /compliance_types/1
  # GET /compliance_types/1.json
  def show
  end

  # GET /compliance_types/new

  # GET /compliance_types/1/edit
  def edit
  end

  # POST /compliance_types
  # POST /compliance_types.json
  def create

    @compliance_type = ComplianceType.new(compliance_type_params)
    if @compliance_type.save
      @compliance_type = ComplianceType.new
      @compliance_types = ComplianceType.all
      @flag = true
    else
      @flag = false
    end

  end

  # PATCH/PUT /compliance_types/1
  # PATCH/PUT /compliance_types/1.json
  def update
    if @compliance_type.update(compliance_type_params)
     @compliance_type = ComplianceType.new
     @compliance_types = ComplianceType.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /compliance_types/1
  # DELETE /compliance_types/1.json
  def destroy
    @compliance_type
    if TransactionRecord.exists?(compliance_type_id: @compliance_type.id)
      flash[:alert] = "This Compliance Type is used in Transaction"
    else
      @compliance_type.destroy
      @compliance_types = ComplianceType.all
    end
    redirect_to compliance_types_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compliance_type
      @compliance_type = ComplianceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compliance_type_params
      params.require(:compliance_type).permit(:code, :name, :description, :status)
    end
end
