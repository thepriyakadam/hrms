class IssueLockerHistoriesController < ApplicationController
  before_action :set_issue_locker_history, only: [:show, :edit, :update, :destroy]

  # GET /issue_locker_histories
  # GET /issue_locker_histories.json
  def index
    @issue_locker_histories = IssueLockerHistory.all
  end

  # GET /issue_locker_histories/1
  # GET /issue_locker_histories/1.json
  def show
  end

  # GET /issue_locker_histories/new
  def new
    @issue_locker_history = IssueLockerHistory.new
  end

  # GET /issue_locker_histories/1/edit
  def edit
  end

  # POST /issue_locker_histories
  # POST /issue_locker_histories.json
  def create
    @issue_locker_history = IssueLockerHistory.new(issue_locker_history_params)

    respond_to do |format|
      if @issue_locker_history.save
        format.html { redirect_to @issue_locker_history, notice: 'Issue locker history was successfully created.' }
        format.json { render :show, status: :created, location: @issue_locker_history }
      else
        format.html { render :new }
        format.json { render json: @issue_locker_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_locker_histories/1
  # PATCH/PUT /issue_locker_histories/1.json
  def update
    respond_to do |format|
      if @issue_locker_history.update(issue_locker_history_params)
        format.html { redirect_to @issue_locker_history, notice: 'Issue locker history was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_locker_history }
      else
        format.html { render :edit }
        format.json { render json: @issue_locker_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_locker_histories/1
  # DELETE /issue_locker_histories/1.json
  def destroy
    @issue_locker_history.destroy
    respond_to do |format|
      format.html { redirect_to issue_locker_histories_url, notice: 'Issue locker history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_locker_history
      @issue_locker_history = IssueLockerHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_locker_history_params
      params.require(:issue_locker_history).permit(:issue_locker_id, :issue_request_id, :employee_id, :status)
    end
end
