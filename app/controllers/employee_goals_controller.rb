class EmployeeGoalsController < ApplicationController
  before_action :set_employee_goal, only: [:show, :edit, :update, :destroy]

  # GET /employee_goals
  # GET /employee_goals.json
  def index
    @employee_goals = EmployeeGoal.all
  end

  # GET /employee_goals/1
  # GET /employee_goals/1.json
  def show
  end

  # GET /employee_goals/new
  def new
    @employee_goal = EmployeeGoal.new
    @employee = Employee.find(params[:format])
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id, is_confirm: nil)
  end

  # GET /employee_goals/1/edit
  def edit
    @employee = Employee.find(@employee_goal.employee_id)
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id, is_confirm: nil)
  end

  # POST /employee_goals
  # POST /employee_goals.json
  def create
    @employee_goal = EmployeeGoal.new(employee_goal_params)
    @employee = Employee.find(@employee_goal.employee_id)
    goal_weightage_sum = @employee_goal.goal_weightage_sum(@employee_goal)
    if goal_weightage_sum > 100
      @flag = false
    else
      @employee_goal.save
      @employee_goal = EmployeeGoal.new
      @employee_goals = EmployeeGoal.where(employee_id: @employee.id, is_confirm: nil)
      @flag = true
    end
  end

  # PATCH/PUT /employee_goals/1
  # PATCH/PUT /employee_goals/1.json
  def update
    @employee = Employee.find(@employee_goal.employee_id)
    goal_weightage_sum = @employee_goal.goal_weightage_sumdate(@employee_goal, params[:employee_goal][:goal_weightage])
    if goal_weightage_sum > 100
      @flag = false
    else
      @employee_goal.update(employee_goal_params)
      @employee_goal = EmployeeGoal.new
      @employee_goals = EmployeeGoal.where(employee_id: @employee.id, is_confirm: nil)
      @flag = true
    end
  end

  # DELETE /employee_goals/1
  # DELETE /employee_goals/1.json
  def destroy
    @employee = Employee.find(@employee_goal.employee_id)
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id, is_confirm: nil)
    @employee_goal.destroy
    flash[:notice] = 'Deleted Successfully'
  end

  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates 
    session[:active_tab] ="Performance"
  end

  def employee_list
    @employees = Employee.find_by_role(current_user)
  end

  def show_goal
    @employee_goal = EmployeeGoal.new
    @employee = Employee.find(params[:format])
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
  end

  def is_confirm
    @employee = Employee.find(params[:id])
    @employee_goal_ids = params[:employee_goal_ids]
    if @employee_goal_ids.nil?
      flash[:alert] = "Please Select Goal."
    else
      confirm_employee_goal
    end
    redirect_to new_employee_goal_path(@employee.id)
  end

  def send_email_to_employee
    @employee_goal = EmployeeGoal.find_by_employee_id(params[:format])
    @employee = Employee.find(@employee_goal.employee_id)
    EmployeeGoalMailer.send_email_to_employee(@employee_goal).deliver_now
    flash[:notice] = "Email sent Successfully"
    redirect_to new_employee_attribute_path(@employee.id)
  end

  def show_employee
    @employee = Employee.new
    @employees = Employee.all
    session[:active_tab] ="performance"
    session[:active_tab1] ="performancereport"
  end

  def print_detail
    @employee = params[:employee_ids]
    @employees = Employee.where(id: @employee)
            respond_to do |format|
            format.html
            format.pdf do
            render :pdf => 'print_multiple_emp_detail',
            layout: '/layouts/pdf.html.erb',
            :template => 'employee_goals/print_multiple_emp_detail.pdf.erb',
            :header => {
                    :center => "BFTL"
                 },
            :orientation      => 'Landscape', # default , Landscape
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 12,
                          :right  => 0},
            :show_as_html => params[:debug].present?
          end
        end
  end

  def single_goal
    @employee_goal = EmployeeGoal.new
    @employee = Employee.all
    @employee_goals = EmployeeGoal.all
  end

  def create_goal
    @employees = Employee.all
    @employees.each do |e|
      @employee_goal = EmployeeGoal.new(employee_goal_params)
      @employee_goal.employee_id = e.id
      @employee_goal.save
      gr = GoalRatingSheet.new
      gr.employee_goal_id = @employee_goal.id
      gr.save
      #@employee_goal.update(is_confirm: true)
      flash[:notice] = "Goals set Successfully"
    end
    redirect_to single_goal_employee_goals_path
  end

  def is_confirm_all
    @employee = Employee.all
    @employee_goal_ids = params[:employee_goal_ids]
    if @employee_goal_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_employee_goal_path
    else
      @employee_goal_ids.each do |eid|
        @employee_goal = EmployeeGoal.find(eid)
        @employee_goal.update(is_confirm: true)
        GoalRatingSheet.create(employee_goal_id: @employee_goal.id)
        flash[:notice] = "Confirmed Successfully"
      end 
      redirect_to new_employee_goal_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_goal
    @employee_goal = EmployeeGoal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_goal_params
    params.require(:employee_goal).permit(:emp_head,:is_confirm, :period_id, :employee_id, :goal_perspective_id, :goal_measure, :target, :goal_weightage, :difficulty_level, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
  end

  def confirm_employee_goal
    employee_goals = EmployeeGoal.where(id: @employee_goal_ids)
    period_array = employee_goals.pluck(:period_id)
    if period_array.uniq.length == 1
      sum = employee_goals.sum(:goal_weightage)
      if sum == 100
        @employee_goal_ids.each do |eid|
          @employee_goal = EmployeeGoal.find(eid)
          @employee_goal.update(is_confirm: true)
          GoalRatingSheet.create(appraisee_id: @employee.id, employee_goal_id: @employee_goal.id)
        end
        flash[:notice] = "Confirmed Successfully."
      else
        flash[:alert] = "Total goal weightage must be 100%."
      end
    else
      flash[:alert] = "Please select uniq period."
    end
  end
end # class end
