class PunchMastersController < ApplicationController
  before_action :set_punch_master, only: [:show, :edit, :update, :destroy]

  # GET /punch_masters
  # GET /punch_masters.json
  def index
    @punch_masters = PunchMaster.all
  end

  # GET /punch_masters/1
  # GET /punch_masters/1.json
  def show
  end

  # GET /punch_masters/new
  def new
    @punch_master = PunchMaster.new
  end

  # GET /punch_masters/1/edit
  def edit
  end

  # POST /punch_masters
  # POST /punch_masters.json
  def create
    @punch_master = PunchMaster.new(punch_master_params)

    respond_to do |format|
      if @punch_master.save
        format.html { redirect_to @punch_master, notice: 'Punch master was successfully created.' }
        format.json { render :show, status: :created, location: @punch_master }
      else
        format.html { render :new }
        format.json { render json: @punch_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /punch_masters/1
  # PATCH/PUT /punch_masters/1.json
  def update
    respond_to do |format|
      if @punch_master.update(punch_master_params)
        format.html { redirect_to @punch_master, notice: 'Punch master was successfully updated.' }
        format.json { render :show, status: :ok, location: @punch_master }
      else
        format.html { render :edit }
        format.json { render json: @punch_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punch_masters/1
  # DELETE /punch_masters/1.json
  def destroy
    @punch_master.destroy
    respond_to do |format|
      format.html { redirect_to punch_masters_url, notice: 'Punch master was successfully destroyed.' }
      format.json { head :no_content }
    end
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
