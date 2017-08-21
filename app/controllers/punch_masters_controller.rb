class PunchMastersController < ApplicationController
  before_action :set_punch_master, only: [:show, :edit, :update, :destroy]

  # GET /punch_masters
  # GET /punch_masters.json
  def index
    @punch_master = PunchMaster.new
    @punch_masters = PunchMaster.all
  end

  # GET /punch_masters/1
  # GET /punch_masters/1.json
  def show
  end

  # GET /punch_masters/new
  def new
    @punch_master = PunchMaster.new
    @punch_masters = PunchMaster.all
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="AttendanceSetup"
  end

  # GET /punch_masters/1/edit
  def edit
  end

  # POST /punch_masters
  # POST /punch_masters.json
  def create
    @punch_master = PunchMaster.new(punch_master_params)
    @punch_masters = PunchMaster.all
    respond_to do |format|
      if @punch_master.save
         @punch_master = PunchMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /punch_masters/1
  # PATCH/PUT /punch_masters/1.json
  def update
    @punch_master.update(punch_master_params)
    @punch_master = PunchMaster.new
    @punch_masters = PunchMaster.all
  end

  # DELETE /punch_masters/1
  # DELETE /punch_masters/1.json
  def destroy
    @punch_master.destroy
    @punch_masters = PunchMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punch_master
      @punch_master = PunchMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def punch_master_params
      params.require(:punch_master).permit(:start_time, :end_time, :reader_in, :reader_out, :full_day_hrs, :half_day_hrs, :status)
    end
end
