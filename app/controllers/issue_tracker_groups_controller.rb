class IssueTrackerGroupsController < ApplicationController
  before_action :set_issue_tracker_group, only: [:show, :edit, :update, :destroy]

  # GET /issue_tracker_groups
  # GET /issue_tracker_groups.json
  def index
    @issue_tracker_groups = IssueTrackerGroup.all
  end

  # GET /issue_tracker_groups/1
  # GET /issue_tracker_groups/1.json
  def show
  end

  # GET /issue_tracker_groups/new
  def new
    @issue_tracker_group = IssueTrackerGroup.new
    @issue_tracker_groups = IssueTrackerGroup.all
    session[:active_tab] ="HelpDesk"
    session[:active_tab1] ="Setup"
  end

  # GET /issue_tracker_groups/1/edit
  def edit
  end

  # POST /issue_tracker_groups
  # POST /issue_tracker_groups.json
   def create
    @issue_tracker_group = IssueTrackerGroup.new(issue_tracker_group_params)
    @issue_tracker_groups = IssueTrackerGroup.all
    respond_to do |format|
      if @issue_tracker_group.save
         @issue_tracker_group = IssueTrackerGroup.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Group Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /issue_tracker_groups/1
  # PATCH/PUT /issue_tracker_groups/1.json
  def update
    @issue_tracker_group.update(issue_tracker_group_params)
    @issue_tracker_groups = IssueTrackerGroup.all   
    @issue_tracker_group = IssueTrackerGroup.new 
  end

  # DELETE /issue_tracker_groups/1
  # DELETE /issue_tracker_groups/1.json
  def destroy
    @issue_tracker_group.destroy
    @issue_tracker_groups = IssueTrackerGroup.all      
  end

  def is_confirm
    @issue_tracker_group = IssueTrackerGroup.find(params[:issue_tracker_group])
    IssueTrackerGroup.find(@issue_tracker_group.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_tracker_group_path
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_tracker_group
      @issue_tracker_group = IssueTrackerGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_tracker_group_params
      params.require(:issue_tracker_group).permit(:name, :email, :contact_number, :status, :is_confirm)
    end
end
