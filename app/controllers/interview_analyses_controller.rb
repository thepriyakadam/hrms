class InterviewAnalysesController < ApplicationController
  before_action :set_interview_analysis, only: [:show, :edit, :update, :destroy]

  # GET /interview_analyses
  # GET /interview_analyses.json
  def index
    @interview_analyses = InterviewAnalysis.all
  end

  # GET /interview_analyses/1
  # GET /interview_analyses/1.json
  def show
  end

  # GET /interview_analyses/new
  def new
    # byebug
    @interview_analysis = InterviewAnalysis.new
    # @interview_schedule = InterviewSchedule.find(params[:abc])
    # byebug
    @interview_round = InterviewRound.find(params[:interview_round_id])
    @interview_rounds = InterviewRound.where(id: @interview_round)
    @interview_analyses = InterviewAnalysis.where(interview_round_id: @interview_round.id)
    # @interview_analyses = InterviewAnalysis.where(interview_round_id: @interview_round.id)

    @interview_schedule = InterviewSchedule.where(id: @interview_round.interview_schedule_id).take
    # @selected_resume = SelectedResume.where(id: @interview_schedule.selected_resume_id).take
    # @vacancy_master = VacancyMaster.where(id: @selected_resume.vacancy_master_id).take
  end

  def confirm_vacancy
    @interview_schedule = InterviewSchedule.find(params[:format])
    @selected_resume = SelectedResume.where(id: @interview_schedule.selected_resume_id).take
    @vacancy_master = VacancyMaster.where(id: @selected_resume.vacancy_master_id).take
    @interview_analyses = InterviewAnalysis.where(interview_schedule_id: @interview_schedule.id)
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  # GET /interview_analyses/1/edit
  def edit
    @interview_round = InterviewRound.find(@interview_analysis.interview_round_id)
    # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @interview_rounds = InterviewRound.where(interview_round_id: @interview_round.id)
  end

  # POST /interview_analyses
  # POST /interview_analyses.json

  def create
    @interview_analysis = InterviewAnalysis.new(interview_analysis_params)
    @interview_analyses = InterviewAnalysis.all
    # @interview_round = InterviewRound.find(params[:interview_round_id])
    @interview_round = InterviewRound.find(@interview_analysis.interview_round_id)
      if @interview_analysis.save
        InterviewAnalysis.where(id: @interview_analysis.id).update_all(interview_schedule_id: @interview_round.interview_schedule_id)
        @interview_analysis = InterviewAnalysis.new
        flash[:notice] = 'Interview Evaluation Details saved Successfully.'
      end
      @interview_round_id = InterviewRound.find(params[:interview_analysis][:interview_round_id])
      redirect_to new_interview_analysis_path(interview_round_id: @interview_round_id.id)
  end

  # PATCH/PUT /interview_analyses/1
  # PATCH/PUT /interview_analyses/1.json
  # def update
  #   respond_to do |format|
  #     if @interview_analysis.update(interview_analysis_params)
  #       format.html { redirect_to @interview_analysis, notice: 'Interview analysis was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @interview_analysis }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @interview_analysis.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

    # def update
    #   @interview_analysis.update(interview_analysis_params)
    #   @interview_analyses = InterviewAnalysis.all
    #   @interview_analysis = InterviewAnalysis.new
    # end

    def update
      @interview_round = InterviewRound.find(@interview_analysis.interview_round_id)

      if @interview_analysis.update(interview_analysis_params)
        @interview_analyses =  @interview_round.interview_analyses
        # c1 = @daily_bill_details.sum(:travel_expence).to_i
        # TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
        flash[:notice] = "Updated successfully"
      else
        flash[:alert] = "not updated"
      end
      redirect_to new_interview_analysis_path(interview_round_id: @interview_round.id)
  end

    # DELETE /interview_analyses/1
    # DELETE /interview_analyses/1.json
    # def destroy
    #   @interview_analysis.destroy
    #   respond_to do |format|
    #     format.html { redirect_to interview_analyses_url, notice: 'Interview analysis was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end

    def destroy
      @interview_analysis.destroy
      @interview_analyses = InterviewAnalysis.where(interview_schedule_id: @interview_schedule.id)
    end

    def print_interview_analysis_list
    # byebug
    # @interview_schedule =InterviewSchedule.find(params[:id])
    # @interview_analyses = InterviewAnalysis.all
    @interview_round = InterviewRound.find(params[:interview_round_id])
    @interview_analyses = InterviewAnalysis.where(interview_round_id: @interview_round.id)
     respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_interview_analysis_list',
        layout: '/layouts/pdf.html.erb',
        :template => 'interview_analyses/print_interview_analysis_list.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def confirm_interview_analysis
    @interview_round = InterviewRound.find(params[:interview_round_id])
    InterviewRound.where(id: @interview_round.id).update_all(is_confirm: true)
    # a=InterviewRound.where(id: @interview_round.id,is_confirm: nil)

    # a=InterviewRound.where(id: @interview_round.id,is_confirm: true).last
    # if a.is_confirm == true
    #   InterviewSchedule.where(id: @interview_round.interview_schedule.id).update_all(is_confirm: true)
    # else
    # end

    @interview_rounds_1 = InterviewRound.where(interview_schedule_id: @interview_round.interview_schedule_id,is_confirm: true).count
    @interview_rounds_2 = InterviewRound.where(interview_schedule_id: @interview_round.interview_schedule_id,is_confirm: nil).count
     if @interview_rounds_2 == 0 && @interview_rounds_1 > 0
        InterviewSchedule.where(id: @interview_round.interview_schedule.id).update_all(is_confirm: true)
     else
     end
    # if a.present?
    # else
    #   InterviewSchedule.where(id: @interview_round.interview_schedule.id).update_all(is_confirm: true)
    # end
    flash[:notice] = "Evaluation Confirmed Successfully"
    redirect_to interview_round_list_interview_schedules_path
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_interview_analysis
        @interview_analysis = InterviewAnalysis.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def interview_analysis_params
          params.require(:interview_analysis).permit(:interview_schedule_id,:interview_schedule_id,:interview_round_id,:vacancy_request_history_id, :interview_evalution_id, :interview_attribute_id, :interview_decision_id, :comment)
      end
  end
