class CandidateInterviewSchedulesController < ApplicationController
  before_action :set_candidate_interview_schedule, only: [:show, :edit, :update, :destroy]

  # GET /candidate_interview_schedules
  # GET /candidate_interview_schedules.json
  def index
    @candidate_forms = CandidateForm.all
    # @candidate_interview_schedules = CandidateInterviewSchedule.all
    session[:active_tab] = "VacancyRequest"
  end

  # GET /candidate_interview_schedules/1
  # GET /candidate_interview_schedules/1.json
  def show
  end

  # GET /candidate_interview_schedules/new
  def new
    @candidate_interview_schedule = CandidateInterviewSchedule.new
    @candidate_form = CandidateForm.find(params[:candidate_form_id])
  end

  # GET /candidate_interview_schedules/1/edit
  def edit
  end

  # POST /candidate_interview_schedules
  # POST /candidate_interview_schedules.json

 def create
    @candidate_interview_schedule = CandidateInterviewSchedule.new(candidate_interview_schedule_params)

    respond_to do |format|
      if @candidate_interview_schedule.save
        VacancyRequestMailer.interview_schedule(@candidate_interview_schedule).deliver_now
        VacancyRequestMailer.candidate_email(@candidate_interview_schedule).deliver_now
        format.html { redirect_to @candidate_interview_schedule, notice: 'Interview scheduled Successfully.' }
        format.json { render :show, status: :created, location: @candidate_interview_schedule }
      else
        format.html { render :new }
        format.json { render json: @candidate_interview_schedule.errors, status: :unprocessable_entity }
      end
    end
  end


  # def create
  #   @candidate_interview_schedule = CandidateInterviewSchedule.new(candidate_interview_schedule_params)
  #   @candidate_interview_schedule.save
  #    redirect_to candidate_interview_schedules_path
  # end

  # PATCH/PUT /candidate_interview_schedules/1
  # PATCH/PUT /candidate_interview_schedules/1.json
  def update
    respond_to do |format|
      if @candidate_interview_schedule.update(candidate_interview_schedule_params)
        format.html { redirect_to @candidate_interview_schedule, notice: 'Candidate interview schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_interview_schedule }
      else
        format.html { render :edit }
        format.json { render json: @candidate_interview_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_interview_schedules/1
  # DELETE /candidate_interview_schedules/1.json
  def destroy
    @candidate_interview_schedule.destroy
    respond_to do |format|
      format.html { redirect_to candidate_interview_schedules_url, notice: 'Candidate interview schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def interview
    @candidate_interview_schedules = CandidateInterviewSchedule.all
  end

  def modal
    @candidate_interview_schedule = CandidateInterviewSchedule.find(params[:format])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_interview_schedule
      @candidate_interview_schedule = CandidateInterviewSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_interview_schedule_params
      params.require(:candidate_interview_schedule).permit(:candidate_form_id, :interviewer_id, :interview_type_master_id, :date, :time, :place, :address, :description)
    end
end
