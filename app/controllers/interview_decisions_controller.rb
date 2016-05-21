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
  end

  # GET /interview_decisions/1/edit
  def edit
  end

  # POST /interview_decisions
  # POST /interview_decisions.json
  def create
    @interview_decision = InterviewDecision.new(interview_decision_params)

    respond_to do |format|
      if @interview_decision.save
        format.html { redirect_to @interview_decision, notice: 'Interview decision was successfully created.' }
        format.json { render :show, status: :created, location: @interview_decision }
      else
        format.html { render :new }
        format.json { render json: @interview_decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_decisions/1
  # PATCH/PUT /interview_decisions/1.json
  def update
    respond_to do |format|
      if @interview_decision.update(interview_decision_params)
        format.html { redirect_to @interview_decision, notice: 'Interview decision was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_decision }
      else
        format.html { render :edit }
        format.json { render json: @interview_decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_decisions/1
  # DELETE /interview_decisions/1.json
  def destroy
    @interview_decision.destroy
    respond_to do |format|
      format.html { redirect_to interview_decisions_url, notice: 'Interview decision was successfully destroyed.' }
      format.json { head :no_content }
    end
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
