class ReportingMastersController < ApplicationController
  before_action :set_reporting_master, only: [:show, :edit, :update, :destroy]

  def new
    @reporting_master = ReportingMaster.new
    @reporting_masters = ReportingMaster.all
  end

  # GET /reporting_masters/1/edit
  def edit
  end

  # POST /reporting_masters
  # POST /reporting_masters.json
  def create
    @reporting_master = ReportingMaster.new(reporting_master_params)
    @reporting_masters = ReportingMaster.all
    respond_to do |format|
      if @reporting_master.save
        @reporting_master = ReportingMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reporting Manager Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reporting_masters/1
  # PATCH/PUT /reporting_masters/1.json
  def update
    @reporting_master.update(reporting_master_params)
    @reporting_masters = ReportingMaster.all
    @reporting_master = ReportingMaster.new
  end

  # DELETE /reporting_masters/1
  # DELETE /reporting_masters/1.json
  def destroy
    @reporting_master.destroy
    @reporting_masters = ReportingMaster.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reporting_master
    @reporting_master = ReportingMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reporting_master_params
    params.require(:reporting_master).permit(:code, :name, :description, :employee_id)
  end
end
