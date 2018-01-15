class MeetingFollowUpsController < ApplicationController
  before_action :set_meeting_follow_up, only: [:show, :edit, :update, :destroy]

  # GET /meeting_follow_ups
  # GET /meeting_follow_ups.json
  def index
    @meeting_follow_ups = MeetingFollowUp.all
  end

  # GET /meeting_follow_ups/1
  # GET /meeting_follow_ups/1.json
  def show
  end

  # GET /meeting_follow_ups/new
  def new
    @meeting_follow_up = MeetingFollowUp.new
  end

  # GET /meeting_follow_ups/1/edit
  def edit
  end

  # POST /meeting_follow_ups
  # POST /meeting_follow_ups.json
  def create
    @meeting_follow_up = MeetingFollowUp.new(meeting_follow_up_params)

    respond_to do |format|
      if @meeting_follow_up.save
        format.html { redirect_to @meeting_follow_up, notice: 'Meeting follow up was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_follow_up }
      else
        format.html { render :new }
        format.json { render json: @meeting_follow_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_follow_ups/1
  # PATCH/PUT /meeting_follow_ups/1.json
  def update
    respond_to do |format|
      if @meeting_follow_up.update(meeting_follow_up_params)
        format.html { redirect_to @meeting_follow_up, notice: 'Meeting follow up was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_follow_up }
      else
        format.html { render :edit }
        format.json { render json: @meeting_follow_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_follow_ups/1
  # DELETE /meeting_follow_ups/1.json
  def destroy
    @meeting_follow_up.destroy
    respond_to do |format|
      format.html { redirect_to meeting_follow_ups_url, notice: 'Meeting follow up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_follow_up
      @meeting_follow_up = MeetingFollowUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_follow_up_params
      params.require(:meeting_follow_up).permit(:employee_plan_id, :contact_person, :contact_no, :follow_up_response, :date, :time, :next_date, :next_time)
    end
end
