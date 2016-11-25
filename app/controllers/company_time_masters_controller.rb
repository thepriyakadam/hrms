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
  # def create
  #  @company_time_master = CompanyTimeMaster.new(company_time_master_params)
  #   @company_time_masters = CompanyTimeMaster.all
  #   respond_to do |format|
  #     if @company_time_master.save
  #        @company_time_master = CompanyTimeMaster.new
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Company time Already Exist.'
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  def create
    # byebug
    @in_min_time = params[:company_time_master][:in_min_time]
    @in_max_time = params[:company_time_master][:in_max_time]
    @in_time = params[:company_time_master][:in_time]
    @out_min_time = params[:company_time_master][:out_min_time]
    @out_max_time = params[:company_time_master][:out_max_time]
    @out_time = params[:company_time_master][:out_time]
    @working_hrs = params[:company_time_master][:working_hrs]
    @shift_type = params[:company_time_master][:shift_master_id]
    @is_active = params[:company_time_master][:is_active]
    CompanyTimeMaster.create(in_min_time: @in_min_time,in_max_time: @in_max_time,in_time: @in_time,out_min_time: @out_min_time,out_max_time: @out_max_time,out_time: @out_time,working_hrs: @working_hrs,shift_master_id: @shift_type,is_active: @is_active)
    flash[:notice] = "Company Time Master Created Successfully"
    redirect_to new_company_time_master_path
  end

  # PATCH/PUT /company_time_masters/1
  # PATCH/PUT /company_time_masters/1.json
   def update
    byebug
    @company_time_master.update(company_time_master_params)
    @company_time_masters = CompanyTimeMaster.all
    @company_time_master = CompanyTimeMaster.new
  end

  # DELETE /company_time_masters/1
  # DELETE /company_time_masters/1.json
  def destroy
    @company_time_master.destroy
    @company_time_masters = CompanyTimeMaster.all
    flash[:alert] = "Record Deleted Successfully"
    redirect_to new_company_master_path 
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
      params.require(:company_time_master).permit(:in_min_time, :in_max_time, :in_time, :out_time, :out_min_time, :out_max_time, :working_hrs, :is_active, :is_confirm)
    end
end
