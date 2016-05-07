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

    @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
  end

  # GET /employee_goals/1/edit
  def edit
    @employee = Employee.find(@employee_goal.employee_id)
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
  end

  # POST /employee_goals
  # POST /employee_goals.json
  def create
    @employee_goal = EmployeeGoal.new(employee_goal_params)
    @employee = Employee.find(@employee_goal.employee_id)
    if @employee_goal.save
      @flag = true
      @employee_goal = EmployeeGoal.new
      @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
      # redirect_to new_employee_goal_path
    else
      @flag = false
    end
  end

  # PATCH/PUT /employee_goals/1
  # PATCH/PUT /employee_goals/1.json
  def update
    @employee = Employee.find(@employee_goal.employee_id)
    if @employee_goal.update(employee_goal_params)
      @flag = true
      @employee_goal = EmployeeGoal.new
      @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
    else
      @flag = false
    end
  end

  # DELETE /employee_goals/1
  # DELETE /employee_goals/1.json
  def destroy
    @employee = Employee.find(@employee_goal.employee_id)
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id)
    @employee_goal.destroy
    flash[:notice] = 'Deleted Successfully'
  end

  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates 
    session[:active_tab] ="performance"
  end

  def employee_list
      @year = params[:year]
      @employees = params[:employee_ids]
     if current_user.class == Group
      @employees = Employee.all
    elsif current_user.class == Member
      if current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Department'
        @employees = Employee.where(department_id: current_user.department_id)
      else current_user.role.name == 'Employee'
           @employees = Employee.where(id: current_user.employee_id)
      end
    end
  end

  def show_goal
    @employee_goal = EmployeeGoal.new
    @employee = Employee.find(params[:format])
    @employee_goals = EmployeeGoal.where(employee_id: @employee.id) 
    @employee_attributes = EmployeeAttribute.where(employee_id: @employee.id)
  end

  def is_confirm
    #@employee_goal = EmployeeGoal.find(params[:id])
    @employee = Employee.find(params[:id])

    @employee_goal_ids = params[:employee_goal_ids]
    if @employee_goal_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_employee_goal_path(@employee.id)
    else
      @employee_goal_ids.each do |eid|
      @employee_goal = EmployeeGoal.find(eid)
      @employee_goal.update(is_confirm: true)

      GoalRatingSheet.create(appraisee_id: @employee.id, employee_goal_id: @employee_goal.id)
      
      flash[:notice] = "Confirmed Successfully"
    end 

     redirect_to new_employee_goal_path( @employee.id) 
  end
  end

  def send_email_to_employee
    @employee_goal = EmployeeGoal.find_by_employee_id(params[:format])
    @employee = Employee.find(@employee_goal.employee_id)
    EmployeeGoalMailer.send_email_to_employee(@employee_goal).deliver_now
    flash[:notice] = "Email sent Successfully"
    redirect_to new_employee_attribute_path(@employee.id) 
  end


  def show_employee
    puts '---------------------------'
    @employee = Employee.new
    @employees = Employee.all

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
            :margin           => {:top    => 55, # default 10 (mm)
                          :bottom => 55,
                          :left   => 12,
                          :right  => 0},
            :show_as_html => params[:debug].present?
          end
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
end
