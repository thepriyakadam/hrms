class AccessIssueRequestsController < ApplicationController
  before_action :set_access_issue_request, only: [:show, :edit, :update, :destroy]

  # GET /access_issue_requests
  # GET /access_issue_requests.json
  def index
    @access_issue_requests = AccessIssueRequest.all
  end

  # GET /access_issue_requests/1
  # GET /access_issue_requests/1.json
  def show
  end

  # GET /access_issue_requests/new
  def new
    @access_issue_request = AccessIssueRequest.new
  end

  # GET /access_issue_requests/1/edit
  def edit
  end

  # POST /access_issue_requests
  # POST /access_issue_requests.json
  def create
    @access_issue_request = AccessIssueRequest.new(access_issue_request_params)

    respond_to do |format|
      if @access_issue_request.save
        format.html { redirect_to @access_issue_request, notice: 'Issue Access Request was successfully created.' }
        format.json { render :show, status: :created, location: @access_issue_request }
      else
        format.html { render :new }
        format.json { render json: @access_issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_issue_requests/1
  # PATCH/PUT /access_issue_requests/1.json
  def update
    respond_to do |format|
      if @access_issue_request.update(access_issue_request_params)
        format.html { redirect_to @access_issue_request, notice: 'Issue Access Request was successfully updated.'}
        format.json { render :show, status: :ok, location: @access_issue_request }
      else
        format.html { render :edit }
        format.json { render json: @access_issue_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_issue_requests/1
  # DELETE /access_issue_requests/1.json
  def destroy
    @access_issue_request.destroy
    respond_to do |format|
      format.html { redirect_to access_issue_requests_url, notice: 'Issue Access Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_issue_request
      @access_issue_request = AccessIssueRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_issue_request_params
      params.require(:access_issue_request).permit(:issue_tracker_access_id, :issue_request_id, :status, :current_status)
    end
end
