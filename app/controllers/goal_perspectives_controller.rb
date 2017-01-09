class GoalPerspectivesController < ApplicationController
  before_action :set_goal_perspective, only: [:show, :edit, :update, :destroy]

  # GET /goal_perspectives
  # GET /goal_perspectives.json
  def index
    @goal_perspectives = GoalPerspective.all
  end

  # GET /goal_perspectives/1
  # GET /goal_perspectives/1.json
  def show
  end

  # GET /goal_perspectives/new
  def new
    @goal_perspective = GoalPerspective.new

    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @goal_perspectives = GoalPerspective.all
      elsif current_user.role.name == 'Admin'
        @department_id = Employee.where(company_id: current_user.company_location.company_id).pluck(:department_id)
        @goal_perspectives = GoalPerspective.where(department_id: @department_id)
      elsif current_user.role.name == 'Branch'
        @department_id = Employee.where(company_location_id: current_user.company_location_id).pluck(:department_id)
        @goal_perspectives = GoalPerspective.where(department_id: @department_id)
      elsif current_user.role.name == 'HOD'
        @goal_perspectives = GoalPerspective.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @goal_perspectives = @emp.subordinates
      else current_user.role.name == 'Employee'
        @department_id = Employee.where(id: current_user.employee_id).pluck(:department_id)
         @goal_perspectives = GoalPerspective.where(department_id: @department_id)
      end
    else
        @goal_perspectives = GoalPerspective.all
    end

   
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Performance"
  end

  # GET /goal_perspectives/1/edit
  def edit
  end

  # POST /goal_perspectives
  # POST /goal_perspectives.json
  def create
    @goal_perspective = GoalPerspective.new(goal_perspective_params)
    @goal_perspectives = GoalPerspective.all
    respond_to do |format|
      if @goal_perspective.save
        @goal_perspective = GoalPerspective.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Goal Perspective Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /goal_perspectives/1
  # PATCH/PUT /goal_perspectives/1.json
  def update
    @goal_perspective.update(goal_perspective_params)
    @goal_perspective = GoalPerspective.new
    @goal_perspectives = GoalPerspective.all
  end

  # DELETE /goal_perspectives/1
  # DELETE /goal_perspectives/1.json
  def destroy
    @goal_perspective.destroy
    @goal_perspectives = GoalPerspective.all
  end

  def is_confirm
    @goal_perspective = GoalPerspective.find(params[:goal_perspective])
    GoalPerspective.find(@goal_perspective.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_goal_perspective_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_perspective
      @goal_perspective = GoalPerspective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_perspective_params
      params.require(:goal_perspective).permit(:department_id,:status,:is_confirm,:name)
    end
end
