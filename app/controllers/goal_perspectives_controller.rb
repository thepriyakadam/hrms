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
    @goal_perspectives = GoalPerspective.all
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

  def modal
    @goal_perspective = GoalPerspective.find(params[:format]) 
  end

  def goal_perspective_master
      @goal_perspectives = GoalPerspective.all
      respond_to do |f|
      f.js
      f.xls {render template: 'goal_perspectives/goal_perspective_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'goal_perspective_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'goal_perspectives/goal_perspective_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_goal_perspectives_path
      else
     GoalPerspective.import(params[:file])
     redirect_to import_xl_goal_perspectives_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_perspective
      @goal_perspective = GoalPerspective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_perspective_params
      params.require(:goal_perspective).permit(:goal_weightage,:from,:to,:status,:is_confirm,:name)
    end
end
