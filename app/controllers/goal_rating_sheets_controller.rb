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
    @employee_goals = []
    @goal_rating_sheets = GoalRatingSheet.all
    if @goal_rating_sheets.empty?
      @employee_goals = EmployeeGoal.all
    else
      @goal_rating_sheets.each do |a|
        temp = GoalRatingSheet.exists?(appraisee_id: current_user.employee_id, employee_goal_id: a.employee_goal_id)
        if temp
        else
          ea = EmployeeGoal.find(a.employee_goal_id)
          @employee_goals << ea
        end
      end
    end

  end

  # GET /goal_rating_sheets/1/edit
  def edit
    @employee_goals = EmployeeGoal.all
  end

  # POST /goal_rating_sheets
  # POST /goal_rating_sheets.json
  def create
    goal_rating_sheet_ids = params[:employee_goal_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
   
    final = goal_rating_sheet_ids.zip(comments,ratings)

    final.each do |e,c,r|
      emp = EmployeeGoal.find(e) 
      if c == ""
      flash[:alert] = "Fill comments"
      elsif r == ""
      flash[:alert] = "Fill all the fields"
      else
      GoalRatingSheet.create(appraisee_comment: c, appraisee_rating: r, appraisee_id: params[:appraisee_id], employee_goal_id: emp.id)
      flash[:notice] = "Employee Goal Created Successfully"
      end
    end
    redirect_to new_goal_rating_sheet_path  
  end

  # PATCH/PUT /goal_rating_sheets/1
  # PATCH/PUT /goal_rating_sheets/1.json
  def update
      if @goal_rating_sheet.update(goal_rating_sheet_params)
        flash[:notice] = "Updated Successfully"
        redirect_to goal_rating_sheets_path
      else
        flash[:alert] = "Not Updated"
        redirect_to new_goal_rating_sheet_path
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
    @performance_periods = PerformancePeriod.all
  end

  def appraiser_create
    goal_rating_sheets = params[:goal_rating_sheet_id]
    #employee_goals = params[:employee_goal_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating]
    final = goal_rating_sheets.zip(comments,ratings)
    final.each do |e,c,r|
      goal_rating_sheet = GoalRatingSheet.find(e)
      if c == ""
      flash[:alert] = "Fill comments"
      elsif r == ""
      flash[:alert] = "Fill ratings"
      else
      # emp = EmployeeGoal.find(e)
      #goal_rating_sheet = GoalRatingSheet.find(e)
      goal_rating_sheet.update(appraiser_comment: c, appraiser_rating: r, appraiser_id: params[:appraiser_id])
      end
    end
    redirect_to appraiser_goal_rating_sheets_path
  end

  def edit_goal_rating
    @goal_rating_sheet = GoalRatingSheet.find(params :format)
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