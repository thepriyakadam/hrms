class IssueMastersController < ApplicationController
  before_action :set_issue_master, only: [:show, :edit, :update, :destroy]

  # GET /issue_masters
  # GET /issue_masters.json
  def index
    @issue_masters = IssueMaster.all
  end

  # GET /issue_masters/1
  # GET /issue_masters/1.json
  def show
  end

  # GET /issue_masters/new
  def new
    @issue_master = IssueMaster.new
    @issue_masters = IssueMaster.all
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess1"
  end

  # GET /issue_masters/1/edit
  def edit
  end

  # POST /issue_masters
  # POST /issue_masters.json
  def create
   @issue_master = IssueMaster.new(issue_master_params)
    @issue_masters = IssueMaster.all
    respond_to do |format|
      if @issue_master.save
         @issue_master = IssueMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /issue_masters/1
  # PATCH/PUT /issue_masters/1.json
  def update
    @issue_master.update(issue_master_params)
    @issue_master = IssueMaster.new
    @issue_masters = IssueMaster.all 
  end

  # DELETE /issue_masters/1
  # DELETE /issue_masters/1.json
  def destroy
    @issue_master.destroy
    @issue_masters = IssueMaster.all
  end

  def collect_issues
    @issue_tracker_group = IssueTrackerGroup.find(params[:group_id])
    @issue_masters = @issue_tracker_group.issue_masters
  end

   def is_confirm
    @issue_master = IssueMaster.find(params[:issue_master])
    IssueMaster.find(@issue_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_master
      @issue_master = IssueMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_master_params
      params.require(:issue_master).permit(:issue_tracker_group_id, :issue_type_id, :name, :description, :status, :is_confirm)
    end
end
