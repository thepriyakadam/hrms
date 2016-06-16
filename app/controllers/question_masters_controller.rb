class QuestionMastersController < ApplicationController
  before_action :set_question_master, only: [:show, :edit, :update, :destroy]

  # GET /question_masters
  # GET /question_masters.json
  def index
    @question_masters = QuestionMaster.all
  end

  # GET /question_masters/1
  # GET /question_masters/1.json
  def show
  end

  # GET /question_masters/new
  def new
    @question_master = QuestionMaster.new
    @question_masters = QuestionMaster.all
    session[:active_tab] ="master"
    session[:active_tab1] ="exit_interview_master_setup"
  end

  # GET /question_masters/1/edit
  def edit
  end

  # POST /question_masters
  # POST /question_masters.json
  def create
     @question_master = QuestionMaster.new(question_master_params)
    @question_masters = QuestionMaster.all
    respond_to do |format|
      if @question_master.save
         @question_master = QuestionMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Question Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /question_masters/1
  # PATCH/PUT /question_masters/1.json
  def update
    @question_master.update(question_master_params)
   @question_master = QuestionMaster.new
   @question_masters = QuestionMaster.all
  end

  # DELETE /question_masters/1
  # DELETE /question_masters/1.json
  def destroy
    @question_master.destroy
    @question_masters = QuestionMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_master
      @question_master = QuestionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_master_params
      params.require(:question_master).permit(:code, :name, :description)
    end
end
