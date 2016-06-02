class GoalRatingsController < ApplicationController
  before_action :set_goal_rating, only: [:show, :edit, :update, :destroy]

  # GET /goal_ratings
  # GET /goal_ratings.json
  def index
    @goal_ratings = GoalRating.all
  end

  # GET /goal_ratings/1
  # GET /goal_ratings/1.json
  def show
  end

  # GET /goal_ratings/new
  def new
    @goal_bunch = GoalBunch.find(params[:id])
    @goal_rating = GoalRating.new
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.all

  end

  # GET /goal_ratings/1/edit
  def edit
     @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
  end

  # POST /goal_ratings
  # POST /goal_ratings.json
  def create
    @goal_bunch = GoalBunch.find(params[:goal_rating][:goal_bunch_id])
    @goal_rating = GoalRating.new(goal_rating_params)

      if @goal_rating.save
        @flag = true
        @goal_rating = GoalRating.new
        @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
      else
        @flag = false
      end
  end

  # PATCH/PUT /goal_ratings/1
  # PATCH/PUT /goal_ratings/1.json
  def update
    @goal_bunch = GoalBunch.find(params[:goal_rating][:goal_bunch_id])

    if @goal_rating.update(goal_rating_params)
      @flag = true
      @goal_rating = GoalRating.new
      @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
    else
      @flag = false
    end
  end

  # DELETE /goal_ratings/1
  # DELETE /goal_ratings/1.json
  def destroy
    @goal_rating.destroy
    respond_to do |format|
      format.html { redirect_to goal_ratings_url, notice: 'Goal rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def self_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_self_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraisee_comment_goal_bunches_path
  end

  def appraiser_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_appraiser_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser_comment_goal_bunches_path(id: @goal_rating.appraisee_id)
  end

  def reviewer_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_reviewer_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to reviewer_comment_goal_bunches_path(id: @goal_rating.appraisee_id)
  end

  def goal_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_goal_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to goal_approval_goal_bunches_path(id: @goal_rating.appraisee_id)
  end

  def print_department
  end

  def show_employee
    @month = params[:month]
    @year = params[:year]
    department = params[:department_id]
    @salaryslips = Salaryslip.where(month: @month, year: @year.to_s).pluck(:employee_id)
    @employees = Employee.where(id: @salaryslips, department_id: department)
  end
  
  def send_mail_to_appraiser
    @emp = GoalRating.first
    GoalRatingMailer.send_email_to_appraiser(@emp).deliver_now
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_rating
      @goal_rating = GoalRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_rating_params
      params.require(:goal_rating).permit(:goal_bunch_id, :goal_perspective_id, :goal_weightage, :goal_measure, :target, :aligned, :goal_setter_id, :appraisee_id, :appraisee_comment, :appraiser_id, :appraiser_comment, :appraiser_rating_id, :reviewer_id, :reviewer_comment)
    end
end
