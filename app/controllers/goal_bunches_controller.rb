class GoalBunchesController < ApplicationController
  before_action :set_goal_bunch, only: [:show, :edit, :update, :destroy]

  # GET /goal_bunches
  # GET /goal_bunches.json
  def index
    @goal_bunches = GoalBunch.all
  end

  # GET /goal_bunches/1
  # GET /goal_bunches/1.json
  def show
  end

  # GET /goal_bunches/new
  def new
    @goal_bunch = GoalBunch.new
    @goal_bunches = GoalBunch.all
  end

  # GET /goal_bunches/1/edit
  def edit
  end

  # POST /goal_bunches
  # POST /goal_bunches.json
  def create
    @goal_bunch = GoalBunch.new(goal_bunch_params)
      if @goal_bunch.save
        @flag = true
        @goal_bunch = GoalBunch.new
        @goal_bunches = GoalBunch.all
      else
        @flag = false
      end
  end

  # PATCH/PUT /goal_bunches/1
  # PATCH/PUT /goal_bunches/1.json
  def update
    if @goal_bunch.update(goal_bunch_params)
      @flag = true
      @goal_bunch = GoalBunch.new
      @goal_bunches = GoalBunch.all
    else
      @flag = false
    end
  end

  # DELETE /goal_bunches/1
  # DELETE /goal_bunches/1.json
  def destroy
    @goal_bunch.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to new_goal_bunch_path
  end

  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
  end

  def goal_approval
    @goal_bunch_id = GoalBunch.find(params[:id])
    @employee = Employee.find(params[:emp_id])
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id)
  end

  def appraiser_confirm
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])

    @employee = Employee.find(params[:id])
    @goal_rating_ids = params[:goal_rating_ids]
    if @goal_rating_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @goal_rating_ids.each do |eid|
      @goal_bunch = GoalBunch.find(eid)

      @goal_bunch.update(goal_confirm: true)      
      flash[:notice] = "Confirmed Successfully"  
    end
       GoalBunchMailer.send_email_to_appraisee(@goal_bunch).deliver_now
        flash[:notice] = "Email Send Successfully"
    end
      redirect_to goal_approval_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch_id.id)
  end

  def appraisee_comment
    @goal_bunch = GoalBunch.where(employee_id: current_user.employee_id, goal_confirm: true).take
    if @goal_bunch.nil?
      @goal_ratings = []
    else
      @goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil)
    end
    
    # @goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)
    @self_goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id).where.not(appraisee_comment: nil)
    @goal_rating = GoalRating.new
  end

  def self_comment
    @goal_rating_ids = params[:goal_rating_ids]
    comments = params[:appraisee_comment]
    final = @goal_rating_ids.zip(comments)
    final.each do |e, c|
      goal_rating = GoalRating.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      else
        goal_rating.update(appraisee_comment: c)
        flash[:notice] = 'Employee Goal Created Successfully'
      end
    end
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch_id.id)
  end

  def self_comment_confirm
    @goal_rating_ids = params[:goal_rating_ids]
      if @goal_rating_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_rating_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(appraisee_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
        end
      end
    redirect_to appraisee_comment_goal_bunches_path
  end

  def appraisee_comment
    @employee = Employee.find(current_user.employee_id)
    @goal_bunch_id = GoalBunch.find(params[:id]) 
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch_id.id)

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @self_goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id, goal_bunch_id: @goal_bunch_id.id).where.not(appraisee_comment: nil)
    @goal_rating = GoalRating.new

    @goal_bunch = GoalBunch.where(employee_id: current_user.employee_id, goal_confirm: true, id: @goal_bunch_id.id).take
    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Approved By Appraiser"
    else
      @goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil)
    end
    
    # @goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)
    
  end

  def appraiser_subordinate
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
  end

  def appraiser_comment
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_id = GoalBunch.find(params[:id]) 
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch_id.id)


    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @appraiser_goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id).where.not(appraiser_comment: nil)
    @goal_rating = GoalRating.new
    
    @goal_bunch = GoalBunch.where(employee_id: @employee.id, appraisee_confirm: true, id: @goal_bunch_id.id).take
    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Confirmed By Appraisee"
    else
      @goal_ratings = @goal_bunch.goal_ratings.where(appraiser_comment: nil)
      
    end
    #@goal_ratings = GoalRating.where(appraisee_id: @employee.id,appraiser_comment: nil)
    
  end
  
  def appraiser_create
    @employee = Employee.find(params[:emp_id])
    goal_rating_ids = params[:goal_rating_ids]
    comments = params[:appraiser_comments]
    ratings = params[:appraiser_ratings]
    final = goal_rating_ids.zip(comments, ratings)
    final.each do |e, c, r|
      goal_rating = GoalRating.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        goal_rating.update(appraiser_comment: c, appraiser_rating_id: r)
         flash[:notice] = 'Comment & Rating Created Successfully'
      end
    end
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
      redirect_to appraiser_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch_id.id)
  end

  def appraiser_comment_confirm
    @employee = Employee.find(params[:id])
    @goal_rating_ids = params[:goal_rating_ids]
      if @goal_rating_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_rating_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(appraiser_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
        end
      end
    redirect_to appraiser_comment_goal_bunches_path(id: @employee.id)
  end

  def reviewer_subordinate
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
  end
  
  def reviewer_comment
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_id = GoalBunch.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch_id.id)
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @reviewer_goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch_id.id).where.not(reviewer_comment: nil)
    @goal_rating = GoalRating.new

    @goal_bunch = GoalBunch.where(employee_id: @employee.id, appraiser_confirm: true, id: @goal_bunch_id.id).take
    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Confirmed By Appraiser"
    else
      @goal_ratings = @goal_bunch.goal_ratings.where(reviewer_comment: nil)
    end
    #@goal_ratings = GoalRating.where(appraisee_id: @employee.id,reviewer_comment: nil)
  end

  def reviewer_create
    @employee = Employee.find(params[:emp_id])
    goal_rating_ids = params[:goal_rating_ids]
    comments = params[:reviewer_comments]
    final = goal_rating_ids.zip(comments)
    final.each do |e, c|
      goal_rating = GoalRating.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      else
        goal_rating.update(reviewer_comment: c, reviewer_id: params[:reviewer_id])
        flash[:notice] = 'Comment Created Successfully'
      end
    end
      @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
      redirect_to reviewer_comment_goal_bunches_path(emp_id: @employee.id, id: @goal_bunch_id.id)
  end

  def reviewer_comment_confirm
    @employee = Employee.find(params[:id])
    @goal_rating_ids = params[:goal_rating_ids]
      if @goal_rating_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_rating_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(reviewer_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
        end
      end
    redirect_to reviewer_comment_goal_bunches_path(id: @employee.id)
  end

  def employee_list
    @employees = Employee.all
  end

  def final_comment
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_id = GoalBunch.find(params[:id])

    goal_bunch_check = GoalBunch.where(employee_id: @employee.id, appraiser_confirm: true).take
    if goal_bunch_check.nil?
      @goal_ratings = []
    else
      @goal_ratings = goal_bunch_check.goal_ratings.where(final_comment: nil, appraisee_id: @employee.id)
    end

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id,id: @goal_bunch_id.id)
    @goal_bunch = GoalBunch.find_by_employee_id(@employee.id)
  end

  def final_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @goal_bunch.update(goal_bunch_params)
    flash[:notice] = "final comment added Successfully"
    redirect_to final_comment_goal_bunches_path(emp_id: @employee.id, id:@goal_bunch.id)
    #redirect_to root_url
  end 

  def final_modal
    @goal_bunch = GoalBunch.find(params[:format])
  end

  def update_final_modal
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @goal_bunch.update(goal_bunch_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to final_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id, id: @goal_bunch.id)
  end

  def final_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_ids = params[:goal_bunch_ids]
      if @goal_bunch_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_bunch_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(final_confirm: true, final_id: params[:final_id])      
        flash[:notice] = "Confirmed Successfully"
        end
      end
      @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    redirect_to final_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def final_employee_list
    @employees = Employee.all
  end

  def final_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id).group(:employee_id)
  end

  def print_final_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)

    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_final_detail',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'goal_bunches/print_final_detail.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def modal_self_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
  end

  def self_overall_comment_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    comment = params[:goal_bunch][:appraisee_comment]
    @goal_bunch.update(appraisee_comment: comment,appraisee_id: params[:employee_id])
    flash[:notice] = "Overall Comment Created Successfully"
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def self_overall_comment_confirm
    @goal_bunch_ids = params[:goal_bunch_ids]
      if @goal_bunch_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_bunch_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(appraisee_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
      end
        GoalBunchMailer.send_email_to_appraiser(@goal_bunch).deliver_now
        flash[:notice] = "Email Sent Successfully"
        
      end
      @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
      @employee = Employee.find(params[:emp_id])
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def modal_appraiser_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
  end

  def appraiser_overall_comment_create
    @employee = Employee.find(current_user.employee_id)
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    comment = params[:goal_bunch][:appraiser_comment]
    @goal_bunch.update(appraiser_comment: comment,appraiser_id: params[:employee_id])
    flash[:notice] = "Overall Comment Created Successfully"
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id,id: @goal_bunch.id)
  end

  def appraiser_overall_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_ids = params[:goal_bunch_ids]
      if @goal_bunch_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_bunch_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(appraiser_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
        end
        GoalBunchMailer.send_email_to_reviewer(@goal_bunch).deliver_now
        flash[:notice] = "Email Sent Successfully"
      end
      @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def modal_reviewer_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
  end

  def reviewer_overall_comment_create
    @employee = Employee.find(current_user.employee_id)
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    comment = params[:goal_bunch][:review_comment]
    rating = params[:goal_bunch][:reviewer_rating_id]
    @goal_bunch.update(review_comment: comment,reviewer_rating_id: rating,reviewer_id: @employee.id)
    flash[:notice] = "Overall Comment/Rating Created Successfully"
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id,id: @goal_bunch.id)
  end

  def reviewer_overall_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_ids = params[:goal_bunch_ids]
      if @goal_bunch_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_bunch_ids.each do |eid|
        @goal_bunch = GoalBunch.find(eid)

        @goal_bunch.update(reviewer_confirm: true)      
        flash[:notice] = "Confirmed Successfully"
        end
      end
      @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def modal_period
    @goal_bunch = GoalBunch.find(params[:format])
  end

  def modal_period_create
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @goal_bunch.update(goal_bunch_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to new_goal_bunch_path
  end

  def xl_sheet_print
    # byebug
    @employee = Employee.find(params[:id])
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)                                 
  end

  def goal_period_list
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end
  
  def period_list_appraisee
    @employee = Employee.find(current_user.employee_id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def period_list_appraiser
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def period_list_reviewer
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def period_list_final
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def period_list_print
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_bunch
      @goal_bunch = GoalBunch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_bunch_params
      params.require(:goal_bunch).permit(:goal_confirm,:period_id, :employee_id, :appraisee_id, :appraisee_comment, :appraisee_confirm, :appraiser_id, :appraiser_rating, :appraiser_comment, :appraiser_confirm, :reviewer_id, :review_comment, :reviewer_rating_id, :reviewer_confirm, :final_id, :final_comment, :final_rating_id, :final_confirm)
    end
end
