class IssueTrackerAccessesController < ApplicationController
  before_action :set_issue_tracker_access, only: [:show, :edit, :update, :destroy]

  
  def new
    @issue_tracker_access = IssueTrackerAccess.new
    @issue_tracker_accesses = IssueTrackerAccess.all
    session[:active_tab] = "issuetracker"
  end

  # GET /issue_tracker_accesses/1/edit
  def edit
  end

  def create
    @issue_tracker_access = IssueTrackerAccess.new(issue_tracker_access_params)
    @issue_tracker_accesses = IssueTrackerAccess.all
    respond_to do |format|
      if @issue_tracker_access.save
        @issue_tracker_access = IssueTrackerAccess.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Access Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /issue_tracker_accesses/1
  # PATCH/PUT /issue_tracker_accesses/1.json
  def update
   @issue_tracker_access.update(issue_tracker_access_params)
   @issue_tracker_access = IssueTrackerAccess.new
   @issue_tracker_accesses = IssueTrackerAccess.all   
  end

  # DELETE /issue_tracker_accesses/1
  # DELETE /issue_tracker_accesses/1.json
  def destroy
    @issue_tracker_access.destroy
    @issue_tracker_accesses = IssueTrackerAccess.all

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_tracker_access
      @issue_tracker_access = IssueTrackerAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_tracker_access_params
      params.require(:issue_tracker_access).permit(:name, :role, :employee_id, :status, :is_confirm, :issue_tracker_group_id, :issue_tracker_member_id)
    end
end
