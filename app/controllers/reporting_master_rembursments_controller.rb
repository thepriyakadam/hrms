class ReportingMasterRembursmentsController < ApplicationController
  before_action :set_reporting_master_rembursment, only: [:show, :edit, :update, :destroy]

  # GET /reporting_master_rembursments
  # GET /reporting_master_rembursments.json
  def index
    @reporting_master_rembursments = ReportingMasterRembursment.all
  end

  # GET /reporting_master_rembursments/1
  # GET /reporting_master_rembursments/1.json
  def show
  end

  # GET /reporting_master_rembursments/new
  def new
    @reporting_master_rembursment = ReportingMasterRembursment.new
  end

  # GET /reporting_master_rembursments/1/edit
  def edit
  end

  # POST /reporting_master_rembursments
  # POST /reporting_master_rembursments.json
  def create
    @reporting_master_rembursment = ReportingMasterRembursment.new(reporting_master_rembursment_params)

    respond_to do |format|
      if @reporting_master_rembursment.save
        format.html { redirect_to @reporting_master_rembursment, notice: 'Reporting master rembursment was successfully created.' }
        format.json { render :show, status: :created, location: @reporting_master_rembursment }
      else
        format.html { render :new }
        format.json { render json: @reporting_master_rembursment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporting_master_rembursments/1
  # PATCH/PUT /reporting_master_rembursments/1.json
  def update
    respond_to do |format|
      if @reporting_master_rembursment.update(reporting_master_rembursment_params)
        format.html { redirect_to @reporting_master_rembursment, notice: 'Reporting master rembursment was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporting_master_rembursment }
      else
        format.html { render :edit }
        format.json { render json: @reporting_master_rembursment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporting_master_rembursments/1
  # DELETE /reporting_master_rembursments/1.json
  def destroy
    @reporting_master_rembursment.destroy
    respond_to do |format|
      format.html { redirect_to reporting_master_rembursments_url, notice: 'Reporting master rembursment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporting_master_rembursment
      @reporting_master_rembursment = ReportingMasterRembursment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporting_master_rembursment_params
      params.require(:reporting_master_rembursment).permit(:rembursment_id, :manager_id, :status)
    end
end
