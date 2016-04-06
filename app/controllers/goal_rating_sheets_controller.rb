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
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id)
    if @goal_rating_sheets.empty?
      @employee_goals = EmployeeGoal.where(employee_id: current_user.employee_id)
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
    redirect_to goal_rating_sheets_path  
  end

  # PATCH/PUT /goal_rating_sheets/1
  # PATCH/PUT /goal_rating_sheets/1.json
  def update
      if @goal_rating_sheet.update(goal_rating_sheet_params)
        flash[:notice] = "Updated Successfully"
        redirect_to new_goal_rating_sheet_path
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
     @employee = Employee.find(params[:format])
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id)
    @goal_rating_sheet = GoalRatingSheet.new
    @performance_periods = PerformancePeriod.all
  end

  def appraiser_create
    @employee = Employee.find(params[:format])
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
    redirect_to appraiser_goal_rating_sheets_path(format: @employee.id)
  end

  def edit_goal_rating
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end
  
  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
  end
 

  def edit_appraiser
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end
  
  def update_appraiser
    #byebug
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    if @goal_rating_sheet.update(goal_rating_sheet_params)
      flash[:notice] = "Updated Successfully"
      redirect_to appraiser_goal_rating_sheets_path(current_user.employee_id)
    else
      flash[:alert] = "Not Updated "
      redirect_to appraiser_goal_rating_sheets_path(current_user.employee_id)
    end
  end

  def destroy_appraiser
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
    if @goal_rating_sheet.destroy
      flash[:notice] = "Deleted Successfully"
      redirect_to appraiser_goal_rating_sheets_path
    else
      flash[:alert] = "Not Deleted"
      redirect_to appraiser_goal_rating_sheets_path
    end
  end

  def is_confirm_appraiser
     @goal_rating_sheet = GoalRatingSheet.find(params[:format])
    
    @goal_rating_sheet.update(is_confirm_appraiser: true)

    redirect_to appraiser_goal_rating_sheets_path(@goal_rating_sheet.appraiser_id)
  end
 
 def is_confirm_appraisee
     @goal_rating_sheet = GoalRatingSheet.find(params[:format])
    
    @goal_rating_sheet.update(is_confirm_appraisee: true)

    redirect_to new_goal_rating_sheet_path
  end

 def modal
 end
 
 def appraisee_goal_list
   @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id)
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_rating_sheet
      @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_rating_sheet_params
      params.require(:goal_rating_sheet).permit(:is_confirm,:appraisee_id, :appraiser_id, :employee_goal_id, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
