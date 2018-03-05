class SurveyDetailsController < ApplicationController
  before_action :set_survey_detail, only: [:show, :edit, :update, :destroy]

  # GET /survey_details
  # GET /survey_details.json
  def index
    @survey_details = SurveyDetail.all
    @survey_questions = SurveyQuestion.all
    @answer_masters = AnswerMaster.all
  end

  # GET /survey_details/1
  # GET /survey_details/1.json
  def show
  end

  # GET /survey_details/new
  def new
    @survey_details = SurveyDetail.where(employee_id: current_user.employee_id)
    @survey_detail = SurveyDetail.new
    #  @employees = Employee.where(manual_employee_code: '1023')
    # @employees.each do |e|
    #  @survey_questions = SurveyQuestion.where(status: true)
    #  @survey_questions.each do |sq|
    #   SurveyDetail.create(employee_id: e.id, survey_question_id: sq.id)
    #  end
    # end
  end

  # GET /survey_details/1/edit
  def edit
  end

  # POST /survey_details
  # POST /survey_details.json
  def create
    @survey_detail = SurveyDetail.new(survey_detail_params)

    respond_to do |format|
      if @survey_detail.save
        # format.html { redirect_to @new_survey_detail, notice: 'Survey detail was successfully created.' }
        #format.json { render :show, status: :created, location: @survey_detail }
        format.html { render :new }
      else
        format.html { render :new }
        format.json { render json: @survey_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_details/1
  # PATCH/PUT /survey_details/1.json
  def update
    respond_to do |format|
      if @survey_detail.update(survey_detail_params)
        format.html { redirect_to @survey_detail, notice: 'Survey detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_detail }
      else
        format.html { render :edit }
        format.json { render json: @survey_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_details/1
  # DELETE /survey_details/1.json
  def destroy
    @survey_detail.destroy
    respond_to do |format|
      format.html { redirect_to survey_details_url, notice: 'Survey detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_question
    @exl = 0 # for counting excellent
    @vg = 0  # for counting very good  
    @g = 0   # for counting good
    @ni = 0  # for counting needs improvement
    @un = 0  # for counting unsatisfied
    @tot = 0
    
    id = params[:commit]
    survey_detail = SurveyDetail.find_by(id: id)
    if params[:survey_detail][:excellent] == "excellent"
      survey_detail.update(excellent: true, very_good: false, good: false, needs_improvement: false, unsatisfied: false )
      @exl = @exl + 1
    elsif params[:survey_detail][:excellent] == "very_good"
      survey_detail.update(excellent: false, very_good: true, good: false, needs_improvement: false, unsatisfied: false)
      @vg = @vg + 1
    elsif params[:survey_detail][:excellent] == "good"
      survey_detail.update(excellent: false, very_good: false, good: true, needs_improvement: false, unsatisfied: false)
      @g = @g + 1
    elsif params[:survey_detail][:excellent] == "needs_improvement"
      survey_detail.update(excellent: false, very_good: false, good: false, needs_improvement: true, unsatisfied: false)
      @ni = @ni + 1
    elsif params[:survey_detail][:excellent] == "unsatisfied"
      survey_detail.update(excellent: false, very_good: false, good: false, needs_improvement: false, unsatisfied: true)
      @un = @un + 1
    else
      survey_detail.update(excellent: false, very_good: false, good: false, needs_improvement: false, unsatisfied: false)
    end
    @tot = @exl + @vg + @g + @ni + @un
    redirect_to  new_survey_detail_path
  end

  def show_detail
    @survey_details = SurveyDetail.where(employee_id: current_user.employee_id)
    # @survey_details = SurveyDetail.all
  end

  def create_survey
    @employees = Employee.all
    @employees.each do |e|
     @survey_questions = SurveyQuestion.where(status: true)
     @survey_questions.each do |sq|
      SurveyDetail.create(employee_id: e.id, survey_question_id: sq.id)
     end
    end
    redirect_to root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_detail
      @survey_detail = SurveyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_detail_params
      params.require(:survey_detail).permit(:excellent, :very_good, :good, :needs_improvement, :unsatisfied, :employee_id, :survey_question_id, :answer_master_id)
    end
end
