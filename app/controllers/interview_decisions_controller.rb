class InterviewDecisionsController < ApplicationController
  before_action :set_interview_decision, only: [:show, :edit, :update, :destroy]

  # GET /interview_decisions
  # GET /interview_decisions.json
  def index
    @interview_decisions = InterviewDecision.all
  end

  # GET /interview_decisions/1
  # GET /interview_decisions/1.json
  def show
  end

  # GET /interview_decisions/new
  def new
    @interview_decision = InterviewDecision.new
    @interview_decisions = InterviewDecision.all
  end

  # GET /interview_decisions/1/edit
  def edit
  end

  # POST /interview_decisions
  # POST /interview_decisions.json
  def create
    @interview_decision = InterviewDecision.new(interview_decision_params)
    @interview_decisions = InterviewDecision.all
    respond_to do |format|
      if @interview_decision.save
         @interview_decision = InterviewDecision.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_decisions/1
  # PATCH/PUT /interview_decisions/1.json
  def update
    @interview_decision.update(interview_decision_params)
    @interview_decisions = InterviewDecision.all
    @interview_decision = InterviewDecision.new
  end

  # DELETE /interview_decisions/1
  # DELETE /interview_decisions/1.json
  def destroy
    @interview_decision.destroy
    @interview_decision = InterviewDecision.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_decision
      @interview_decision = InterviewDecision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_decision_params
      params.require(:interview_decision).permit(:code, :name, :description)
    end
end
