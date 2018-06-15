class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
    @agency = Agency.new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="compliance_report"
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)
    if @agency.save
      @agency = Agency.new
      @agencies = Agency.all
      @flag = true
    else
      @flag = false
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    if @agency.update(agency_params)
     @agency = Agency.new
     @agencies = Agency.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency
    # if ComplianceRecord.exists?(compliance_type_id: @agency.id)
    #   flash[:alert] = "This Compliance Type is used in Transaction"
    # else
      @agency.destroy
      @agencies = Agency.all
    #end
    redirect_to agencies_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:code, :name, :description, :is_active)
    end
end
