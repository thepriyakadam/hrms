class ReportingMastersController < ApplicationController
  before_action :set_reporting_master, only: [:show, :edit, :update, :destroy]

  # GET /reporting_masters
  # GET /reporting_masters.json
  def index
    @reporting_masters = ReportingMaster.all
  end

  # GET /reporting_masters/1
  # GET /reporting_masters/1.json
  def show
  end

  # GET /reporting_masters/new
  def new
    @reporting_master = ReportingMaster.new
  end

  # GET /reporting_masters/1/edit
  def edit
  end

  # POST /reporting_masters
  # POST /reporting_masters.json
  def create
    @reporting_master = ReportingMaster.new(reporting_master_params)

    respond_to do |format|
      if @reporting_master.save
        format.html { redirect_to @reporting_master, notice: 'Reporting master was successfully created.' }
        format.json { render :show, status: :created, location: @reporting_master }
      else
        format.html { render :new }
        format.json { render json: @reporting_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporting_masters/1
  # PATCH/PUT /reporting_masters/1.json
  def update
    respond_to do |format|
      if @reporting_master.update(reporting_master_params)
        format.html { redirect_to @reporting_master, notice: 'Reporting master was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporting_master }
      else
        format.html { render :edit }
        format.json { render json: @reporting_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporting_masters/1
  # DELETE /reporting_masters/1.json
  def destroy
    @reporting_master.destroy
    respond_to do |format|
      format.html { redirect_to reporting_masters_url, notice: 'Reporting master was successfully destroyed.' }
      format.json { head :no_content }
    end
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
