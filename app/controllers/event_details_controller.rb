class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /event_details
  # GET /event_details.json
  def index
    @event_detail = EventDetail.new
    @event_details = EventDetail.all
  end

  # GET /event_details/1
  # GET /event_details/1.json
  def show
  end

  # GET /event_details/new
  def new
    @event_detail = EventDetail.new
    @event_details = EventDetail.all
  end

  # GET /event_details/1/edit
  def edit
  end

  # POST /event_details
  # POST /event_details.json
  def create
    @event_detail = EventDetail.new(event_detail_params)
    @event_details = EventDetail.all
    respond_to do |format|
      if @event_detail.save
        @event_detail = EventDetail.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Event Detail Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /event_details/1
  # PATCH/PUT /event_details/1.json
  def update
    @event_detail.update(event_detail_params)
    @event_detail = EventDetail.new
    @event_details = EventDetail.all
  end

  # DELETE /event_details/1
  # DELETE /event_details/1.json
  def destroy
    @event_detail.destroy
    @event_details = EventDetail.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_detail
      @event_detail = EventDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_detail_params
      params.require(:event_detail).permit(:date, :name, :description, :status)
    end
end
