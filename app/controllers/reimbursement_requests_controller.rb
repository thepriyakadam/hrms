class ReimbursementRequestsController < ApplicationController
  before_action :set_reimbursement_request, only: [:show, :edit, :update, :destroy]

  # GET /reimbursement_requests
  # GET /reimbursement_requests.json
  def index
    @reimbursement_requests = ReimbursementRequest.all
  end

  # GET /reimbursement_requests/1
  # GET /reimbursement_requests/1.json
  def show
  end

  # GET /reimbursement_requests/new
  def new
    @reimbursement_request = ReimbursementRequest.new
  end

  # GET /reimbursement_requests/1/edit
  def edit
  end

  # POST /reimbursement_requests
  # POST /reimbursement_requests.json
  def create
    @reimbursement_request = ReimbursementRequest.new(reimbursement_request_params)

    respond_to do |format|
      if @reimbursement_request.save
        format.html { redirect_to @reimbursement_request, notice: 'Reimbursement request was successfully created.' }
        format.json { render :show, status: :created, location: @reimbursement_request }
      else
        format.html { render :new }
        format.json { render json: @reimbursement_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reimbursement_requests/1
  # PATCH/PUT /reimbursement_requests/1.json
  def update
    respond_to do |format|
      if @reimbursement_request.update(reimbursement_request_params)
        format.html { redirect_to @reimbursement_request, notice: 'Reimbursement request was successfully updated.' }
        format.json { render :show, status: :ok, location: @reimbursement_request }
      else
        format.html { render :edit }
        format.json { render json: @reimbursement_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reimbursement_requests/1
  # DELETE /reimbursement_requests/1.json
  def destroy
    @reimbursement_request.destroy
    respond_to do |format|
      format.html { redirect_to reimbursement_requests_url, notice: 'Reimbursement request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_for_approval
    @reimbursement_request = ReimbursementRequest.find(params[:format])
    @reimbursement_request.update(status: "Send For Approval")
    flash[:notice] = "Request Send For Approval!"
    redirect_to reimbursement_request_self_services_path
  end

  def approval_list
    @reimbursement_requests = ReimbursementRequest.where(status: "Send For Approval")
  end

  def approve
    @reimbursement_request = ReimbursementRequest.find(params[:format])
    @reimbursement_request.update(status: "Approved",approval_id: current_user.employee_id)
    flash[:notice] = "Request Approved Successfully!"
    redirect_to list_for_approval_reimbursement_requests_path
  end

  def reject
    @reimbursement_request = ReimbursementRequest.find(params[:format])
    @reimbursement_request.update(status: "Pending",approval_id: current_user.employee_id)
    flash[:notice] = "Request Rejected Successfully!"
    redirect_to list_for_approval_reimbursement_requests_path
  end

  # def edit_request_modal
  #   @reimbursement_request = ReimbursementRequest.find(params[:format])
  # end

  # def update_request_modal
  #   @reimbursement_request = ReimbursementRequest.find(params[:reimbursement_request_id])
  #   # reimbursement_head_id = params[:reimbursement_request][:reimbursement_head_id]
  #   # date = params[:reimbursement_request][:date]
  #   # amount = params[:reimbursement_request][:amount]
  #   # @reimbursement_request.update(reimbursement_head_id: reimbursement_head_id,date: date,amount: amount)
  #   @reimbursement_request.update(reimbursement_request_params)
  #   flash[:notice] = "Request Updated Successfully!"
  #   redirect_to reimbursement_request_self_services_path
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement_request
      @reimbursement_request = ReimbursementRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reimbursement_request_params
      params.require(:reimbursement_request).permit(:employee_id, :reimbursement_head_id, :date, :amount, :status, :approval_id)
    end
end
