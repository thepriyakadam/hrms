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
    @interview_analysis = InterviewAnalysis.new
    @interview_analyses = InterviewAnalysis.all
    @interview_schedule = InterviewSchedule.find(params[:format])
  end

  # GET /interview_analyses/1/edit
  def edit
  end

  # POST /interview_analyses
  # POST /interview_analyses.json

  def create
    @interview_analysis = InterviewAnalysis.new(interview_analysis_params)
    @interview_analyses = InterviewAnalysis.all
    respond_to do |format|
      if @interview_analysis.save
         @interview_analysis = InterviewAnalysis.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
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

    def update
      @interview_analysis.update(interview_analysis_params)
      @interview_analyses = InterviewAnalysis.all
      @interview_analysis = InterviewAnalysis.new
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
      @interview_analyses = InterviewAnalysis.all
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_interview_analysis
        @interview_analysis = InterviewAnalysis.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def interview_analysis_params
          params.require(:interview_analysis).permit(:interview_schedule_id,:vacancy_request_history_id, :interview_evalution_id, :interview_attribute_id, :interview_decision_id, :comment)
      end
  end
