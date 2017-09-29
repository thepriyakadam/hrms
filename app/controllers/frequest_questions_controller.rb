class FrequestQuestionsController < ApplicationController
  before_action :set_frequest_question, only: [:show, :edit, :update, :destroy]

  # GET /frequest_questions
  # GET /frequest_questions.json
  def index
    @frequest_question = FrequestQuestion.new
    @frequest_questions = FrequestQuestion.all
  end

  # GET /frequest_questions/1
  # GET /frequest_questions/1.json
  def show
  end

  # GET /frequest_questions/new
  def new
    @frequest_question = FrequestQuestion.new
    @frequest_questions = FrequestQuestion.all
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events" 
  end

  # GET /frequest_questions/1/edit
  def edit
  end

  # POST /frequest_questions
  # POST /frequest_questions.json
  def create
    @frequest_question = FrequestQuestion.new(frequest_question_params)
    @frequest_questions = FrequestQuestion.all
    respond_to do |format|
      if @frequest_question.save
         @frequest_question = FrequestQuestion.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /frequest_questions/1
  # PATCH/PUT /frequest_questions/1.json
  def update
    @frequest_question.update(frequest_question_params)
     @frequest_questions = FrequestQuestion.all
      @frequest_question = FrequestQuestion.new
  end

  # DELETE /frequest_questions/1
  # DELETE /frequest_questions/1.json
  def destroy
    @frequest_question.destroy
   @frequest_questions = FrequestQuestion.all
  end

  def frequest_question_modal
    @frequest_question = FrequestQuestion.find(params[:format])
  end

  def list_of_faq
    @frequest_questions = FrequestQuestion.where(status: true)
    session[:active_tab] = "EmployeeSelfService"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequest_question
      @frequest_question = FrequestQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequest_question_params
      params.require(:frequest_question).permit(:code, :question, :answer, :employee_id, :status)
    end
end