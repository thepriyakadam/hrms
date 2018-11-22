class ShiftTimesController < ApplicationController
  before_action :set_shift_time, only: [:show, :edit, :update, :destroy]

  # GET /shift_times
  # GET /shift_times.json
  def index
    @shift_times = ShiftTime.all
  end

  # GET /shift_times/1
  # GET /shift_times/1.json
  def show
  end

  # GET /shift_times/new
  def new
    @shift_time = ShiftTime.new
    @shift_times = ShiftTime.all
    session[:active_tab] = "TimeManagement"
    session[:active_tab1] = "TimeManagementHod"
  end

  # GET /shift_times/1/edit
  def edit
  end

  # POST /shift_times
  # POST /shift_times.json
  def create
    @shift_time = ShiftTime.new(shift_time_params)

    from = shift_time_params["from"]
    to = shift_time_params["to"]
    total_hrs = to.to_time - from.to_time
    working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")

    if @shift_time.save
      @shift_time.update(working_hrs: working_hrs)
      @shift_time = ShiftTime.new
      @shift_times = ShiftTime.all
      @flag=true 
    else
      @flag=false
    end
  end

  # PATCH/PUT /shift_times/1
  # PATCH/PUT /shift_times/1.json
  def update
    @shift_time.update(shift_time_params)
    from = shift_time_params["from"]
    to = shift_time_params["to"]
    total_hrs = to.to_time - from.to_time
    working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")

    @shift_time.update(working_hrs: working_hrs)
    @shift_time = ShiftTime.new
    @shift_times = ShiftTime.all
  end

  # DELETE /shift_times/1
  # DELETE /shift_times/1.json
  def destroy
    @shift_time.destroy
    @shift_times = ShiftTime.all
  end

  def modal_shift_time
    @shift_time = ShiftTime.find(params[:format])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_time
      @shift_time = ShiftTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_time_params
      params.require(:shift_time).permit(:cost_center_id,:name,:shift, :from, :to, :working_hrs, :description, :status)
    end
end
