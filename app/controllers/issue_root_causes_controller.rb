class IssueRootCausesController < ApplicationController
  before_action :set_issue_root_cause, only: [:show, :edit, :update, :destroy]


  # GET /issue_root_causes/1
  # GET /issue_root_causes/1.json
  def index
    @issue_root_cause = IssueRootCause.new
    @issue_root_causes = IssueRootCause.all
  end

  def show
  end

  # GET /issue_root_causes/new
  def new
    @issue_root_cause = IssueRootCause.new
    @issue_root_causes = IssueRootCause.all
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess1"
  end

  # GET /issue_root_causes/1/edit
  def edit
  end

  # POST /issue_root_causes
  # POST /issue_root_causes.json
  def create
    @issue_root_cause = IssueRootCause.new(issue_root_cause_params)
    @issue_root_causes = IssueRootCause.all
    respond_to do |format|
      if @issue_root_cause.save
        @issue_root_cause = IssueRootCause.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Root Cause Already Exist.'
        format.js { @flag = false }
      end
      redirect_to new_issue_root_cause_path
    end
  end

  # PATCH/PUT /issue_root_causes/1
  # PATCH/PUT /issue_root_causes/1.json
  def update
    @issue_root_cause.update(issue_root_cause_params)
    @issue_root_cause = IssueRootCause.new
    @issue_root_causes = IssueRootCause.all
       
  end

  # DELETE /issue_root_causes/1
  # DELETE /issue_root_causes/1.json
  def destroy
    @issue_root_cause.destroy
    @issue_root_causes = IssueRootCause.all
    
  end

   def is_confirm
    @issue_root_cause = IssueRootCause.find(params[:issue_root_cause])
    IssueRootCause.find(@issue_root_cause.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_root_cause_path
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_root_cause
      @issue_root_cause = IssueRootCause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_root_cause_params
      params.require(:issue_root_cause).permit(:issue_tracker_group_id, :name, :is_active, :is_confirm)
    end
end
