class PlanReasonMastersController < ApplicationController
  before_action :set_plan_reason_master, only: [:show, :edit, :update, :destroy]

  # GET /plan_reason_masters
  # GET /plan_reason_masters.json
  def index
    @plan_reason_masters = PlanReasonMaster.all
    session[:active_tab] ="MeetingPlan"
    session[:active_tab1] ="Master"
  end

  # GET /plan_reason_masters/1
  # GET /plan_reason_masters/1.json
  def show
  end

  # GET /plan_reason_masters/new
  def new
    @plan_reason_master = PlanReasonMaster.new
  end

  # GET /plan_reason_masters/1/edit
  def edit
  end

  def view_resaon
    reason_id = params[:format]
    @plan_reason = PlanReasonMaster.find(reason_id)
  end
  # POST /plan_reason_masters
  # POST /plan_reason_masters.json
  def create
    @plan_reason_master = PlanReasonMaster.new(plan_reason_master_params)

    respond_to do |format|
      if @plan_reason_master.save
        format.html { redirect_to @plan_reason_master, notice: 'Plan reason master was successfully created.' }
        format.json { render :show, status: :created, location: @plan_reason_master }
      else
        format.html { render :new }
        format.json { render json: @plan_reason_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_reason_masters/1
  # PATCH/PUT /plan_reason_masters/1.json
  def update
    respond_to do |format|
      if @plan_reason_master.update(plan_reason_master_params)
        format.html { redirect_to @plan_reason_master, notice: 'Plan reason master was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_reason_master }
      else
        format.html { render :edit }
        format.json { render json: @plan_reason_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_reason_masters/1
  # DELETE /plan_reason_masters/1.json
  def destroy
    @plan_reason_master.destroy
    respond_to do |format|
      format.html { redirect_to plan_reason_masters_url, notice: 'Plan reason master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_reason_master
      @plan_reason_master = PlanReasonMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_reason_master_params
      params.require(:plan_reason_master).permit(:code, :name, :description, :status)
    end
end
