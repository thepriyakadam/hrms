class LoanRequestsController < ApplicationController
  before_action :set_loan_request, only: [:show, :edit, :update, :destroy]

  # GET /loan_requests
  # GET /loan_requests.json
  def index
    @loan_requests = LoanRequest.all
  end

  # GET /loan_requests/1
  # GET /loan_requests/1.json
  def show
  end

  # GET /loan_requests/new
  def new
    @loan_request = LoanRequest.new
  end

  # GET /loan_requests/1/edit
  def edit
  end

  # POST /loan_requests
  # POST /loan_requests.json
 def create
    @loan_request = LoanRequest.new(loan_request_params)
    if @loan_request.is_there?
      flash[:alert] = "Your Request already has been sent"
      # redirect_to new_loan_request_path
     else
    @amount = params[:loan_request][:amount]
    @a = @amount.to_f
    @approval_process = ApprovalProcess.where(status: true)
      @approval_process.each do |ap|
        # byebug
         if @a.between?(ap.from,ap.to)
            @loan_request.save
            LoanRequest.where(id: @loan_request.id).update_all(status: "Pending",request_to_id: ap.membership.employee_id)
            @loanrequest = LoanRequest.find_by(id: @loan_request.id)
            LoanRequestMailer.pending(@loanrequest).deliver_now
            flash[:notice] = 'Loan request created successfully'
         else 
          flash[:alert] = 'Approval Process not sent please contact to admin'
         end
      end
     redirect_to loan_requests_path
    end
 end#create


  # PATCH/PUT /loan_requests/1
  # PATCH/PUT /loan_requests/1.json
  def update
    respond_to do |format|
      if @loan_request.update(loan_request_params)
        format.html { redirect_to @loan_request, notice: 'Loan request was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_request }
      else
        format.html { render :edit }
        format.json { render json: @loan_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_requests/1
  # DELETE /loan_requests/1.json
  def destroy
    @loan_request.destroy
    respond_to do |format|
      format.html { redirect_to loan_requests_url, notice: 'Loan request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def loan_approval
    @loan_requests = LoanRequest.where(request_to_id: current_user.employee_id,status: 'Pending')
  end

  def approve_loan_request
    @loan_request = LoanRequest.find(params[:format])
  end

  def first_approve
     # byebug
    @loan_request = LoanRequest.find(params[:format])
    @loan_requests = LoanRequest.where(id: @loan_request.id).update_all(status: "Approved")
    LoanApproval.create(loan_request_id: @loan_request.id,membership_id: @loan_request.membership_id,loan_type_id: @loan_request.loan_type_id,amount: @loan_request.amount,no_of_emi: @loan_request.no_of_emi,emi: @loan_request.emi,loan_request_date: @loan_request.date,loan_approval_date: Date.today,status: "Approved")
     
    @loan_approval = LoanApproval.find_by(loan_request_id: @loan_request.id)

    start_date = Date.today

    for i in 1..@loan_approval.no_of_emi.to_i
      @loan_approval.loan_emis.create(emi_amount: @loan_approval.emi,date: start_date)
      start_date = start_date.next_month
    end
    redirect_to loan_approval_loan_requests_path
  end

  def reject
    @loan_request = LoanRequest.find(params[:format])
    @loan_requests = LoanRequest.where(id: @loan_request.id).update_all(status: "Rejected")
    LoanRequestMailer.reject(@loan_request).deliver_now
    redirect_to loan_approval_loan_requests_path
  end

  def final_approve
    @loan_approvals = LoanApproval.where(status: "Approved")
  end

  def final_loan_request
    @loan_approval = LoanApproval.find(params[:format])
  end

  def final
    # byebug
    @loan_approval = LoanApproval.find(params[:format])
    LoanApproval.where(id: @loan_approval.id).update_all(status: "Final Approved")
    LoanRequest.where(id: @loan_approval.loan_request_id).update_all(status: "Final Approved")
    redirect_to final_approve_loan_requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_request
      @loan_request = LoanRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_request_params
      params.require(:loan_request).permit(:membership_id, :date, :loan_type_id, :emi,:status,:amount,:no_of_emi)
    end
end
