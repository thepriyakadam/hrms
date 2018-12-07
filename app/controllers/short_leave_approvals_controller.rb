class ShortLeaveApprovalsController < ApplicationController
  before_action :set_short_leave_approval, only: [:show, :edit, :update, :destroy]

  # GET /short_leave_approvals
  # GET /short_leave_approvals.json
  def index
    @short_leave_approvals = ShortLeaveApproval.all
  end

  # GET /short_leave_approvals/1
  # GET /short_leave_approvals/1.json
  def show
  end

  # GET /short_leave_approvals/new
  def new
    @short_leave_approval = ShortLeaveApproval.new
  end

  # GET /short_leave_approvals/1/edit
  def edit
  end

  # POST /short_leave_approvals
  # POST /short_leave_approvals.json
  def create
    @short_leave_approval = ShortLeaveApproval.new(short_leave_approval_params)

    respond_to do |format|
      if @short_leave_approval.save
        format.html { redirect_to @short_leave_approval, notice: 'Short leave approval was successfully created.' }
        format.json { render :show, status: :created, location: @short_leave_approval }
      else
        format.html { render :new }
        format.json { render json: @short_leave_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_leave_approvals/1
  # PATCH/PUT /short_leave_approvals/1.json
  def update
    respond_to do |format|
      if @short_leave_approval.update(short_leave_approval_params)
        format.html { redirect_to @short_leave_approval, notice: 'Short leave approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_leave_approval }
      else
        format.html { render :edit }
        format.json { render json: @short_leave_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_leave_approvals/1
  # DELETE /short_leave_approvals/1.json
  def destroy
    @short_leave_approval.destroy
    respond_to do |format|
      format.html { redirect_to short_leave_approvals_url, notice: 'Short leave approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_leave_approval
      @short_leave_approval = ShortLeaveApproval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_leave_approval_params
      params.require(:short_leave_approval).permit(:short_leave_request_id, :employee_id, :status)
    end
end
