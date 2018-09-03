class GoalRatingsController < ApplicationController
  before_action :set_goal_rating, only: [:show, :edit, :update, :destroy]

  # GET /goal_ratings/new
  def new
    @goal_bunch = GoalBunch.find(params[:id])
    @employee = Employee.find(params[:emp_id])
    @goal_rating = GoalRating.new
    @goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
    @goal_attribute_ratings = GoalRating.where("appraisee_id = ? AND goal_bunch_id = ? AND goal_type = ?", @employee.id,@goal_bunch.id ,'Attribute')
    @goal_bunches = GoalBunch.all    
  end

  def show_goal_rating
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    # @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    # @employee = Employee.find(params[:employee_id])
  end

  def show_attribute
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    # @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    # @employee = Employee.find(params[:employee_id])
  end
 
  def destroy
    @goal_bunch = @goal_rating.goal_bunch_id
    @employee = @goal_rating.appraisee_id
    @goal_rating.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to new_goal_rating_path(id: @goal_bunch, emp_id:@employee)
  end
  
  def download_self_document
    @goal_rating = GoalRating.find(params[:id])
    send_file @goal_rating.document.path,
              filename: @goal_rating.document_file_name,
              type: @goal_rating.document_content_type,
              disposition: 'attachment'
  end

  def goal_set
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:employee_id])
    @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id) 
  end

  def select_dropdown
    if params[:goal_type] == "Goal"
      @flag = true
    else
      @flag = false
    end
  end

  def import_xl
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    @employee = Employee.find(params[:emp_id])
  end

  def import
    goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    employee = Employee.find(params[:emp_id])
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_goal_ratings_path(emp_id: employee.id,goal_bunch_id: goal_bunch.id)
      else
        @method = GoalRating.import(params[:file],employee,goal_bunch)
        if @method == false
          redirect_to new_goal_rating_path(emp_id: employee.id,id: goal_bunch.id), alert: "Weightage should be 100 or less then 100"
        else 
          redirect_to new_goal_rating_path(emp_id: employee.id,id: goal_bunch.id), notice: "File imported."
        end
      end
  end
  
   def admin_reviewer_evaluation_period
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
  end

  def admin_level_reviewer_evaluation
    @period = Period.find(params[:period_id])
    @emp = Employee.where.not(manager_2_id: nil).pluck(:id)
    @goal_bunches = GoalBunch.where(period_id: @period.id,employee_id: @emp,appraiser_confirm: true)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def admin_appraiser_evaluation_period
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(goal_confirm: true).group(:period_id)
  end

  def admin_level_appraiser_evaluation
    @period = Period.find(params[:period_id])
    @goal_bunches = GoalBunch.where(period_id: @period.id,appraisee_confirm: true)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def admin_level_period
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
    @periods = Period.where(status: true).group(:id)
    @goal_bunches = GoalBunch.where(period_id: @periods).group(:period_id)
  end

  def admin_level_goal_set
    @period = Period.find(params[:period_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])
    # goal_bunches = GoalBunch.where(period_id: @period.id).pluck(:employee_id)
    # @employees = Employee.where(status: "Active",id: goal_bunches)

    #@goal_bunches = GoalBunch.where(period_id: @period.id,goal_confirm: nil).group(:employee_id,:period_id)
    @goal_bunches = GoalBunch.where(period_id: @period.id)
    # @goal_bunches = []
    # goal_bunches.each do |g|
    #   @goal_bunches << g
    # end
  end

  # POST /goal_ratings
  # POST /goal_ratings.json
  def create
    @goal_bunch = GoalBunch.find(params[:goal_rating][:goal_bunch_id])
    @employee = Employee.find(@goal_bunch.employee_id)
    @goal_rating = GoalRating.new(goal_rating_params)
    #GoalRating.create(period_id: @goal_bunch.period_id)
   
    goal_weightage_sum = @goal_rating.goal_weightage_sum(@goal_bunch, @goal_rating)
    if goal_weightage_sum <= 100
      if params[:flag] == "Goal"
        @goal_rating.goal_perspective_id = params[:common][:id]
        @dropdown = true
        @goal_perspective = GoalPerspective.find_by(id: @goal_rating.goal_perspective_id)
        #@goal_ratings = GoalRating.where(appraisee_id: @goal_rating.appraisee_id,goal_perspective_id: @goal_perspective.id)
        goal_id_sum = @goal_rating.goal_id_sum(@goal_rating)

          if @goal_perspective.goal_weightage == true  
            @current_weightage = @goal_rating.goal_weightage >= @goal_perspective.from && @goal_rating.goal_weightage <= @goal_perspective.to
            if @current_weightage == true
              @weightage_limit = goal_id_sum >= @goal_perspective.from && goal_id_sum <= @goal_perspective.to
              if @weightage_limit == true
                @goal_rating.save
                @flag1 = true
                @flag = true
              else
                @flag1 = false
              end
            else
              @flag2 = false
            end
          else
             @goal_rating.save
              @flag = true
          end

        elsif params[:flag] == "Attribute"
          @goal_rating.attribute_master_id = params[:common][:id]
          @dropdown = false

          @attribute = AttributeMaster.find_by(id: @goal_rating.attribute_master_id)
           attribute_id_sum = @goal_rating.attribute_id_sum(@goal_rating)
          
          if @attribute.attribute_weightage == true
            @current_weightage = @goal_rating.goal_weightage.to_i >= @attribute.from.to_i && @goal_rating.goal_weightage.to_i <= @attribute.to.to_i
            if @current_weightage == true
               @weightage_limit = attribute_id_sum.to_i >= @attribute.from.to_i && attribute_id_sum.to_i <= @attribute.to.to_i
              
              if @weightage_limit == true
                @goal_rating.save
                @flag1 = true
                @flag = true
              else
                @flag1 = false
              end
            else
              @flag2 = false
            end
          else
            @goal_rating.save
            @flag = true
          end
        end #params[:flag]

        @goal_rating = GoalRating.new
        @goal_ratings = GoalRating.where(goal_bunch_id: @goal_bunch.id, goal_type: 'Goal')
        @goal_attribute_ratings = GoalRating.where("goal_bunch_id = ? AND goal_type = ?", @goal_bunch.id ,'Attribute')
      else #goal_weightage_sum
        @flag = false
      end
  end

  def goal_set_modal
    @goal_rating = GoalRating.find(params[:format])
    if @goal_rating.goal_type == "Goal" || @goal_rating.goal_type == "Attribute"
      @flag = true
    else
      @flag = false
    end
  end

  def update_goal_set_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @employee = Employee.find(@goal_rating.appraisee_id)
    @goal_bunch = GoalBunch.find(@goal_rating.goal_bunch_id)
    goal_weightage_sum = @goal_rating.goal_weightage_sumdate(@goal_bunch, @goal_rating.goal_weightage, params)

     weightage = goal_rating_params["goal_weightage"].to_i
      if goal_weightage_sum <= 100
        if @goal_rating.goal_type == "Goal"
           @goal = GoalPerspective.find_by(id: @goal_rating.goal_perspective_id)
              goal_id_sum_update = @goal_rating.goal_id_sum_update(@goal_rating,weightage)

          if @goal.goal_weightage == true
            @current_weightage = weightage >= @goal.from && weightage <= @goal.to
            if @current_weightage == true

              #@weightage_limit = goal_rating_params["goal_weightage"].to_i >= @goal.from && goal_rating_params["goal_weightage"].to_i <= @goal.to
              @weightage_limit = goal_id_sum_update >= @goal.from && goal_id_sum_update <= @goal.to

              if @weightage_limit == true
                 @goal_rating.update(goal_rating_params)
                @flag1 = true
                @flag = true
              flash[:notice] = "Updated Successfully !"
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
              else
                @flag1 = false
              flash[:alert] = "Weightage Limit should be within range "
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
              end
            else
              @flag2 = false
              flash[:alert] = "Weightage should be within range "
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
            end
          else
            @goal_rating.update(goal_rating_params)
            @flag = true
            flash[:notice] = "Updated Successfully !"
            redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
          end

        elsif @goal_rating.goal_type == "Attribute"
          @attribute = AttributeMaster.find_by(id: @goal_rating.attribute_master_id)
          attribute_id_sum_update = @goal_rating.attribute_id_sum_update(@goal_rating,weightage)
          if @attribute.attribute_weightage == true
            @current_weightage = weightage.to_i >= @attribute.from.to_i && weightage.to_i <= @attribute.to.to_i
            if @current_weightage == true

              #@weightage_limit = goal_rating_params["goal_weightage"].to_i >= @attribute.from.to_i && goal_rating_params["goal_weightage"].to_i <= @attribute.to.to_i
              @weightage_limit = attribute_id_sum_update.to_i >= @attribute.from.to_i && attribute_id_sum_update.to_i <= @attribute.to.to_i
              if @weightage_limit == true
                @goal_rating.update(goal_rating_params)
                @flag1 = true
                @flag = true
              flash[:notice] = "Updated Successfully !"
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
              else
                @flag1 = false
              flash[:alert] = "Weightage Limit should be within range "
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
              end
            else
              flash[:alert] = "Weightage should be within range "
              redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
            end
          else
            @goal_rating.update(goal_rating_params)
            @flag = true
            flash[:notice] = "Updated Successfully !"
            redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
          end
        end
      else
         @flag = false
            flash[:alert] = "Weightage Sum should be 100 "
         redirect_to new_goal_rating_path(emp_id: @employee.id,id: @goal_bunch.id)
      end 
  end

  def send_mail_to_appraiser
    goal_ratings = GoalRating.where(appraisee_id: @employee.id,goal_bunch_id: @goal_bunch.id)


    @employee = Employee.find(params[:emp_id])
    @goal_bunch = GoalBunch.find(params[:goal_bunch_id])

    sum = goal_ratings.sum(:goal_weightage)
    if sum.round == 100
      @emp = Employee.find(current_user.employee_id)
      #GoalRatingMailer.send_email_to_appraiser(@emp).deliver_now
      @gol_bunch = GoalBunch.find_by(id: @goal_bunch.id).update(goal_confirm: true,appraiser_confirm: false,goal_approval: false)
      flash[:notice] = "Mail Sent Successfully"
      if @employee.id == current_user.employee_id
        redirect_to new_goal_bunch_path
      else
        redirect_to admin_level_period_goal_ratings_path
      end
    else
      flash[:alert] = "Goal weightage sum should be 100 !!"
      redirect_to new_goal_rating_path(id: @goal_bunch.id, emp_id: @employee.id)
    end 
  end

  def goal_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
    if @goal_rating.goal_type == "Goal" || @goal_rating.goal_type == "Attribute"
      @flag = true
    end
  end

   def show_goal_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def show_attribute_modal
     @goal_rating = GoalRating.find(params[:format])
  end

  def update_goal_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
    @goal_bunch = GoalBunch.find(@goal_rating.goal_bunch_id)
    goal_weightage_sum = @goal_rating.goal_weightage_sumdate(@goal_bunch, @goal_rating.goal_weightage, params)
    weightage = goal_rating_params["goal_weightage"].to_i

    if goal_weightage_sum <= 100
      if @goal_rating.goal_type == "Goal"
         @goal = GoalPerspective.find_by(id: @goal_rating.goal_perspective_id)
         goal_id_sum_update = @goal_rating.goal_id_sum_update(@goal_rating,weightage)

        if @goal.goal_weightage == true
          @current_weightage = @goal_rating.goal_weightage.to_i >= @goal.from.to_i && @goal_rating.goal_weightage.to_i <= @goal.to.to_i
          if @current_weightage == true
            #@weightage_limit = goal_rating_params["goal_weightage"].to_i >= @goal.from && goal_rating_params["goal_weightage"].to_i <= @goal.to
            @weightage_limit = goal_id_sum_update.to_i >= @goal.from.to_i && goal_id_sum_update.to_i <= @goal.to.to_i

            if @weightage_limit == true
               @goal_rating.update(goal_rating_params)
              @flag1 = true
              @flag = true
              flash[:notice] = "Updated Successfully!"
              redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
            else
              @flag1 = false
              flash[:alert] = "Weightage Limit should be within range "
              redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
            end
          else
            flash[:alert] = "Weightage should be within range "
            redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
          end

        else
          @goal_rating.update(goal_rating_params)
          @flag = true
          flash[:notice] = "Updated Successfully !"
          redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
        end

      elsif @goal_rating.goal_type == "Attribute"
        @attribute = AttributeMaster.find_by(id: @goal_rating.attribute_master_id)
        attribute_id_sum_update = @goal_rating.attribute_id_sum_update(@goal_rating,weightage)
        
        if @attribute.attribute_weightage == true
           @current_weightage = @goal_rating.goal_weightage.to_i >= @attribute.from.to_i && @goal_rating.goal_weightage.to_i <= @attribute.to.to_i
          if @current_weightage == true
            #@weightage_limit = goal_rating_params["goal_weightage"].to_i >= @attribute.from.to_i && goal_rating_params["goal_weightage"].to_i <= @attribute.to.to_i
            @weightage_limit = attribute_id_sum_update.to_i >= @attribute.from.to_i && attribute_id_sum_update.to_i <= @attribute.to.to_i
            if @weightage_limit == true
              @goal_rating.update(goal_rating_params)
              @flag1 = true
              @flag = true
              flash[:notice] = "Updated Successfully !"
              redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
            else
              @flag1 = false
              flash[:alert] = "Weightage Limit should be within range "
              redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
            end
          else
            flash[:alert] = "Weightage should be within range "
            redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
          end
        else
          @goal_rating.update(goal_rating_params)
          @flag = true
          flash[:notice] = "Updated Successfully !"
          redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
        end
      end
    else
      @flag = false
      flash[:alert] = "Weightage Sum should be 100"
      redirect_to goal_approval_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
    end  
  end
  
  def self_modal
    @goal_rating = GoalRating.find(params[:format])
  end

  def update_self_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    appraisee_comment = params[:goal_rating][:appraisee_comment]
    appraisee_rating_id = params[:goal_rating][:appraisee_rating_id]
    document_present = params[:goal_rating][:document_present]
    period = Period.find_by(id: @goal_rating.period_id)

    @rating = Rating.find_by(id: appraisee_rating_id)

      if period.marks == true
        @weightage = @goal_rating.goal_weightage
        weightage = @weightage.round
        rating = @rating.value
        if rating.to_f < weightage.to_f
          if document_present == "Yes"
            document = params[:goal_rating][:document]
            @goal_rating.update(appraisee_comment: appraisee_comment,appraisee_rating_id: appraisee_rating_id,document: document,document_present: "Yes")
            flash[:notice] = 'Updated Successfully'
          else
            @goal_rating.update(appraisee_comment: appraisee_comment,appraisee_rating_id: appraisee_rating_id,document: nil,document_present: "No")
            flash[:notice] = 'Updated Successfully'
          end
        else
          rating1 = Rating.where(value: @goal_rating.goal_weightage).take
          if rating1.nil?
            flash[:alert] = 'Please Select Rating less then or equals to weightage'
          else  
            if document_present == "Yes"
              document = params[:goal_rating][:document]
              @goal_rating.update(appraisee_comment: appraisee_comment,appraisee_rating_id: rating1.id,document: document,document_present: "Yes")
              flash[:notice] = 'Updated Successfully'
            else
              @goal_rating.update(appraisee_comment: appraisee_comment,appraisee_rating_id: rating1.id,document: nil,document_present: "No")
              flash[:notice] = 'Updated Successfully'
            end
          end#rating1.nil?
        end#rating.to_i < weightage.to_i
      else
        @goal_rating.update(goal_rating_params)
      flash[:notice] = 'Updated Successfully'
      end
    redirect_to appraisee_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id)
  end

  def appraiser_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
  end

  def update_appraiser_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, goal_id: @goal_rating.goal_bunch_id,period_id: @period.id)
  end

  def reviewer_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
  end

  def update_reviewer_modal
    @goal_rating = GoalRating.find(params[:goal_rating_id])
    @period = Period.find(params[:period_id])
    @goal_rating.update(goal_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to reviewer_comment_goal_bunches_path(emp_id: @goal_rating.appraisee_id, id: @goal_rating.goal_bunch_id,period_id: @period.id)
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

  def subordinate_list_goal_wise
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
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

  def employee_goal_wise
     session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def print_employee
    @period = Period.find(params[:salary][:period_id])
    @goal_bunch = GoalBunch.find_by(period_id: @period.id)
    @goal_bunches = GoalBunch.where(period_id: @period.id)
  end

  def detail_goal_wise
    @period = Period.find(params[:period_id])
    goal_bunch_ids = params[:goal_bunch_ids]
    if goal_bunch_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      @goal_bunches = []
      #redirect_to employee_goal_wise_goal_ratings_path
    else
      @goal_bunches = []
      goal_bunch_ids.each do |g|
      emp = GoalBunch.find(g)
      @goal_bunches << emp
      @goal_bunch = GoalBunch.find(g)
      end
    end 

  end

 def detail_goal_wise_pdf
  @period = Period.find(params[:period_id])
    goal_bunch_ids = params[:goal_bunch_ids]
    if goal_bunch_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      @goal_bunches = []
      #redirect_to employee_goal_wise_goal_ratings_path
    else
      @goal_bunches = []
      goal_bunch_ids.each do |g|
      emp = GoalBunch.find(g)
      @goal_bunches << emp
      @goal_bunch = GoalBunch.find(g)
      end
    end 

    respond_to do |f|
      f.js
      f.html
      f.pdf do
        render pdf: 'detail_goal_wise',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'goal_ratings/goal_wise.pdf.erb',
        show_as_html: params[:debug].present?,
        margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
 end 

  def print_goal_wise
    @period = Period.find(params[:period_id])
    goal_bunch_ids = params[:goal_bunch_ids]
    @goal_bunches = []
      goal_bunch_ids.each do |g|
      emp = GoalBunch.find(g)
      @goal_bunches << emp
      @goal_bunch = GoalBunch.find(g)
      @employee = Employee.find_by(id: @goal_bunch.employee_id)
      end

    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'goal_rating',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'goal_ratings/print_goal_wise.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:10,right:10 }
        end
      end
  end

  def employee_wise_goal
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def goal_employee_wise
    @employee = Employee.find(params[:salary][:employee_id])
    @goal_bunches = GoalBunch.where(employee_id: @employee.id)
  end

  def detail_employee_wise
    @emp1 = Employee.find(params[:employee_id])
    @goal_bunch_ids = params[:goal_bunch_ids]

    if @goal_bunch_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      @employees = []
    else
      @employees = []
      @goal_bunch_ids.each do |g|
        @goal_bunch = GoalBunch.find_by(id: g)
        #@employees = GoalBunch.where(id: g)
      end
    end
     @joining_detail = JoiningDetail.find_by_employee_id(@emp1.id)
     @experiences = Experience.where(employee_id: @emp1.id)
     @qualifications = Qualification.where(employee_id: @emp1.id)
     @employee_promotions = EmployeePromotion.where(employee_id: @emp1.id)

    respond_to do |f|
      f.js
      f.xls {render template: 'goal_ratings/detail_employee_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'detail_employee_wise',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'goal_ratings/print_employee_wise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def performance_type
  end
  
  def period_for_training
    @periods = Period.all
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle1"
  end

  def training_request
    @period = Period.find(params[:period_id])
    @period_id = @period.id
    #@goal_bunch = GoalBunch.find_by(period_id: @period_id.id)
    # @goal_ratings = GoalBunch.joins("INNER JOIN goal_ratings on goal_bunches.id = goal_ratings.goal_bunch_id where goal_bunches.period_id = 1")
    #@goal_ratings = GoalRating.joins("INNER JOIN goal_bunches on goal_ratings.goal_bunch_id = goal_bunches.id where goal_bunches.period_id = @period.id,goal_bunches.goal_type = 'Goal' ")
    @goal_ratings = GoalRating.where(period_id: @period.id, goal_type: 'Goal',training_topic_master_id: nil)
    #@attribute_ratings = GoalRating.joins("INNER JOIN goal_bunches on goal_ratings.goal_bunch_id = goal_bunches.id where goal_bunches.period_id = @period.id")
    @attribute_ratings = GoalRating.where(period_id: @period.id,goal_type: 'Attribute',training_topic_master_id: nil)
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def create_attribute_training
    @period_id = Period.find(params[:period_id])
    @employee = Employee.find(params[:emp_id])
    @training_topic_master_id = params[:training_topic_master_id]
    @goal_rating_id = params[:goal_rating_id]
    @attribute_rating = GoalRating.where(id: @goal_rating_id, appraisee_id: @employee.id,goal_type: 'Attribute').update_all(training_topic_master_id: @training_topic_master_id)
    flash[:notice] = "Created Successfully"
    redirect_to training_request_goal_ratings_path(period_id: @period_id)
  end

  def create_goal_training
    @period_id = Period.find(params[:period_id])
    @employee = Employee.find(params[:emp_id])
    @training_topic_master_id = params[:training_topic_master_id]
    @goal_rating_id = params[:goal_rating_id]
    @goal_rating = GoalRating.where(id: @goal_rating_id,appraisee_id: @employee.id,goal_type: 'Goal').update_all(training_topic_master_id: @training_topic_master_id)
    flash[:notice] = "Created Successfully"
    redirect_to training_request_goal_ratings_path(period_id: @period_id)
  end

  def period_and_topic_wise_list
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle1"
  end

  def period_topic_wise_employee
    @training_plan = TrainingPlan.new
    #@attribute_master_id = params[:attribute_master_id]
    @period = Period.find(params[:period_id])
    @goal_bunches = GoalBunch.where(period_id: @period.id)
    ids = []
    @goal_bunch = @goal_bunches.each do |g|
      ids << g.id
    end
    @training_topic_master_id = params[:training_topic_master_id]
    @period_id = params[:period_id]
    # @goal_ratings = GoalRating.where(goal_bunch_id: ids,training_topic_master_id: @training_topic_master_id).where(is_assigned: nil)
    @goal_ratings = GoalRating.where(goal_bunch_id: ids,training_topic_master_id: @training_topic_master_id).where(is_hide: false)
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

  def trainee_list
    @trainees = Trainee.all
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def print_employee_detail
    @trainee_ids = params[:trainee_ids]
      if @trainee_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        @trainees = []
        redirect_to trainee_list_goal_ratings_path
      else
      @trainees = []
      @trainee_ids.each do |t|
        emp = Trainee.find(t)
        @trainees << emp
        #@goal_bunch = Employee.find(e)
        end 
      end
  end

  def all_emp_list
    @trainees = Trainee.find(params[:trainee_ids])
     respond_to do |format|
      # format.js
      # format.html
      # format.xls {render template: 'salary_slip_ledgers/show_employee.xls.erb'}
      format.pdf do
        render pdf: 'all_emp_list',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'goal_ratings/all_emp_list.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def increment_index
    @rating = Rating.last
     session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle1"
  end

  def all_employee_list
    @period = Period.find(params[:salary][:period_id])
    @company = params[:salary][:company]
    @department = params[:salary][:department]
    @location = params[:salary][:location]
    @company_name = params[:salary][:company_name]
    @department_name = params[:salary][:department_name]
    @location_name = params[:salary][:location_name]
    @rating = Rating.last
    #@goal_bunches = GoalBunch.where(period_id: @period.id)
    @goal_bunches = GoalBunch.joins("INNER JOIN employees ON employees.id = goal_bunches.employee_id").where("employees.department_id = ? AND employees.company_location_id = ? AND employees.company_id = ? AND goal_bunches.period_id = ?" , @department_name,@location_name,@company_name,@period.id)
  end

  def increment_index_report
    @period = params[:period_id]
    @company = params[:company]
    @department = params[:department]
    @location = params[:location]
    @company_name = params[:company_name]
    @department_name = params[:department_name]
    @location_name = params[:location_name]
    @rating = Rating.last
    @goal_bunches = GoalBunch.joins("INNER JOIN employees ON employees.id = goal_bunches.employee_id").where("employees.department_id = ? AND employees.company_location_id = ? AND employees.company_id = ? AND goal_bunches.period_id = ?" , @department_name,@location_name,@company_name,@period)
    respond_to do |format|
      format.xls {render template: 'goal_ratings/increment_index.xls.erb'}
    end
  end

  def print_employee_list
    @period = Period.find(params[:period_id])
    @goal_bunches = GoalBunch.joins("INNER JOIN employees ON employees.id = goal_bunches.employee_id").where("employees.department_id = ? AND employees.company_location_id = ? AND employees.company_id = ? AND goal_bunches.period_id = ?" , @department_name,@location_name,@company_name,@period.id)
  end

  def period_rating_wise
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_report"
  end

  def period_rating_wise_employee
    period_id = params[:salary][:period_id]
    rating1 = params[:salary][:rating1]
    rating2 = params[:salary][:rating2]
    @goal_bunches = GoalBunch.where(period_id: period_id,final_rating_id: rating1..rating2)
    respond_to do |f|
      f.js
      f.xls {render template: 'goal_ratings/period_rating_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'period_rating_wise_employee',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'goal_ratings/period_rating_wise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def periodwise_goal_set
    session[:active_tab] ="performancemgmt"
    session[:active_tab1] ="perform_cycle"
  end

  def periodwise_goal_list
    @period_id = params[:salary][:period_id]
    @period_id1 = params[:salary][:period_id1]
    @goal_bunches1 = GoalBunch.where(period_id: @period_id)
    @goal_bunches2 = GoalBunch.where(period_id: @period_id1).pluck(:employee_id)
    @goal_bunches = GoalBunch.where(period_id: @period_id).where.not(employee_id: @goal_bunches2)
    
  end

  def set_goal_periodwise
    period1 = Period.find(params[:period_id1])
    period = Period.find(params[:period_id])
    @period_id1 = period1.id
    @period_id = period.id
      @goal_bunches_ids = params[:goal_bunches_ids]
      if @goal_bunches_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        @goal_bunches_ids.each do |g|
          @goal_bunch = GoalBunch.find_by(id: g)
          goal_rating1 = GoalRating.where(appraisee_id: @goal_bunch.employee_id,period_id: @period_id1)
          if goal_rating1 == [] || goal_rating1.nil?
            goal_rating = GoalRating.where(appraisee_id: @goal_bunch.employee_id,period_id: @period_id).take
            goal_ratings = GoalRating.where(appraisee_id: @goal_bunch.employee_id,period_id: @period_id)
              goal_bunch = GoalBunch.create(period_id: @period_id1,employee_id: @goal_bunch.employee_id)
            if goal_rating.nil?
            else
              goal_ratings.each do |gr|
                GoalRating.create(goal_bunch_id: goal_bunch.id,goal_perspective_id: gr.goal_perspective_id,goal_weightage: gr.goal_weightage,
                goal_measure: gr.goal_measure,target: gr.target,aligned: gr.aligned,goal_setter_id: current_user.employee_id,
                appraisee_id: gr.appraisee_id,appraiser_id: gr.appraiser_id,attribute_master_id: gr.attribute_master_id,
                goal_type: gr.goal_type,period_id: @period_id1,activity: gr.activity)
              end
              flash[:notice] = "Goal Set Successfully!"        
            end
          else
          end#goal_rating1.nil?
        end#do
      end#@goal_bunches_ids.nil?
      redirect_to periodwise_goal_set_goal_ratings_path
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_rating
      @goal_rating = GoalRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_rating_params
      params.require(:goal_rating).permit(:document,:activity,:appraisee_rating_id,:period_id,:is_hide,:attribute_master_id,:goal_bunch_id, :goal_perspective_id, :goal_weightage, :goal_measure, :target, :aligned, :goal_setter_id, :appraisee_id, :appraisee_comment, :appraiser_id, :appraiser_comment, :appraiser_rating_id, :reviewer_id, :reviewer_comment,:goal_type)
    end
end