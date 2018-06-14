class ComplianceTypesController < ApplicationController
  before_action :set_compliance_type, only: [:show, :edit, :update, :destroy]

  # GET /compliance_types
  # GET /compliance_types.json
  def index
    @compliance_types = ComplianceType.all
  end

  # GET /compliance_types/1
  # GET /compliance_types/1.json
  def show
  end

  # GET /compliance_types/new
  def new
    @compliance_type = ComplianceType.new
  end

  # GET /compliance_types/1/edit
  def edit
  end

  # POST /compliance_types
  # POST /compliance_types.json
  def create
    @compliance_type = ComplianceType.new(compliance_type_params)

    respond_to do |format|
      if @compliance_type.save
        format.html { redirect_to @compliance_type, notice: 'Compliance type was successfully created.' }
        format.json { render :show, status: :created, location: @compliance_type }
      else
        format.html { render :new }
        format.json { render json: @compliance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compliance_types/1
  # PATCH/PUT /compliance_types/1.json
  def update
    respond_to do |format|
      if @compliance_type.update(compliance_type_params)
        format.html { redirect_to @compliance_type, notice: 'Compliance type was successfully updated.' }
        format.json { render :show, status: :ok, location: @compliance_type }
      else
        format.html { render :edit }
        format.json { render json: @compliance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compliance_types/1
  # DELETE /compliance_types/1.json
  def destroy
    @compliance_type.destroy
    respond_to do |format|
      format.html { redirect_to compliance_types_url, notice: 'Compliance type was successfully destroyed.' }
      format.json { head :no_content }
    end
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
