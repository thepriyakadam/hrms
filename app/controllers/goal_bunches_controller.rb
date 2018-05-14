# require 'query_report/helper'
class GoalBunchesController < ApplicationController
  before_action :set_goal_bunch, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

  #before_filter :authenticate_user!
 # include QueryReport::Helper  # need to include it
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
    @goal_bunches = GoalBunch.where(employee_id: current_user.employee_id)
    #@period_id = params[:period_id]
    session[:active_tab] ="EmployeeSelfService"
  end

  def create
    @goal_bunch = GoalBunch.new(goal_bunch_params)
      if @goal_bunch.save
        @flag = true
        @goal_bunch = GoalBunch.new
        @goal_bunches = GoalBunch.where(employee_id: current_user.employee_id)
      else
        @flag = false
      end
  end
  
  # GET /goal_bunches/1/edit
  def edit
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

  # POST /goal_bunches
  # POST /goal_bunches.json
  def self_evaluation
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)

  end

  def appraiser_evaluation
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
  end

  def import_xl
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
  end

  def import
    goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    employee = Employee.find(params[:employee_id])
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_goal_bunches_path(employee_id: employee.id,goal_bunch_id: goal_bunch.id)
      else
        GoalBunch.import(params[:file])
        redirect_to appraisee_comment_goal_bunches_path(emp_id: employee.id,id: goal_bunch.id), notice: "File imported."
      end
  end

  def import_appraiser_evaluation_xl
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
  end

  def import_appraiser
    goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    employee = Employee.find(params[:employee_id])
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_appraiser_evaluation_xl_goal_bunches_path
    else
      GoalBunch.import_appraiser_evaluation(params[:file])
      redirect_to appraiser_comment_goal_bunches_path(emp_id: employee.id,goal_id: goal_bunch.id,period_id: goal_bunch.period_id), notice: "File imported."
    end
  end

  def admin_period_set
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def show_periodwise_employee
    @period_id = params[:salary][:period_id]
    goal_bunches = GoalBunch.where(period_id: @period_id).pluck(:employee_id)
    @employees = Employee.where(status: "Active").where.not(id: goal_bunches)
  end
  
  def create_admin_level_period
    @employee_ids = params[:employee_ids]
    @period = Period.find_by_id(params[:period_id1])
    period_id = @period.id
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        GoalBunch.create(employee_id: eid,period_id: period_id)
        flash[:notice] = "Created successfully"
      end
    end
    redirect_to admin_period_set_goal_bunches_path
  end

  def period_list_for_status
    @period = Period.where(status: true)
  end

  def status_list
    @period = Period.find_by(id: params[:period_id])
    @goal_bunches = GoalBunch.where(period_id: @period.id)
  end

  def period_list_appraisee
    @employee = Employee.find(current_user.employee_id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def appraiser_confirm
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
    @period = Period.find(params[:period_id])

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id)

      @goal_bunch = GoalBunch.find_by(id: @goal_bunch_id)
      sum = @goal_bunch.goal_ratings.sum(:goal_weightage)
    if sum.round == 100
      @goal_bunch.update(goal_approval: true)
      flash[:notice] = "Confirmed Successfully" 
      # GoalBunchMailer.send_email_to_appraisee(@goal_bunch).deliver_now
    else
      flash[:alert] = "Goal weightage sum should be 100"
    end 
    if @employee.id == current_user.employee_id
      redirect_to goal_period_list_goal_bunches_path(period_id: @period.id)
    else
      redirect_to admin_level_goal_approval_goal_bunches_path(period_id: @period.id)
    end
  end

  def revert_goal
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
    @goal_bunch = GoalBunch.find_by(id: @goal_bunch_id)
    @goal_bunch.update(goal_approval: false,goal_confirm: false)
      flash[:alert] = "Goal Rejected Successfully"
      redirect_to goal_period_list_goal_bunches_path(period_id: @period.id)
  end

  def create_multiple_bunch
   @goal_bunch = GoalBunch.new(goal_bunch_params)
    if @goal_bunch.save
      @flag = true
      @goal_bunch = GoalBunch.new 
      redirect_to period_for_multiple_goal_bunches_path
    else
      @flag = false
    redirect_to period_for_multiple_goal_bunches_path
    end
  end

  def period_for_multiple
    @goal_bunches = GoalBunch.all
  end

  def subordinate_list
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def admin_self_evaluation_period
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end
  
  def admin_level_self_evaluation
    @period = Period.find(params[:period_id])
    @goal_bunches = GoalBunch.where(period_id: @period.id,goal_approval: true)
  end

  def admin_goal_approval_period
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def admin_level_goal_approval
    @period = Period.find(params[:period_id])
    @goal_bunches = GoalBunch.where(period_id: @period.id,goal_confirm: true,goal_approval: false)
  end

  def goal_period_list
    @period = Period.find(params[:period_id])
    current_login = Employee.find(current_user.employee_id)
    @emps = current_login.subordinates.pluck(:id)
    #@emp1 = Employee.where(id: @emps).pluck(:id)
    @employees = GoalBunch.where(employee_id: @emps,period_id: @period.id,goal_confirm: true,goal_approval: false)
    # end
    # @employee = Employee.find(params[:format])
    # @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def goal_approval
    @goal_bunch_id = GoalBunch.find(params[:id])
    @employee = Employee.find(params[:emp_id])
    @period =  Period.find(params[:period_id])
    @goal_bunches = GoalBunch.find_by(id: @goal_bunch_id.id)

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ? AND appraisee_id = ?", @goal_bunch_id.id ,'Attribute',@employee.id)
    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
  end

  def appraiser_subordinate
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(appraisee_confirm: true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def period_list_appraiser
     @period = Period.find(params[:period_id])
    current_login = Employee.find(current_user.employee_id)
    @emps = current_login.subordinates.pluck(:id)
    @employees = GoalBunch.where(employee_id: @emps,goal_approval: true,period_id: @period.id)
  end

  def appraiser_comment
    @period = Period.find(params[:period_id])
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_id = GoalBunch.find(params[:goal_id]) 
    @goal_bunches = GoalBunch.find_by(id: @goal_bunch_id.id)
    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @appraiser_goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal').where.not(appraiser_comment: nil)
    @appraiser_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where.not(appraiser_comment: nil)
     # appraiser_goal_sum = GoalRating.appraiser_goal_sum(@appraiser_goal_ratings)
     # appraiser_attribute_sum = GoalRating.appraiser_attribute_sum(@appraiser_attribute_ratings)
    @goal_rating = GoalRating.new
    
    @goal_bunch = GoalBunch.where(employee_id: @employee.id, appraisee_confirm: true, id: @goal_bunch_id.id).take
    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Confirmed By Appraisee"
    else
      #@goal_ratings = @goal_bunch.goal_ratings.where(appraiser_comment: nil)
    @goal_ratings = @goal_bunch.goal_ratings.where(appraiser_comment: nil,goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where(appraiser_comment: nil)
    end
    #@goal_ratings = GoalRating.where(appraisee_id: @employee.id,appraiser_comment: nil)    
  end

  # def appraisee_comment
  #   @goal_bunch = GoalBunch.where(employee_id: current_user.employee_id, goal_confirm: true).take
  #   if @goal_bunch.nil?
  #     @goal_ratings = []
  #   else
  #   #@goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil)
  #   @goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil,goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
  #   @goal_attribute_ratings = GoalRating.where("goal_type = 'Attribute'")
  #   end
  #   @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
  #   # @goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)
  #   @self_goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id).where.not(appraisee_comment: nil)
  #   @goal_rating = GoalRating.new
  #   session[:active_tab] ="selfservice"
  # end

  def self_comment_modal
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
    @goal_rating = GoalRating.find(params[:goal_rating_id])
  end 

  def ajax_upload_document
    if params[:document_present] == "Yes"
      @flag = true
    else
      @flag = false
    end
  end

  def self_comment
    @goal_rating_ids = params[:goal_rating_ids]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
    
    document_present = params[:goal_ratings][:document_present]

    if document_present == "Yes"
      documents = params[:goal_ratings][:document]
      doc = [documents]

      goal_bunch = GoalBunch.find(params[:goal_bunch_id])
      @period = Period.find_by(id: goal_bunch.period_id)
      final = @goal_rating_ids.zip(comments,ratings,doc)
      final.each do |e, c, r,d|
        @goal_rating = GoalRating.find(e)
        if c == ''
          flash[:alert] = 'Fill comments'
        elsif r == ''
          flash[:alert] = 'Fill ratings'
        else
          if @period.marks == true
            @rating = Rating.find_by(id: r)
            weightage = @goal_rating.goal_weightage
            rating = @rating.value

            if rating.to_f <= weightage.to_f
              @goal_rating.update(appraisee_comment: c, appraisee_rating_id: r,document: d,document_present: "Yes")
              flash[:notice] = 'Self Comment & Rating Created Successfully'
            else
              rating1 = Rating.where(value: weightage.to_f).take
              if rating1.nil?
                flash[:notice] = 'Please Select Rating less then or equals to weightage'
              else
                @goal_rating.update(appraisee_comment: c, appraisee_rating_id: rating1.id,document: d,document_present: "Yes")
                flash[:notice] = 'Self Comment & Rating Created Successfully'
              end
            end
          else
            @goal_rating.update(appraisee_comment: c, appraisee_rating_id: r,document: d,document_present: "Yes")
            flash[:notice] = 'Self Comment & Rating Created Successfully'
          end
          
        end
      end
    else
      @checkbox = false
      goal_bunch = GoalBunch.find(params[:goal_bunch_id])
      @period = Period.find_by(id: goal_bunch.period_id)
      final = @goal_rating_ids.zip(comments,ratings)
      final.each do |e, c, r|
        @goal_rating = GoalRating.find(e)
        if c == ''
          flash[:alert] = 'Fill comments'
        elsif r == ''
          flash[:alert] = 'Fill ratings'
        else
          if @period.marks == true
            @rating = Rating.find_by(id: r)
            weightage = @goal_rating.goal_weightage
            rating = @rating.value

            if rating.to_f <= weightage.to_f
              @goal_rating.update(appraisee_comment: c, appraisee_rating_id: r,document_present: "No",document: nil)
              flash[:notice] = 'Self Comment & Rating Created Successfully'
            else
              rating1 = Rating.where(value: weightage.to_f).take
              if rating1.nil?
                flash[:notice] = 'Please Select Rating less then or equals to weightage'
              else
                @goal_rating.update(appraisee_comment: c, appraisee_rating_id: rating1.id,document_present: "No",document: nil)
                flash[:notice] = 'Self Comment & Rating Created Successfully'
              end
            end
          else
            @goal_rating.update(appraisee_comment: c, appraisee_rating_id: r,document_present: "No",document: nil)
            flash[:notice] = 'Self Comment & Rating Created Successfully'
          end
        end
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
    @goal_bunch_id = GoalBunch.find(params[:id]) 
    @employee = Employee.find(params[:emp_id])
    @goal_bunches = GoalBunch.find_by(id: @goal_bunch_id.id)
    @period = Period.find_by(id: @goal_bunches.period_id)

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    #@self_goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id, goal_bunch_id: @goal_bunch_id.id).where.not(appraisee_comment: nil)
    @goal_rating = GoalRating.new

    @self_goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal').where.not(appraisee_comment: nil)
    @self_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where.not(appraisee_comment: nil)
    
     @goal_bunche = GoalBunch.where(employee_id: @employee.id)
     @goal_bunch_group = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch_id.id).group(:employee_id)

    @goal_bunch = GoalBunch.where(employee_id:@employee.id, goal_approval: true, id: @goal_bunch_id.id).take
    
    #pdf
     @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal',appraisee_comment: nil)
     @goal_attribute_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch_id.id, goal_type: 'Attribute',appraisee_comment: nil)

    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Approved By Appraiser"
    else
      #@goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil)
      #@goal_ratings = @goal_bunch.goal_ratings.where(appraisee_comment: nil,goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal')
      #@goal_attribute_ratings = @goal_bunch.goal_ratings.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where(appraisee_comment: nil)
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'appraisee_comment',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'goal_bunches/appraisee_detail_list.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  

    # @goal_ratings = GoalRating.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)  
  end

  def appraiser_comment_modal
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
  end
  
  def appraiser_create
    @employee = Employee.find(params[:emp_id])
    goal_rating_ids = params[:goal_rating_ids]
    comments = params[:appraiser_comments]
    ratings = params[:appraiser_ratings]
    @period = Period.find(params[:period_id])

    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
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
      #GoalBunch.where(id: @goal_bunch_id.id).update_all(appraiser_rating: appraiser_rating)
    end
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @employee.id,goal_id: @goal_bunch_id.id,period_id: @period.id)
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


  def import_reviewer_evaluation_xl
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
  end

  def import_reviewer
    goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    employee = Employee.find(params[:employee_id])
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_reviewer_evaluation_xl_goal_bunches_path
    else
      GoalBunch.import_reviewer_evaluation(params[:file])
      redirect_to reviewer_comment_goal_bunches_path(emp_id: employee.id,id: goal_bunch.id,period_id: goal_bunch.period_id), notice: "File imported."
    end
  end

  def reviewer_evaluation
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id)
  end

  def reviewer_subordinate
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(appraiser_confirm: true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end
  
  def period_list_reviewer
    @period = Period.find(params[:period_id])
    current_login = Employee.find(current_user.employee_id)
    @emps = current_login.indirect_subordinates.pluck(:id)
    @employees = GoalBunch.where(employee_id: @emps,appraiser_confirm: true,period_id: @period.id)
  end

  def reviewer_comment
    @period = Period.find(params[:period_id])
    @employee = Employee.find(params[:emp_id])
    @goal_bunch_id = GoalBunch.find(params[:id])
    @goal_bunches = GoalBunch.find_by(id: @goal_bunch_id.id)
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @reviewer_goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal').where.not(reviewer_comment: nil)
    @reviewer_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where.not(reviewer_comment: nil)
    @goal_rating = GoalRating.new

    @goal_bunch = GoalBunch.where(employee_id: @employee.id, appraiser_confirm: true, id: @goal_bunch_id.id).take
    if @goal_bunch.nil?
      @goal_ratings = []
      flash[:alert] = "Not Confirmed By Appraiser"
    else
      #@goal_ratings = @goal_bunch.goal_ratings.where(reviewer_comment: nil)
    @goal_ratings = @goal_bunch.goal_ratings.where(reviewer_comment: nil,goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute').where(reviewer_comment: nil)
    end
    #@goal_ratings = GoalRating.where(appraisee_id: @employee.id,reviewer_comment: nil)
  end

  def reviewer_comment_modal
    @goal_bunch_id = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
  end
  
  def reviewer_create
    @employee = Employee.find(params[:emp_id])
    goal_rating_ids = params[:goal_rating_ids]
    @period = Period.find(params[:period_id])
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
      redirect_to reviewer_comment_goal_bunches_path(emp_id: @employee.id, id: @goal_bunch_id.id,period_id: @period.id)
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
    @periods = Period.where(status: true).group(:name)
    @goal_bunches = GoalBunch.where(" appraiser_confirm = ? OR reviewer_confirm = ?", true,true).group(:period_id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def period_list_final
   @period = Period.find(params[:period_id])
    emp_manager_nil = Employee.where(manager_2_id: nil).pluck(:id)
    emp_manager_present = Employee.where.not(manager_2_id: nil).pluck(:id)
    @goal_bunch_appraiser = GoalBunch.where(period_id: @period.id,employee_id: emp_manager_nil).pluck(:id)
    goal_bunch_appraiser = GoalBunch.where(id: @goal_bunch_appraiser).where(appraiser_confirm: true).pluck(:employee_id)
    @goal_bunch_reviewer = GoalBunch.where(period_id: @period.id,employee_id: emp_manager_present).pluck(:id)
    goal_bunch_reviewer = GoalBunch.where(id: @goal_bunch_reviewer).where(reviewer_confirm: true).pluck(:employee_id)

    employee = goal_bunch_appraiser + goal_bunch_reviewer
    @employees = GoalBunch.where(employee_id: employee,period_id: @period.id)
    #@employees = GoalBunch.where("employee_id = ? OR employee_id = ?",goal_bunch_appraiser,goal_bunch_reviewer).where(period_id: @period.id)
    # @emp1 = GoalBunch.where(" appraiser_confirm = ? OR reviewer_confirm = ?", true,true).pluck(:employee_id)
    # @employees = GoalBunch.where(employee_id: @emp1,period_id: @period.id)
  end

  def final_comment
    @period = Period.find(params[:period_id])
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

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch_id.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch_id.id ,'Attribute')
    @goal_bunches = GoalBunch.find_by(id: @goal_bunch_id.id)
    @goal_bunch = GoalBunch.find_by(id: @goal_bunch_id.id)
  end

  def final_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
    @goal_bunch.update(goal_bunch_params)
    flash[:notice] = "final comment added Successfully"
    redirect_to final_comment_goal_bunches_path(emp_id: @employee.id, id:@goal_bunch.id,period_id: @period.id)
  end 

  def final_modal
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
  end

  def update_final_modal
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
    @goal_bunch.update(goal_bunch_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to final_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id, id: @goal_bunch.id,period_id: @period.id)
  end

  def final_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
     
        GoalBunch.find_by(id: @goal_bunch.id).update(final_confirm: true, final_id: params[:final_id])      
       
    redirect_to final_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id,period_id: @period.id)
  end

  def final_employee_list
    @employees = Employee.all
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def final_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')

    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
  end

  def print_final_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
    
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

  def print_appraisee_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
     #@goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id)

     @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
     @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')

    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_appraisee_detail',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'goal_bunches/print_appraisee_detail.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def print_appraiser_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')

    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_appraiser_detail',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'goal_bunches/print_appraiser_detail.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def print_reviewer_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)

    @employee_promotions = EmployeePromotion.where(employee_id: current_user.employee_id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
     #@goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id)
     @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
     @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')

    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_reviewer_detail',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 14,
                          :right  => 14},
               orientation: 'Landscape',
               template: 'goal_bunches/print_reviewer_detail.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def modal_self_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @appraisee_overall = params[:appraisee_overall]
    @employee = Employee.find(params[:employee_id])
  end

  def self_overall_comment_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    comment = params[:goal_bunch][:appraisee_comment]
    @appraisee_overall = params[:appraisee_overall]

    @goal_bunch.update(appraisee_rating_id: @appraisee_overall,appraisee_comment: comment,appraisee_id: params[:employee_id])
    
    flash[:notice] = "Overall Comment Created Successfully"
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def self_overall_comment_confirm
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    GoalBunch.find_by(id: @goal_bunch.id).update(appraisee_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    GoalBunchMailer.send_email_to_appraiser(@goal_bunch).deliver_now
    @employee = Employee.find(params[:emp_id])

    redirect_to appraisee_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id)
  end

  def   modal_appraiser_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @appraiser_overall = params[:appraiser_overall]
    @period = Period.find(params[:period_id])
    @employee = Employee.find(params[:employee_id])
  end

  def appraiser_overall_comment_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @appraiser_overall = params[:appraiser_overall]
    @period = Period.find(params[:period_id])

    if @employee.manager_2_id.nil? 
      promotion = params[:goal_bunch][:r_promotion]
      increment = params[:goal_bunch][:r_increment]
      designation = params[:goal_bunch][:r_designation_id]
      ctc = params[:goal_bunch][:r_ctc]
      transfer_option = params[:goal_bunch][:transfer_option]
      transfer = params[:goal_bunch][:transfer]
      comment = params[:goal_bunch][:comment]
      appraiser_comment = params[:goal_bunch][:appraiser_comment]
      @goal_bunch.update(appraiser_rating: @appraiser_overall,comment: comment,transfer_option: transfer_option,transfer: transfer,r_promotion: promotion,r_increment: increment,r_designation_id: designation,r_ctc: ctc,appraiser_comment: appraiser_comment,appraiser_id: params[:employee_id])
    else
      appraiser_comment = params[:goal_bunch][:appraiser_comment]
      @goal_bunch.update(appraiser_rating: @appraiser_overall,appraiser_comment: appraiser_comment,appraiser_id: params[:employee_id])
    end

    @goal_bunch.update(appraiser_rating: @appraiser_overall)
    flash[:notice] = "Overall Comment Created Successfully"
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id,goal_id: @goal_bunch.id,period_id: @period.id)
  end

  def appraiser_overall_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @period = Period.find(params[:period_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
      GoalBunch.find_by(id: @goal_bunch.id).update(appraiser_confirm: true)      
      flash[:notice] = "Confirmed Successfully"
          if @employee.manager_2_id == nil
            flash[:notice] = "No Reviewer Available"
          else
            GoalBunchMailer.send_email_to_reviewer(@goal_bunch).deliver_now
            flash[:notice] = "Appraiser Evaluation Confirmed Email Sent Successfully"
          end
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @employee.id,goal_id: @goal_bunch.id,period_id: @period.id)
  end

  def modal_reviewer_overall
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
    @employee = Employee.find(params[:employee_id])
  end

  def reviewer_overall_comment_create
    @employee = Employee.find(params[:employee_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])

    review_comment = params[:goal_bunch][:review_comment]
    rating = params[:goal_bunch][:reviewer_rating_id]
    promotion = params[:goal_bunch][:r_promotion]
    increment = params[:goal_bunch][:r_increment]
    designation = params[:goal_bunch][:r_designation_id]
    ctc = params[:goal_bunch][:r_ctc]
    transfer_option = params[:goal_bunch][:transfer_option]
    transfer = params[:goal_bunch][:transfer]
    comment = params[:goal_bunch][:comment]
    @goal_bunch.update(comment: comment,transfer_option: transfer_option,transfer: transfer,review_comment: review_comment,reviewer_rating_id: rating,reviewer_id: @employee.id,r_promotion: promotion,r_increment: increment,r_designation_id: designation,r_ctc: ctc)
    flash[:notice] = "Overall Comment/Rating Created Successfully"
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @goal_bunch.employee_id,id: @goal_bunch.id,period_id: @period.id)
  end

  def reviewer_overall_comment_confirm
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @period = Period.find(params[:period_id])
      
    GoalBunch.find_by(id: @goal_bunch.id).update(reviewer_confirm: true)      
    flash[:notice] = "Confirmed Successfully"
        
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @employee.id,id: @goal_bunch.id,period_id: @period.id)
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
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id,id: @goal_bunch.id)                                 
  end

  def xl_appraisee_detail
    @employee = Employee.find(current_user.employee_id)
    @goal_bunch = GoalBunch.find(params[:id])

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)

    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id,id: @goal_bunch.id)                                 
  end

  def xl_appraiser_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])

    #@employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id,id: @goal_bunch.id)                              
  end

  def xl_reviewer_detail
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])

    @employees = Employee.where(id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch.id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id,id: @goal_bunch.id)                                 
  end
  
  def period_list_print
    @employee = Employee.find(params[:emp_id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def subordinate_list_for_appraisee
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def period_appraisee
    @employee = Employee.find(params[:emp_id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def subordinate_list_for_reviewer
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def period_reviewer
    @employee = Employee.find(params[:emp_id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end
  
  def period_for_appraisee
    @employee = Employee.find(current_user.employee_id)
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def emp_list_goal_wise
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def print_emp_list
    @goal_bunches = GoalBunch.where(period_id: params[:salary][:period_id])
  end

  def all_emp_list
    goal_bunch_ids = params[:goal_bunch_ids]
    if goal_bunch_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      @goal_bunches = []
      redirect_to emp_list_goal_wise_goal_bunches_path
    else
      @goal_bunches = []
      goal_bunch_ids.each do |g|
      emp = GoalBunch.find(g)
      @goal_bunches << emp
      @goal_bunch = GoalBunch.find(g)
      end
    end  
  end

  def goal_bunch_list
    @employee = Employee.find(params[:id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def set_goal_list
    reporter(@goal_bunches, template_class: PdfReportTemplate) do
      #filter :final_rating_id, type: :integer
      # filter(:current_status, :enum, :select => [["Pending",0],["Cancelled",1],["FirstApproved",2],["SecondApproved",3],["FirstRejected",4],["SecondRejected",5]])
      column(:Employee_ID, sortable: true) { |goal_bunch| goal_bunch.employee.try(:manual_employee_code) }
      column(:Emploee_name, sortable: true) { |goal_bunch| full_name(goal_bunch.employee) }
      column(:Appraiser_ID, sortable: true) { |goal_bunch| goal_bunch.appraiser_id }
      column(:Reviewer_ID, sortable: true) { |goal_bunch| goal_bunch.reviewer_id }
      column(:Final_Rating, sortable: true) { |goal_bunch| goal_bunch.try(:final_rating_id) }
      # column :is_pending
      # column :is_cancelled
      # column :is_first_approved
      # column :is_second_approved
      # column :is_first_rejected
      # column :is_second_rejected
      #column :current_status
      session[:active_tab] = "performancemgmt"
    end
  end

  def appraisee_detail_for_print
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)
    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
  end

  def appraiser_detail_for_print
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)
    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
  end

  def reviewer_detail_for_print
    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:id])
    @employees = Employee.where(id: @employee.id).group(:id)
    @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)  
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id, goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
    @goal_bunches = GoalBunch.where(employee_id: @employee.id, id: @goal_bunch.id).group(:employee_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_bunch
      @goal_bunch = GoalBunch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_bunch_params
      params.require(:goal_bunch).permit(:f_transfer_option,:f_transfer,:f_comment,:transfer_option,:transfer,:comment,:goal_approval,:appraisee_rating_id,:f_promotion,:f_increment,:f_designation_id,:f_ctc,:goal_confirm,:period_id, :employee_id, :appraisee_id, :appraisee_comment, :appraisee_confirm, :appraiser_id, :appraiser_rating, :appraiser_comment, :appraiser_confirm, :reviewer_id, :review_comment, :reviewer_rating_id, :reviewer_confirm, :final_id, :final_comment, :final_rating_id, :final_confirm)
    end
end