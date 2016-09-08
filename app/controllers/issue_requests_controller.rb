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
        IssueRequestMailer.issue_tracker_group_email(@issue_request).deliver_now
        format.html { redirect_to @issue_request, notice: 'Issue request was successfully saved Successfully.' }
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

  
  def is_confirm
    @issue_request = IssueRequest.find(params[:issue_request])
    IssueRequest.find(@issue_request.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_request_path
  end

  def download_screenshot
    @issue_request = IssueRequest.find(params[:id])
    send_file @issue_request.document1.path,
              filename: @issue_request.document1_file_name,
              type: @issue_request.document1_content_type,
              disposition: 'attachment'
  end

  def download_screenshot_image
    @issue_request = IssueRequest.find(params[:id])
    send_file @issue_request.document2.path,
              filename: @issue_request.document2_file_name,
              type: @issue_request.document2_content_type,
              disposition: 'attachment'
  end

  def lock_request_list
     @issue_requests = IssueRequest.all
  end

  def lock_request
     @issue_request = IssueRequest.find(params[:format])
     IssueLocker.create(issue_request_id: @issue_request.id,employee_id: @issue_request.employee_id,status: @issue_request.status)
     flash[:notice] = "Issue Request Locked Successfully"
     redirect_to lock_request_list_issue_requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_request
      @issue_request = IssueRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_request_params
      params.require(:issue_request).permit(:issue_master_id, :issue_tracker_member_id, :issue_tracker_group_id, :description, :date, :time, :employee_id, :issue_priority, :status, :is_confirm_id, :document1, :document2)
    end
end
