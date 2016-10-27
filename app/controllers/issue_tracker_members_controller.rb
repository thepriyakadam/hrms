class IssueTrackerMembersController < ApplicationController
  before_action :set_issue_tracker_member, only: [:show, :edit, :update, :destroy]

  # GET /issue_tracker_members
  # GET /issue_tracker_members.json
  def index
    @issue_tracker_members = IssueTrackerMember.all
  end

  # GET /issue_tracker_members/1
  # GET /issue_tracker_members/1.json
  def show
  end

  # GET /issue_tracker_members/new
  def new
    @issue_tracker_member = IssueTrackerMember.new
    @issue_tracker_members = IssueTrackerMember.all
    session[:active_tab] ="issuetracker"
    session[:active_tab1] ="issueprocess1"
  end

  # GET /issue_tracker_members/1/edit
  def edit
  end

  # POST /issue_tracker_members
  # POST /issue_tracker_members.json
  def create
    @issue_tracker_member = IssueTrackerMember.new(issue_tracker_member_params)
    @issue_tracker_members = IssueTrackerMember.all
    respond_to do |format|
      if @issue_tracker_member.save
         @issue_tracker_member = IssueTrackerMember.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Member Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /issue_tracker_members/1
  # PATCH/PUT /issue_tracker_members/1.json
  def update
    @issue_tracker_member.update(issue_tracker_member_params)
    @issue_tracker_member = IssueTrackerMember.new
    @issue_tracker_members = IssueTrackerMember.all     
  end

  # DELETE /issue_tracker_members/1
  # DELETE /issue_tracker_members/1.json
  def destroy
    @issue_tracker_member.destroy
    @issue_tracker_members = IssueTrackerMember.all
  end

  def is_confirm
    @issue_tracker_member = IssueTrackerMember.find(params[:issue_tracker_member])
    IssueTrackerMember.find(@issue_tracker_member.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_tracker_member_path
  end
 
  def collect_issues
    @issue_tracker_group = IssueTrackerGroup.find(params[:group_id])
    @issue_tracker_members = @issue_tracker_group.issue_tracker_members
  end

  def collect_memberwise_dropdown
    @date = params[:date].to_s
    @group_id = params[:group_id]
    # byebug
    @issue_tracker_group = IssueTrackerGroup.find(params[:group_id])
    @issue_tracker_members = @issue_tracker_group.issue_tracker_members
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_tracker_member
      @issue_tracker_member = IssueTrackerMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_tracker_member_params
      params.require(:issue_tracker_member).permit(:issue_tracker_group_id, :employee_id, :status, :is_confirm,:role)
    end
end