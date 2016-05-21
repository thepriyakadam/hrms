class InterviewEvalutionsController < ApplicationController
  before_action :set_interview_evalution, only: [:show, :edit, :update, :destroy]

  # GET /interview_evalutions
  # GET /interview_evalutions.json
  def index
    @interview_evalutions = InterviewEvalution.all
  end

  # GET /interview_evalutions/1
  # GET /interview_evalutions/1.json
  def show
  end

  # GET /interview_evalutions/new
  def new
    @interview_evalution = InterviewEvalution.new
  end

  # GET /interview_evalutions/1/edit
  def edit
  end

  # POST /interview_evalutions
  # POST /interview_evalutions.json
  def create
    @interview_evalution = InterviewEvalution.new(interview_evalution_params)

    respond_to do |format|
      if @interview_evalution.save
        format.html { redirect_to @interview_evalution, notice: 'Interview evalution was successfully created.' }
        format.json { render :show, status: :created, location: @interview_evalution }
      else
        format.html { render :new }
        format.json { render json: @interview_evalution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_evalutions/1
  # PATCH/PUT /interview_evalutions/1.json
  def update
    respond_to do |format|
      if @interview_evalution.update(interview_evalution_params)
        format.html { redirect_to @interview_evalution, notice: 'Interview evalution was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_evalution }
      else
        format.html { render :edit }
        format.json { render json: @interview_evalution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_evalutions/1
  # DELETE /interview_evalutions/1.json
  def destroy
    @interview_evalution.destroy
    respond_to do |format|
      format.html { redirect_to interview_evalutions_url, notice: 'Interview evalution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_evalution
      @interview_evalution = InterviewEvalution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_evalution_params
      params.require(:interview_evalution).permit(:code, :name, :description)
    end
end
