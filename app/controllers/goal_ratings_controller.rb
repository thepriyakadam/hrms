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
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
    @goal_bunches = GoalBunch.all
    #byebug  
    #@performance_calendar = PerformanceCalendar.where(period_id: @goal_bunch.id)
    #@performance_calendars = PerformanceCalendar.where(start_date: @performance_calendar.start_date , end_date: @performance_calendar.end_date )
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
    goal_weightage_sum = @goal_rating.goal_weightage_sum(@goal_bunch, @goal_rating)
    if goal_weightage_sum <= 100
      @goal_rating.save
      @flag = true
      @goal_rating = GoalRating.new
      #@goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
      @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
      @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
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
      @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
      @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
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
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
  end

  def appraiser_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_appraiser_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
  end

  def reviewer_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_reviewer_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
  end

  def goal_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_goal_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
  end

  def attribute_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_attribute_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
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
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    sum = @goal_bunch.goal_ratings.sum(:goal_weightage)

    @gol_bunch = GoalBunch.find_by(id: @goal_bunch.id).update(goal_confirm: false)
    if sum == 100
      @emp = Employee.find(current_user.employee_id)
      GoalRatingMailer.send_email_to_appraiser(@emp).deliver_now
      flash[:notice] = "Mail Sent Successfully"
    else
      flash[:alert] = "Goal weightage sum should be 100"
    end
    redirect_to new_goal_rating_path(id: @goal_bunch.id)
  end

   def subordinate_list_goal_wise
  end

  def print_subordinate_list
    current_login = Employee.find(current_user.employee_id)

    @period = Period.find(params[:salary][:period_id])
    @goal_bunch = GoalBunch.find_by(period_id: @period.id)

    goal_bunches = GoalBunch.where(period_id: @period.id).pluck(:employee_id)
    subordinates = current_login.subordinates.pluck(:id)
    total_employee = goal_bunches & subordinates
    @employees = Employee.where(id: total_employee)
  end
 
  def all_subordinate_list
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    employee_ids = params[:employee_ids]
      if employee_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        @employees = []
        redirect_to subordinate_list_goal_wise_goal_ratings_path
      else
      @employees = []
      employee_ids.each do |e|
        emp = Employee.find(e)
        @employees << emp
        @goal_bunch = Employee.find(e)
        #@goal_bunch = GoalBunch.find(params[:id])
      end 
    end
  end

  def performance_type
  end
  
  def training_request
    @goal_ratings = GoalRating.where(goal_type: 'Goal',training_topic_master_id: nil)
    @attribute_ratings = GoalRating.where(goal_type: 'Attribute',training_topic_master_id: nil)
  end

  def create_attribute_training
    #byebug
    @employee = Employee.find(params[:emp_id])
    @training_topic_master_id = params[:training_topic_master_id]
    @attribute_master_id = params[:attribute_id]

    @attribute_rating = GoalRating.where(attribute_master_id: @attribute_master_id, appraisee_id: @employee.id,goal_type: 'Attribute').update_all(training_topic_master_id: @training_topic_master_id)
    flash[:notice] = "Created Successfully"
    redirect_to training_request_goal_ratings_path
  end

  def create_goal_training
    @employee = Employee.find(params[:emp_id])
    @training_topic_master_id = params[:training_topic_master_id]
    @goal_perspective_id = params[:goal_id]

    @goal_rating = GoalRating.where(goal_perspective_id: @goal_perspective_id,appraisee_id: @employee.id,goal_type: 'Goal').update_all(training_topic_master_id: @training_topic_master_id)
    flash[:notice] = "Created Successfully"
    redirect_to training_request_goal_ratings_path
  end

  def period_and_topic_wise_list
  end

  def period_topic_wise_employee
    @training_plan = TrainingPlan.new
    #@appraisee_id = params[:appraisee_id]
    @goal_bunch = GoalBunch.find_by_period_id(params[:period_id])
    @training_topic_master_id = params[:training_topic_master_id]
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id,training_topic_master_id: @training_topic_master_id)
    #@goal_ratings = GoalRating.all
  end

  def send_request_for_training
  end

  def modal_training_plan
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @goal_rating = GoalRating.where(goal_bunch_id: @goal_bunch_id.id)
    #redirect_to period_and_topic_wise_list_goal_ratings_path
  end

  def training_plan_create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_rating
      @goal_rating = GoalRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_rating_params
      params.require(:goal_rating).permit(:attribute_master_id,:goal_bunch_id, :goal_perspective_id, :goal_weightage, :goal_measure, :target, :aligned, :goal_setter_id, :appraisee_id, :appraisee_comment, :appraiser_id, :appraiser_comment, :appraiser_rating_id, :reviewer_id, :reviewer_comment,:goal_type)
    end
end