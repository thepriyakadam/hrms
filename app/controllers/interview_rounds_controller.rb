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
     @interview_analyses = InterviewAnalysis.where(interview_round_id: @interview_round.id)
     @interview_schedules = InterviewSchedule.where(id: @interview_round.interview_schedule_id)
  end

  # GET /interview_rounds/new
  def new
    # byebug
    @interview_round = InterviewRound.new
    # @interview_rounds = InterviewRound.all
    @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  # GET /interview_rounds/1/edit
  # def edit
  # end

  # POST /interview_rounds
  # POST /interview_rounds.json
  
  # def create
  #   @interview_round = InterviewRound.new(interview_round_params)
  #   @interview_rounds = InterviewRound.all
  #   respond_to do |format|
  #     if @interview_round.save
  #        @interview_round = InterviewRound.new
         
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Interview Already Exist.'
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  # def create
  #    @interview_round = InterviewRound.new(interview_round_params)
  #    @interview_rounds = InterviewRound.all
  #     if @interview_round.save
  #       InterviewRoundMailer.send_email_to_interviewer(@interview_round).deliver_now
  #       InterviewRoundMailer.send_email_to_candidate(@interview_round).deliver_now
  #       @interview_round = InterviewRound.new
  #     end
  #     # redirect_to interview_schedules_path
  #     # flash[:notice] = 'Interview Schedule was saved Successfully & Email also Sent'   
  # end

  def create
    @interview_round = InterviewRound.new(interview_round_params)
    @interview_rounds = InterviewRound.all
      if @interview_round.save
        # InterviewRoundMailer.send_email_to_interviewer(@interview_round).deliver_now
        # InterviewRoundMailer.send_email_to_candidate(@interview_round).deliver_now
        @interview_round = InterviewRound.new
        flash[:notice] = 'Interview Round saved Successfully.'
      end
      # byebug
      @interview_schedule_id = InterviewSchedule.find(params[:interview_round][:interview_schedule_id])
      redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule_id.id)
  end


  # PATCH/PUT /interview_rounds/1
  # PATCH/PUT /interview_rounds/1.json

  # def update
  #   @interview_round.update(interview_round_params)
  #   InterviewRoundMailer.send_email_to_interviewer(@interview_round).deliver_now
  #   InterviewRoundMailer.send_email_to_candidate(@interview_round).deliver_now
  #   @interview_rounds = InterviewRound.all
  #   @interview_round = InterviewRound.new
  # end


  def edit
    @interview_schedule = InterviewSchedule.find(@interview_round.interview_schedule_id)
    # # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    # @interview_schedules = InterviewSchedule.where(interview_schedule_id: @interview_schedule.id)
  end


    def update
      @interview_schedule = InterviewSchedule.find(@interview_round.interview_schedule_id)

      if @interview_round.update(interview_round_params)
        @interview_rounds =  @interview_schedule.interview_rounds
        # c1 = @daily_bill_details.sum(:travel_expence).to_i
        # TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
        flash[:notice] = "Updated successfully"
      else
        flash[:alert] = "not updated"
      end
      redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule.id)
  end

  # DELETE /interview_rounds/1
  # DELETE /interview_rounds/1.json
  def destroy
    @interview_round.destroy
    @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  def interview_round_reschedule
    @interview_round = InterviewRound.find(params[:id])
    @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
    @employee = Employee.find(@interview_round.employee_id)
    @interview_round_reschedule = InterviewRoundReschedule.new
  end

  def reschedule_interview
    @interview_round_reschedule = InterviewRoundReschedule.new
    @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
    @interview_round = InterviewRound.find(params[:interview_round_reschedule][:interview_round_id])

    @interview_round_reschedule.interview_date = @interview_round.interview_date
    @interview_round_reschedule.interview_time = @interview_round.interview_time
    @interview_round_reschedule.employee_id = @interview_round.employee_id
    @interview_round_reschedule.location = @interview_round.location
    @interview_round_reschedule.interview_type_id = @interview_round.interview_type_id
    @interview_round_reschedule.employee_id = params[:interview_round_reschedule][:employee_id]
    @interview_round_reschedule.interview_round_id = @interview_round.id

    @interview_round_reschedule.save
    @interview_round.update(interview_date: params[:interview_round_reschedule][:interview_date], interview_time: params[:interview_round_reschedule][:interview_time],employee_id: params[:interview_round_reschedule][:employee_id],location: params[:interview_round_reschedule][:location],interview_type_id: params[:interview_round_reschedule][:interview_type_id])
    @interview_round_reschedule = InterviewRoundReschedule.new(interview_round_reschedule_params)
    redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule.id)
    flash[:notice] = 'Interview Round Rescheduled Successfully.'   
  end

  def interview_reschedule_list
     @interview_round = InterviewRound.find(params[:format])
     @interview_round_reschedules = InterviewRoundReschedule.where(interview_round_id: @interview_round.id)
  end

  # def confirm_interview_round
  #     @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
  #     InterviewRound.where(interview_schedule_id: @interview_schedule.id).update_all(interview_round_confirm: true)
  #     flash[:notice] = "Interview Round Confirmed Successfully"
  #     redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule.id)
  # end

  def confirm_interview_round
    @interview_schedule = InterviewSchedule.find(params[:interview_schedule_id])
    @interview_round_ids = params[:interview_round_ids]
    if @interview_round_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule.id)
    else
      @interview_round_ids.each do |eid|
      @interview_round = InterviewRound.find(eid)
      @interview_round.update(interview_round_confirm: true) 
      VacancyMasterMailer.round_info_to_candidate(@interview_schedule,@interview_round).deliver_now
      flash[:notice] = "Interview Round Confirmed Successfully"
      end 
     redirect_to new_interview_round_path(interview_schedule_id: @interview_schedule.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_round
      @interview_round = InterviewRound.find(params[:id])
    end

    def interview_round_reschedule_params
      params.require(:interview_round_reschedule).permit(:interview_round_id, :employee_id, :interview_type_id, :interview_date, :interview_time, :location)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_round_params
      params.require(:interview_round).permit(:interview_schedule_id, :employee_id, :interview_type_id, :interview_date, :interview_time, :location, :schedule_comment)
    end
end
