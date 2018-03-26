class SurveyQuestionsController < ApplicationController
  before_action :set_survey_question, only: [:show, :edit, :update, :destroy]

  # GET /survey_questions
  # GET /survey_questions.json
  def index
    @survey_questions = SurveyQuestion.all
  end

  # GET /survey_questions/1
  # GET /survey_questions/1.json
  def show
  end

  # GET /survey_questions/new
  def new
    @survey_question = SurveyQuestion.new
    @survey_questions = SurveyQuestion.all
    session[:active_tab] ="Survey"
    session[:active_tab1] ="Setup"
  end

  # GET /survey_questions/1/edit
  def edit
  end

  # POST /survey_questions
  # POST /survey_questions.json
  def create
    @survey_question = SurveyQuestion.new(survey_question_params)
    @survey_questions = SurveyQuestion.all
    respond_to do |format|
      if @survey_question.save
         @survey_question = SurveyQuestion.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Question Already Exist.'
        format.js { @flag = false }
      end
    end
    # @survey_question = SurveyQuestion.new(survey_question_params)

    # respond_to do |format|
    #   if @survey_question.save
    #     format.html { redirect_to @survey_question, notice: 'Survey question was successfully created.' }
    #     format.json { render :show, status: :created, location: @survey_question }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @survey_question.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /survey_questions/1
  # PATCH/PUT /survey_questions/1.json
  def update
    @survey_question.update(survey_question_params)
    @survey_question = SurveyQuestion.new
    @survey_questions = SurveyQuestion.all  
    # respond_to do |format|
    #   if @survey_question.update(survey_question_params)
    #     format.html { redirect_to @survey_question, notice: 'Survey question was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @survey_question }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @survey_question.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /survey_questions/1
  # DELETE /survey_questions/1.json
  def destroy
    @survey_question.destroy
    @survey_questions = SurveyQuestion.all
    # @survey_question.destroy
    # respond_to do |format|
    #   format.html { redirect_to survey_questions_url, notice: 'Survey question was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question
      @survey_question = SurveyQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_params
      params.require(:survey_question).permit(:survey_group_id, :question_code, :question_category, :question, :status)
    end
end
