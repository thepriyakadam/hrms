class GoalRatingSheetsController < ApplicationController
  before_action :set_goal_rating_sheet, only: [:show, :edit, :update, :destroy]

  # GET /goal_rating_sheets
  # GET /goal_rating_sheets.json
  def index
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id)

  end

  # GET /goal_rating_sheets/1
  # GET /goal_rating_sheets/1.json
  def show
  end

  # GET /goal_rating_sheets/new
  def new
    @goal_rating_sheet = GoalRatingSheet.new
    @goal_rating_sheets = GoalRatingSheet.all
    @employee_goals = EmployeeGoal.all
  end

  # GET /goal_rating_sheets/1/edit
  def edit
  end

  # POST /goal_rating_sheets
  # POST /goal_rating_sheets.json
  def create
    goal_rating_sheet_ids = params[:employee_goal_id]
    aligns = params[:allign_to_supervisor]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
    final = goal_rating_sheet_ids.zip(aligns,comments,ratings)

    final.each do |e,a,c,r|
      emp = EmployeeGoal.find(e)
      GoalRatingSheet.create(allign_to_supervisor: a, appraisee_comment: c, appraisee_rating: r, appraisee_id: params[:appraisee_id], employee_goal_id: emp.id)
    end
    flash[:notice] = "Employee Goal Created Successfully"
    redirect_to goal_rating_sheets_path
  end

  # PATCH/PUT /goal_rating_sheets/1
  # PATCH/PUT /goal_rating_sheets/1.json
  def update
    respond_to do |format|
      if @goal_rating_sheet.update(goal_rating_sheet_params)
        format.html { redirect_to @goal_rating_sheet, notice: 'Goal rating sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_rating_sheet }
      else
        format.html { render :edit }
        format.json { render json: @goal_rating_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_rating_sheets/1
  # DELETE /goal_rating_sheets/1.json
  def destroy
    @goal_rating_sheet.destroy
    respond_to do |format|
      format.html { redirect_to goal_rating_sheets_url, notice: 'Goal rating sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def appraiser 
    @goal_rating_sheets = GoalRatingSheet.all
    @goal_rating_sheet = GoalRatingSheet.new
  end

  def appraiser_create
    goal_rating_sheets = params[:goal_rating_sheet_id]
    #employee_goals = params[:employee_goal_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating]
    final = goal_rating_sheets.zip(comments,ratings)
    final.each do |e,c,r|
      # emp = EmployeeGoal.find(e)
      goal_rating_sheet = GoalRatingSheet.find(e)
      goal_rating_sheet.update(appraiser_comment: c, appraiser_rating: r, appraiser_id: params[:appraiser_id])
    end
    flash[:notice] = "Appraiser Goal Created Successfully"
    redirect_to appraiser_goal_rating_sheets_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_rating_sheet
      @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_rating_sheet_params
      params.require(:goal_rating_sheet).permit(:appraisee_id, :appraiser_id, :employee_goal_id, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
