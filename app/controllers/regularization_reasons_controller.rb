class RegularizationReasonsController < ApplicationController
  before_action :set_regularization_reason, only: [:show, :edit, :update, :destroy]
 
  # GET /regularization_reasons
  # GET /regularization_reasons.json
  def index
    @regularization_reasons = RegularizationReason.all
    @regularization_reason = RegularizationReason.new
    # session[:active_tab] ="PayrollManagement"
    # session[:active_tab1] ="complains"
  end

  # GET /regularization_reasons/1
  # GET /regularization_reasons/1.json
  def show
  end

  # GET /regularization_reasons/new
  # def new
  #   @regularization_reason = RegularizationReason.new
  # end

  # GET /regularization_reasons/1/edit
  def edit
  end

  # POST /regularization_reasons
  # POST /regularization_reasons.json
  def create
    @regularization_reason = RegularizationReason.new(regularization_reason_params)

    if @regularization_reason.save
      @regularization_reason = RegularizationReason.new
      @regularization_reasons = RegularizationReason.all
      @flag = true
    else
      @flag = false
    end
  end

  # PATCH/PUT /regularization_reasons/1
  # PATCH/PUT /regularization_reasons/1.json
  def update    
    if @regularization_reason.update(regularization_reason_params)
      @regularization_reason = RegularizationReason.new
      @regularization_reasons = RegularizationReason.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /regularization_reasons/1
  # DELETE /regularization_reasons/1.json
  def destroy
    @regularization_reason.destroy
    redirect_to regularization_reasons_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regularization_reason
      @regularization_reason = RegularizationReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regularization_reason_params
      params.require(:regularization_reason).permit(:code, :name, :description, :status)
    end
end
