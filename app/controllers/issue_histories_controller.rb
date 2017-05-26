class IssueHistoriesController < ApplicationController
  before_action :set_issue_history, only: [:show, :edit, :update, :destroy]

  # GET /issue_histories
  # GET /issue_histories.json
  def index
    @issue_histories = IssueHistory.all
  end

  # GET /issue_histories/1
  # GET /issue_histories/1.json
  def show
  end

  # GET /issue_histories/new
  def new
    @issue_history = IssueHistory.new
  end

  # GET /issue_histories/1/edit
  def edit
  end

  # POST /issue_histories
  # POST /issue_histories.json
  def create
    @issue_history = IssueHistory.new(issue_history_params)

    respond_to do |format|
      if @issue_history.save
        format.html { redirect_to @issue_history, notice: 'Issue history was successfully created.' }
        format.json { render :show, status: :created, location: @issue_history }
      else
        format.html { render :new }
        format.json { render json: @issue_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_histories/1
  # PATCH/PUT /issue_histories/1.json
  def update
    respond_to do |format|
      if @issue_history.update(issue_history_params)
        format.html { redirect_to @issue_history, notice: 'Issue history was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_history }
      else
        format.html { render :edit }
        format.json { render json: @issue_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_histories/1
  # DELETE /issue_histories/1.json
  def destroy
    @issue_history.destroy
    respond_to do |format|
      format.html { redirect_to issue_histories_url, notice: 'Issue history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_history
      @issue_history = IssueHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_history_params
      params.require(:issue_history).permit(:issue_request_id, :issue_master_id, :description, :date, :time, :employee_id, :issue_tracker_member_id, :issue_tracker_group_id, :issue_priority, :status, :is_confirm)
    end
end
