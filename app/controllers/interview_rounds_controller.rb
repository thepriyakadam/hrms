class InterviewRoundsController < ApplicationController
  before_action :set_interview_round, only: [:show, :edit, :update, :destroy]

  # GET /interview_rounds
  # GET /interview_rounds.json
  def index
    @interview_rounds = InterviewRound.all
  end

  # GET /interview_rounds/1
  # GET /interview_rounds/1.json
  def show
  end

  # GET /interview_rounds/new
  def new
    @interview_round = InterviewRound.new
    @interview_rounds = InterviewRound.all
    @interview_schedule = InterviewSchedule.find(params[:format])
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  # GET /interview_rounds/1/edit
  def edit
  end

  # POST /interview_rounds
  # POST /interview_rounds.json
  def create
    @interview_round = InterviewRound.new(interview_round_params)
    @interview_rounds = InterviewRound.all
    respond_to do |format|
      if @interview_round.save
         @interview_round = InterviewRound.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end


  # PATCH/PUT /interview_rounds/1
  # PATCH/PUT /interview_rounds/1.json

  def update
    @interview_round.update(interview_round_params)
    @interview_rounds = InterviewRound.all
    @interview_round = InterviewRound.new
  end

  # DELETE /interview_rounds/1
  # DELETE /interview_rounds/1.json
  def destroy
    @interview_round.destroy
    @interview_rounds = InterviewRound.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_round
      @interview_round = InterviewRound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_round_params
      params.require(:interview_round).permit(:interview_schedule_id, :employee_id, :interview_type_id, :interview_date, :interview_time, :location, :schedule_comment)
    end
end
