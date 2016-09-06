class IssueRequestsController < ApplicationController
  before_action :set_issue_request, only: [:show, :edit, :update, :destroy]

  # GET /issue_requests
  # GET /issue_requests.json
  def index
    @issue_requests = IssueRequest.all
  end

  # GET /issue_requests/1
  # GET /issue_requests/1.json
  def show
  end

  # GET /issue_requests/new
  def new
    @issue_request = IssueRequest.new
  end

  # GET /issue_requests/1/edit
  def edit
  end

  # POST /issue_requests
  # POST /issue_requests.json
  def create
    @issue_request = IssueRequest.new(issue_request_params)

    respond_to do |format|
      if @issue_request.save
        format.html { redirect_to @issue_request, notice: 'Issue request was successfully created.' }
        format.json { render :show, status: :created, location: @issue_request }
      else
        format.html { render :new }
        format.json { render json: @issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_requests/1
  # PATCH/PUT /issue_requests/1.json
  def update
    respond_to do |format|
      if @issue_request.update(issue_request_params)
        format.html { redirect_to @issue_request, notice: 'Issue request was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_request }
      else
        format.html { render :edit }
        format.json { render json: @issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_requests/1
  # DELETE /issue_requests/1.json
  def destroy
    @issue_request.destroy
    respond_to do |format|
      format.html { redirect_to issue_requests_url, notice: 'Issue request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_request
      @issue_request = IssueRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_request_params
      params.require(:issue_request).permit(:issue_master_id, :issue_tracker_member_id, :issue_tracker_group_id, :description, :date, :time, :employee_id, :issue_priority, :status_id, :is_confirm_id)
    end
end
