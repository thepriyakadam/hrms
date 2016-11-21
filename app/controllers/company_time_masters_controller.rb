class CompanyTimeMastersController < ApplicationController
  before_action :set_company_time_master, only: [:show, :edit, :update, :destroy]

  # GET /company_time_masters
  # GET /company_time_masters.json
  def index
    @company_time_masters = CompanyTimeMaster.all
  end

  # GET /company_time_masters/1
  # GET /company_time_masters/1.json
  def show
  end

  # GET /company_time_masters/new
  def new
    @company_time_master = CompanyTimeMaster.new
    @company_time_masters = CompanyTimeMaster.all
  end

  # GET /company_time_masters/1/edit
  def edit
  end

  # POST /company_time_masters
  # POST /company_time_masters.json
  def create
   @company_time_master = CompanyTimeMaster.new(company_time_master_params)
    @company_time_masters = CompanyTimeMaster.all
    respond_to do |format|
      if @company_time_master.save
         @company_time_master = CompanyTimeMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Company time Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /company_time_masters/1
  # PATCH/PUT /company_time_masters/1.json
   def update
   @company_time_master.update(company_time_master_params)
    @company_time_masters = CompanyTimeMaster.all
    @company_time_master = CompanyTimeMaster.new
  end

  # DELETE /company_time_masters/1
  # DELETE /company_time_masters/1.json
  def destroy
    @company_time_master.destroy
    @company_time_masters = CompanyTimeMaster.all
  end

  def is_confirm
    @company_time_master = CompanyTimeMaster.find(params[:company_time_master])
    CompanyTimeMaster.find(@company_time_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_company_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_time_master
      @company_time_master = CompanyTimeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_time_master_params
      params.require(:company_time_master).permit(:in_min_time, :in_max_time, :out_min_time, :out_max_time, :working_hrs, :is_active, :is_confirm)
    end
end
